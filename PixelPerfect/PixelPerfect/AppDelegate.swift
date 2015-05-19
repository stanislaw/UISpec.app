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

        //assert(false, "")

        println("WTF1 \(PPApp.sharedApp)")
        
        PPApp.sharedApp.setup(NSApp as! NSApplication)

//        let mainScreen: NSScreen = NSScreen.mainScreen()!
//        println(mainScreen.deviceDescription)
//
//        let screenSize: NSSize = mainScreen.deviceDescription[NSDeviceSize]!.sizeValue
//
//        println(screenSize)
//        println()
//
        let window: NSWindow = NSApplication.sharedApplication().windows.first as! NSWindow
//
//        window.level = Int(CGWindowLevelForKey(Int32(kCGFloatingWindowLevelKey)))
//
//        let windowWidth: CGFloat  = 200
//        let windowHeight: CGFloat = 200
//
//        let windowX: CGFloat = (screenSize.width  - windowWidth)  / 2
//        let windowY: CGFloat = (screenSize.height - windowHeight) / 2

        NSEvent.addLocalMonitorForEventsMatchingMask(NSEventMask.KeyDownMask, handler: { (event) -> NSEvent in
            // Q
            if event.keyCode == 12 {
                if window.alphaValue == 1 {
                    window.alphaValue = 0.75
                }

                else if window.alphaValue == 0.75 {
                    window.alphaValue = 0.5
                }

                else if window.alphaValue == 0.5 {
                    window.alphaValue = 0.25
                }

                else {
                    window.alphaValue = 1
                }
            }

            // LEFT
            else if event.keyCode == 123 {
                var windowFrame: CGRect = window.frame

                if event.modifierFlags.isShiftKey() {
                    windowFrame.origin.x -= CGFloat(10)
                } else {
                    windowFrame.origin.x -= CGFloat(1)
                }

                window.setFrame(windowFrame, display: true)
            }

            // RIGHT
            else if event.keyCode == 124 {
                var windowFrame: CGRect = window.frame

                if event.modifierFlags.isShiftKey() {
                    windowFrame.origin.x += CGFloat(10)
                } else {
                    windowFrame.origin.x += CGFloat(1)
                }

                window.setFrame(windowFrame, display: true)
            }

            // DOWN
            else if event.keyCode == 125 {
                var windowFrame: CGRect = window.frame

                if event.modifierFlags.isShiftKey() {
                    windowFrame.origin.y -= CGFloat(10)
                } else {
                    windowFrame.origin.y -= CGFloat(1)
                }

                window.setFrame(windowFrame, display: true)
            }

            // UP
            else if event.keyCode == 126 {
                var windowFrame: CGRect = window.frame

                if event.modifierFlags.isShiftKey() {
                    windowFrame.origin.y += CGFloat(10)
                } else {
                    windowFrame.origin.y += CGFloat(1)
                }

                window.setFrame(windowFrame, display: true)
            }

            // F3
            else if event.keyCode == 99 {
                println("F3")
                NSApplication.sharedApplication().hide(nil)
            }

            // 1
            else if event.keyCode == 18 {
                println("1 \(event)")

                if event.modifierFlags.isCommandKey() {
                    println("modifier")
                }
            }

            // 2
            else if event.keyCode == 19 {
                println("2 \(event)")
            }

            // 3
            else if event.keyCode == 20 {
                println("3 \(event)")
            }

            else {
                println("olalala \(event)")
            }

            return event
        })
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
