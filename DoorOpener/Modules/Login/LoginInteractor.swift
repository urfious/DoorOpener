//
//  LoginInteractor.swift
//  Door Opener
//
//  Created by Luka Usalj on 16/05/16.
//  Copyright (c) 2016 FER. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import Alamofire

final class LoginInteractor: NSObject, LoginInteractorInterface {
    
    // MARK: - Internal functions -
    
    func requestTokenForUserWith(username: String, password: String,
                                 success: (token: String) -> (),
                                 failure: (error: String) -> ()) {
        Alamofire.request(.POST, baseURL + "/mobile/login",
            parameters: ["username": username, "password": password],
            encoding: .JSON,
            headers: ["Content-Type": "application/json"])
            .responseJSON { (response) in
                
                switch response.result {
                case .Failure(let error):
                    print(error)
                case .Success(let responseObject):
                    guard let token = responseObject.objectForKey("token") as? String else {
                        failure(error: "Cannot find token in response object")
                        return
                    }
                    success(token: token)
                }
        }
    }
}
