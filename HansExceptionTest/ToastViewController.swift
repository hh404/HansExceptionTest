//
//  ToastViewController.swift
//  HansExceptionTest
//
//  Created by huangjianwu on 2018/5/12.
//  Copyright © 2018年 huangjianwu. All rights reserved.
//

import UIKit


typealias ActionBtnClick = () -> ()
class ToastViewController: BasePopupViewController {

    enum Const {
        static let popupDuration: TimeInterval = 0.3
        static let transformDuration: TimeInterval = 0.4
        static let topPopupOption = PopupOption(shapeType: .normal, viewType: .toast, direction: .top, hasBlur: false)
        static let bottomPopupOption = PopupOption(shapeType: .normal, viewType: .toast, direction: .bottom, hasBlur: false)
    }
    
    var isTop: Bool = true
    var popupItem: PopupItem?
    let label = UILabel()
    var exception :ApiException?
    
    private let topPopupItem = PopupItem(view: UILabel(), height: 100, maxWidth: 500, popupOption: Const.topPopupOption)
    private let bottomPopupItem = PopupItem(view: UILabel(), height: 100, maxWidth: 500, popupOption: Const.bottomPopupOption)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        label.backgroundColor = UIColor.blue
//        label.text = "3ewqe"
//        let item = PopupItem(view: label, height: 100, maxWidth: 500, popupOption: Const.topPopupOption)
//        if isTop {
//            popupItem = item
////            configurePopupItem(popupItem!)
//        } else {
//            popupItem = bottomPopupItem
////            configurePopupItem(popupItem!)
//        }
//    configurePopupItem(item)
        self.view.backgroundColor = UIColor.red
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let popupItem = popupItem {
//            view.configureDemoToastView(popupItem: popupItem)
            popupItem.view.backgroundColor = UIColor.yellow
        }
        
        DispatchQueue.main.asyncAfter( deadline: DispatchTime.now() + 3.0 ) { [weak self] in
            guard let me = self, let popupItem = me.popupItem else { return }
            self?.dismissPopupView(duration: Const.popupDuration, curve: .easeInOut, direction: (self?.popupItem?.popupOption.direction)!) { _ in
                PopupWindowManager.shared.changeKeyWindow(rootViewController: nil)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

}
