////
////  HSBCException.swift
////  HansExceptionTest
////
////  Created by huangjianwu on 2018/5/11.
////  Copyright © 2018年 huangjianwu. All rights reserved.
////
//
//import Foundation
//
//public protocol HSBCExceptionProtocol {
//    var title: String {
//        get
//    }
//    var content: String {
//        get
//    }
//    var confirmTitle: String {
//        get
//    }
//    var hasClose: Bool {
//        get
//    }
//    
//    var exception: HSBCException {
//        get
//    }
//    
//    var actions: HSBCExceptionAction {
//        get
//    }
//    
//    var code: String {
//        get
//    }
//}
//
//enum HSBCExceptionType {
//    case toast
//    case alert1
//    case alert2
//    case alert3
//}
//
//extension HSBCExceptionType :HSBCExceptionProtocol{
//    var actions: HSBCExceptionAction {
//        return .backUp
//    }
//    
//    var exception: HSBCException {
//        return .httpError("", , NSError())
//    }
//    
//    var title: String {
//        switch self {
//        case .toast:
//            return ""
//            
//        default:
//            return ""
//        }
//    }
//    
//    var content: String {
//        switch self {
//        case .toast:
//            break
//        default:
//            break
//        }
//        return ""
//    }
//    
//    var confirmTitle: String {
//        return ""
//    }
//    
//    var hasClose: Bool {
//        return false
//    }
//    
//    
//}
//
public enum BusinessErrorType :String{
    case none = ""
    case eApi = "E"
    case sApi = "S"
}
//
//public enum HSBCException {
//    case httpError(String,String,NSError)
//    case businessError(String,String,NSError,[HSBCExceptionAction],BusinessError)
//}
//
//enum HSBCExceptionTitle :String{
//    case sorry = "sorry"
//    case oop = "oops"
//    case custom = ""
//}
//
//struct HSBCExceptionActionItem {
//    var actions : [HSBCExceptionAction]!
//    var actionTitle : String!
//}
//
public struct HSBCExceptionAction :OptionSet {
    public let rawValue: Int
    
    static let backup = HSBCExceptionAction(rawValue: 1)
    static let logout = HSBCExceptionAction(rawValue: 2)
//    static let swimming = Sports(rawValue: 4)
//    static let fencing = Sports(rawValue: 8)
//    static let shooting = Sports(rawValue: 32)
//    static let horseJumping = Sports(rawValue: 512)
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

}
//
//
//
//struct Popup {
//    var aa: String {
//        return "aa"
//    }
//    
//}
