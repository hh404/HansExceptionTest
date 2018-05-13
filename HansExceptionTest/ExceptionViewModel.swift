//
//  ExceptionViewModel.swift
//  HansExceptionTest
//
//  Created by huangjianwu on 2018/5/12.
//  Copyright © 2018年 huangjianwu. All rights reserved.
//

import UIKit
import SwiftyJSON

class ExceptionViewModel: NSObject {
    var dataArray: [HSBCException] = []
    
    func initDataArray()  {
        do{
            let data = try Data(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "exception", ofType: "json")!))
            if let statusesArray = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]]{
                for item in statusesArray!{
                    do {
                        let jsonData = try JSON(item)
                        let model = HSBCException(fromJson: jsonData)
                        dataArray.append(model)
                        print(model)
                    }
                    catch{
                    }
                }
            }
        }
        catch{
            
        }
    }
}
