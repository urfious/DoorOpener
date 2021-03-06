//
//  EnteredRoomInteractor.swift
//  Door Opener
//
//  Created by Luka Usalj on 16/05/16.
//  Copyright (c) 2016 FER. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import Alamofire

final class EnteredRoomInteractor: NSObject, EnteredRoomInteractorInterface {
    
    // MARK: - Internal functions -
    func leaveRoomWithID(roomID: String, token: String, success: () -> (), failure: (error: String) -> ()) {
        Alamofire.request(.POST, baseURL + "/mobile/exit", parameters: nil, encoding: .JSON, headers: ["Content-Type": "application/json", "Authorization": "Bearer " + token]).responseJSON { (response) in
            switch response.result {
            case .Failure(let error):
                failure(error: error.localizedDescription)
            case .Success(_):
                success()
            }
        }
    }
    
    // MARK: - Private functions -
    
}
