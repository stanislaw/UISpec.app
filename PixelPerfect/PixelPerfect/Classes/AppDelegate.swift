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

    func applicationWillFinishLaunching(notification: NSNotification) {}

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        println("application did finish launching")

        NSApp.activateIgnoringOtherApps(true)

        PP.setup(NSApp as! NSApplication)
    }
}

extension NSEventModifierFlags {
    func isCommandKey() -> Bool {
        return isSet(.CommandKeyMask)
    }

    func isShiftKey() -> Bool {
        return isSet(.ShiftKeyMask)
    }

    func isSet(bit: NSEventModifierFlags) -> Bool {
        return self & bit == bit
    }

    func isNotSet(bit: NSEventModifierFlags) -> Bool {
        return !isSet(bit)
    }
}
