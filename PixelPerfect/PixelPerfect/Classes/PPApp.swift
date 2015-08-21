//
//  App.swift
//  PixelPerfect
//
//  Created by Stanislaw Pankevich on 19/05/15.
//  Copyright (c) 2015 Stanislaw Pankevich. All rights reserved.
//

import Cocoa

public class PPApp: NSObject {

    public private(set) var nsApp: NSApplication!

    public func setup(_nsApp: NSApplication!) {
        assert(_nsApp != nil, "")

        println(nsApp)
        nsApp = _nsApp
        println(nsApp)
    }

    public static let sharedApp = PPApp()
}
