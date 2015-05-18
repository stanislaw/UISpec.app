//
//  AppDelegate.swift
//  PixelPerfect
//
//  Created by Stanislaw Pankevich on 18/05/15.
//  Copyright (c) 2015 Stanislaw Pankevich. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(aNotification: NSNotification) {

        let mainScreen: NSScreen = NSScreen.mainScreen()!
        println(mainScreen.deviceDescription)

        let screenSize: NSSize = mainScreen.deviceDescription[NSDeviceSize]!.sizeValue
        println()
        println(screenSize)
        println()

        let window: NSWindow = NSApplication.sharedApplication().windows.first as! NSWindow

//        window.sho = false

        let windowWidth: CGFloat  = 200
        let windowHeight: CGFloat = 200

        let windowX: CGFloat = (screenSize.width  - windowWidth)  / 2
        let windowY: CGFloat = (screenSize.height - windowHeight) / 2

        window.setFrame(CGRectMake(windowX, windowY, windowWidth, windowHeight), display: true)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

