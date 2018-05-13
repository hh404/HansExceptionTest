//
//  AppDelegate.swift
//  HansExceptionTest
//
//  Created by huangjianwu on 2018/5/11.
//  Copyright © 2018年 huangjianwu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        /*do{
        let data = try Data(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "exception", ofType: "json")!))
            let arr :[[String:Any]] = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [Dictionary]
            print(arr)
            for item in arr {
                print(item)
                let apiException: [[String:Any]] = item["apiException"] as! [[String : Any]]
                let apiName = item["apiName"]
                print(apiName)
                for item1 in apiException {
                    let businessType :String = item1["businessType"]! as! String
                    let code :String = item1["code"]! as! String
                    let description :String = item1["description"]! as! String
                    let subCode :String = item1["subCode"]! as! String
                    let viewType :String = item1["viewType"]! as! String
                    let title :String = item1["title"] as! String ?? ""
                    let isShowCloseBtn: Bool = (item1["isShowCloseBtn"] as! NSNumber).boolValue
                    let action: [String:Any] = item1["action"]! as! [String : Any]
                    let actions: [String] = action["actions"] as! [String] ?? [""]
                    let actionTitle: String = action["title"] as! String ?? ""
                    for item2 in actions {
                        print("item2:",item2)
                    }
                    print(businessType,code,description,subCode,viewType)
//                    let exception: HSBCException = .businessError(<#T##String#>, <#T##NSError#>, <#T##BusinessError#>)
                }
            }
        }
        catch{
            
        }*/
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func delay(delay: Double, closure: @escaping () -> ()) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
}

