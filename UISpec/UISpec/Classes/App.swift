//
//  App.swift
//  UISpec
//
//  Created by Stanislaw Pankevich on 19/05/15.
//  Copyright (c) 2015 Stanislaw Pankevich. All rights reserved.
//

import Cocoa

public let PP = App()

public class App: NSObject {

    public private(set) var nsApp: NSApplication!
    public static let currentRunningApplication = NSRunningApplication.currentApplication()

    public var stage: StageUseCase!

    let construction    = Construction()
    let userEventSource = UserEventSource()

    public func setup(_nsApp: NSApplication!) {
        nsApp = _nsApp

        StageUseCaseSetup(app: self).execute()
    }
}
