//
//  App.swift
//  PixelPerfect
//
//  Created by Stanislaw Pankevich on 19/05/15.
//  Copyright (c) 2015 Stanislaw Pankevich. All rights reserved.
//

import Cocoa

public let PP = App()

public class App: NSObject {

    public private(set) var nsApp: NSApplication!

    public func setup(_nsApp: NSApplication!) {
        nsApp = _nsApp
    }
}
