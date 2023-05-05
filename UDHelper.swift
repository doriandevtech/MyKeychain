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
    
    func getUrl() -> [String] {
        if let array = userDefaults.array(forKey: itemUrlKey) as? [String] {
            return array
        }
        return []
    }
    
    func setUrl(_ newValue: String) {
        var a = getUrl()
        a.append(newValue)
        userDefaults.set(a, forKey: itemUrlKey)
    }
    
    func getUser() -> [String] {
        if let array = userDefaults.array(forKey: itemUserKey) as? [String] {
            return array
        }
        return []
    }
    
    func setUser(_ newValue: String) {
        var a = getUser()
        a.append(newValue)
        userDefaults.set(a, forKey: itemUserKey)
    }
    
    func getPwd() -> [String] {
        if let array = userDefaults.array(forKey: itemPwdKey) as? [String] {
            return array
        }
        return []
    }
    
    func setPwd(_ newValue: String) {
        var a = getPwd()
        a.append(newValue)
        userDefaults.set(a, forKey: itemPwdKey)
    }
}
