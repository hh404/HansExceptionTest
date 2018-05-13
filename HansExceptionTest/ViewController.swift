//
//  ViewController.swift
//  HansExceptionTest
//
//  Created by huangjianwu on 2018/5/11.
//  Copyright © 2018年 huangjianwu. All rights reserved.
//

import UIKit
import SwiftyJSON
import SnapKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    let viewModel = ExceptionViewModel()
    var currentIndexPath :IndexPath?
    let tableView = UITableView(frame: .zero, style: .plain)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewModel.initDataArray()
      self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataArray[section].apiException.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        let item = viewModel.dataArray[indexPath.section]
        cell?.textLabel?.text = item.apiName + item.code + (item.apiException[indexPath.row].subCode)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.dataArray[indexPath.section]
        currentIndexPath = indexPath
        if(item.apiException[indexPath.row].viewType == "toast"){
            let rootViewController = ToastViewController()
            rootViewController.isTop = true
            rootViewController.exception = item.apiException[indexPath.row]
            let label = UILabel()
            label.textAlignment = .center
            label.backgroundColor = UIColor.blue
            label.text = item.apiException[indexPath.row].descriptionField
            let topPopupOption = PopupOption(shapeType: .normal, viewType: .toast, direction: .top, hasBlur: false)
            let item1 = PopupItem(view: label, height: 100, maxWidth: 500, popupOption: topPopupOption)
            rootViewController.configurePopupItem(item1)
            rootViewController.popupItem = item1
            rootViewController.label.text = item.apiException[indexPath.row].descriptionField
            PopupWindowManager.shared.changeKeyWindow(rootViewController:  rootViewController)
        }
        else{
            let alertController = UIAlertController(title: item.apiException[indexPath.row].title,
                                                    message: item.apiException[indexPath.row].descriptionField, preferredStyle: .alert)

            let okAction = UIAlertAction(title: item.apiException[indexPath.row].action.actionTitle, style: .default, handler: {
                action in
                //print("点击了确定")
                self.doneClick(0)
            })
//            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
      
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let item = viewModel.dataArray[section]
        return item.apiName
    }
    
    func doneClick(_ index :Int)  {
        let item = viewModel.dataArray[(currentIndexPath?.section)!]
        if(item.apiException[(currentIndexPath?.row)!].action.actions.contains(.backup)){
            //
            print("backup call")
        }
        if(item.apiException[(currentIndexPath?.row)!].action.actions.contains(.logout)){
            print("logout call")
        }
    }

}


