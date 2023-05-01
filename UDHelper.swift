//
//  UDHelper.swift
//  MyKeychain
//
//  Created by Dorian Emenir on 01/05/2023.
//

import Foundation

class UDHelper {
    
    static var shared = UDHelper()
    
    private let userDefaults = UserDefaults.standard
    private let itemUrlKey = "UrlKey"
    private let itemUserKey = "UserKey"
    private let itemPwdKey = "PwdKey"
    
    func getArray() -> [String] {
        if let array = userDefaults.array(forKey: itemUserKey) as? [String] {
            return array
        }
        return []
    }
}
