//
//  OpenDoorInterfaces.swift
//  Door Opener
//
//  Created by Luka Usalj on 16/05/16.
//  Copyright (c) 2016 FER. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import UIKit

// MARK: - Navigation -
enum  OpenDoorNavigationAction {
    case EnterRoom
    case GoToLoginScreen
}

// MARK: - OpenDoor Wireframe Interface -
protocol OpenDoorWireframeInterface: WireframeInterface {
    func performNavigationAction(action: OpenDoorNavigationAction)
    func configureModuleWith(viewController: OpenDoorViewController)
}

// MARK: - OpenDoor View Interface -
protocol OpenDoorViewInterface: ViewInterface {
    func setViewTitle(title: String)
}

// MARK: - OpenDoor View Presenter (Delegate) Interface -
protocol OpenDoorViewDelegateInterface: PresenterInterface {
    func didTouchEnterRoomButton()
}

// MARK: - OpenDoor Interactor Interface -
protocol OpenDoorInteractorInterface: InteractorInterface {
    func openRoomWithID(roomID: String, token: String, success: () -> (), failure: (error: String) -> ())
}
