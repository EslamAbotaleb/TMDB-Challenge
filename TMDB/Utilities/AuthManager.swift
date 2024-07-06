//
//  AuthManager.swift
//  TMDB
//
//  Created by Eslam on 06/07/2024.
//

import Foundation

class AuthManager {
    static var shared = AuthManager()
    var token: String = ""{
        didSet{
            UserDefaults.standard.set(token, forKey: "Token")
        }
    }
}
