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
    
//    MARK: Setting up Getters and Setters
    
    /// Gets the "url" store in the userDefaults.array
    /// - Returns: [list of urls stored in userDefaults]
    func getUrl() -> [String] {
        if let array = userDefaults.array(forKey: itemUrlKey) as? [String] {
            return array
        }
        return []
    }
    
    /// Sets the "url" and add it to the userDefaults.array
    func setUrl(_ newValue: String) {
        var a = getUrl()
        a.append(newValue)
        userDefaults.set(a, forKey: itemUrlKey)
    }
    
    /// Gets the "user" store in the userDefaults.array
    /// - Returns: [list of users stored in userDefaults]
    func getUser() -> [String] {
        if let array = userDefaults.array(forKey: itemUserKey) as? [String] {
            return array
        }
        return []
    }
    
    /// Sets the "user" and add it to the userDefaults.array
    func setUser(_ newValue: String) {
        var a = getUser()
        a.append(newValue)
        userDefaults.set(a, forKey: itemUserKey)
    }
    
    /// Gets the "password" store in the userDefaults.array
    /// - Returns: [list of passwords stored in userDefaults]
    func getPwd() -> [String] {
        if let array = userDefaults.array(forKey: itemPwdKey) as? [String] {
            return array
        }
        return []
    }
    
    /// Sets the "pwd" and add it to the userDefaults.array
    func setPwd(_ newValue: String) {
        var a = getPwd()
        a.append(newValue)
        userDefaults.set(a, forKey: itemPwdKey)
    }
    
    /// Removes all the values at a given userDefaults.array's index
    func removeFromArray(_ index: Int) {
        var a = getUser()
        a.remove(at: index)
        userDefaults.set(a, forKey: itemUserKey)
        a = getUrl()
        a.remove(at: index)
        userDefaults.set(a, forKey: itemUrlKey)
        a = getPwd()
        a.remove(at: index)
        userDefaults.set(a, forKey: itemPwdKey)
    }
}
