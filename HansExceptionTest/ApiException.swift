//
//	ApiException.swift
//
//	Create by 建武 黄 on 12/5/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class ApiException : NSObject{

	var action : ExceptionAction = ExceptionAction()
	var businessType : BusinessErrorType = .none
	var descriptionField : String = ""
	var isShowCloseBtn : Bool = false
	var subCode : String = ""
	var title : String = ""
	var viewType : String = ""


    convenience override init() {
        self.init(fromJson: JSON(NSData()))
    }
	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		let actionJson = json["action"]
		if !actionJson.isEmpty{
			action = ExceptionAction(fromJson: actionJson)
		}
        businessType = BusinessErrorType(rawValue:json["businessType"].stringValue)!
		descriptionField = json["description"].stringValue
		isShowCloseBtn = json["isShowCloseBtn"].boolValue
		subCode = json["subCode"].stringValue
		title = json["title"].stringValue
		viewType = json["viewType"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        dictionary["action"] = action.toDictionary()
        dictionary["businessType"] = businessType.rawValue
        dictionary["description"] = descriptionField
        dictionary["isShowCloseBtn"] = isShowCloseBtn
        dictionary["subCode"] = subCode
        dictionary["title"] = title
        dictionary["viewType"] = viewType
        
        return dictionary
    }
    
    override var description: String{
        let r = Mirror(reflecting: self)
        var str = ""
        for i in r.children {
            str.append(i.label!)
            str.append(":")
            str.append(String(describing: i.value))
            str.append("\n")
        }
        return str
    }
}
