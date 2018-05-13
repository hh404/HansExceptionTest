//
//	HSBCException.swift
//
//	Create by 建武 黄 on 12/5/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class HSBCException : NSObject{

	var apiException : [ApiException] = []
	var apiName : String = ""
	var code : String = ""


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		apiException = [ApiException]()
		let apiExceptionArray = json["apiException"].arrayValue
		for apiExceptionJson in apiExceptionArray{
			let value = ApiException(fromJson: apiExceptionJson)
			apiException.append(value)
		}
		apiName = json["apiName"].stringValue
		code = json["code"].stringValue
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        var dictionaryElements = [[String:Any]]()
        for apiExceptionElement in apiException {
            dictionaryElements.append(apiExceptionElement.toDictionary())
        }
        dictionary["apiException"] = dictionaryElements
        dictionary["apiName"] = apiName
        dictionary["code"] = code
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
