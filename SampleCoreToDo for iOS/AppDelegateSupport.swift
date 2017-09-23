//
//  AppDelegateSupport.swift
//  SampleCoreToDo for iOS
//
//  Created by jabe0958 on 2017/09/18.
//  Copyright © 2017年 jabe0958. All rights reserved.
//

import Foundation
import UIKit

final class AppDelegateSupport {
    
    static private let keyByteLengthAES256 = 32 // 256(bits) / 8(bits/byte) = 32byte = 32 characters in utf8's ascii.
    
    static private var loginViewController: UIViewController? = nil
    
    static private var beforeEnterBackgroundRootViewController: UIViewController? = nil
    
    static private var instatiatedLoginViewController = false
    
    static private var logined = false
    
    static private var hashedLoginPassword: String? = nil
    
    static func viewDidEnterBackground(_ window: UIWindow?) {
        loginViewController = window?.rootViewController?.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
        beforeEnterBackgroundRootViewController = window?.rootViewController
        window?.rootViewController = loginViewController
        window?.makeKeyAndVisible()
    }
    
    static func getBeforeEnterBackgroundRootViewController() -> UIViewController? {
        return beforeEnterBackgroundRootViewController
    }
    
    static func login() {
        logined = true
    }
    
    static func isLogined() -> Bool {
        return logined
    }
    
    static func getHashedLoginPassword() -> String {
        return hashedLoginPassword!
    }
    
    static func setHashedLoginPassword(hashedLoginPassword: String) {
        if hashedLoginPassword.characters.count > 32 {
            self.hashedLoginPassword = hashedLoginPassword.substring(to: hashedLoginPassword.index(hashedLoginPassword.startIndex, offsetBy: keyByteLengthAES256))
        } else {
            self.hashedLoginPassword = hashedLoginPassword
        }
    }
}
