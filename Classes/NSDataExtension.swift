//
//  NSDataExtension.swift
//  SwiftExtension
//
//  Created by Dhvl Golakiya on 04/04/16.
//  Copyright © 2016 Dhvl Golakiya. All rights reserved.
//

import Foundation
import UIKit

extension NSData {
    //  Convert NSData to NSDictionary
    public var toDictionary : NSDictionary! {
        let JSONData = self
        do {
            let JSON = try JSONSerialization.jsonObject(with: JSONData as Data, options:JSONSerialization.ReadingOptions(rawValue: 0))
            guard let dictioonary :NSDictionary = JSON as? NSDictionary else {
                print("Not a Dictionary")
                // put in function
                return nil
            }
            return dictioonary
        }
        catch let JSONError as NSError {
            print("\(JSONError)")
        }
        return nil
    }
    
    //  Convert NSData to String
    public var toJsonString : NSString! {
//        return NSString(data: (((self as Data) as Data) as Data) as Data, encoding: NSUTF8StringEncoding.rawValue) as String?
        
        let data = self as Data
        return NSString(data: data, encoding: String.Encoding.utf8.rawValue)
    }
}

extension NSMutableData {
    
    //  Append String data to NSData
    public func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}
