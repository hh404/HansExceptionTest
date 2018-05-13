//
//	Action.swift
//
//	Create by 建武 黄 on 12/5/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class ExceptionAction : NSObject{

	var actionTitle : String = ""
	var actions : HSBCExceptionAction = []

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
		actionTitle = json["actionTitle"].stringValue
		let actionsArray = json["actions"].arrayValue
		for actionsJson in actionsArray{
			//actions.append(actionsJson.stringValue)
            if(actionsJson.stringValue == "backup"){
                actions.insert(.backup)
            }
            else if(actionsJson.stringValue == "logout"){
                actions.insert(.logout)
            }
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        dictionary["actionTitle"] = actionTitle
        dictionary["actions"] = actions
        
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
