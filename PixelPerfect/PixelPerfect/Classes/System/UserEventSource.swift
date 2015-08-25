//
//  UserEventSource.swift
//  PixelPerfect
//
//  Created by Stanislaw Pankevich on 21/08/15.
//  Copyright (c) 2015 Stanislaw Pankevich. All rights reserved.
//

import Cocoa
import Carbon

enum UserEvent {
    case Key_Up
    case Key_Shift_Up

    case Key_Down
    case Key_Shift_Down

    case Key_Left
    case Key_Shift_Left

    case Key_Right
    case Key_Shift_Right

    // Opacity
    case Key_Q

    // Zoom: 100/75/50/25
    case Key_Command_1
    case Key_Command_2
    case Key_Command_3
    case Key_Command_4
}

protocol UserEventObserver {
    func userEventSourceDidReceiveEvent(event: UserEvent)
}

class UserEventSource {
    var observer: UserEventObserver?

    init() {
        NSEvent.addLocalMonitorForEventsMatchingMask(NSEventMask.KeyDownMask, handler: { (event) -> NSEvent in
            println(event.keyCode)

            var userEvent: UserEvent?

            switch event.keyCode {

                case 123:
                    if event.modifierFlags.isShiftKey() {
                        userEvent = .Key_Shift_Left
                    } else {
                        userEvent = .Key_Left
                    }

                case 124:
                    if event.modifierFlags.isShiftKey() {
                        userEvent = .Key_Shift_Right
                    } else {
                        userEvent = .Key_Right
                    }

                case 125:
                    if event.modifierFlags.isShiftKey() {
                        userEvent = .Key_Shift_Down
                    } else {
                        userEvent = .Key_Down
                    }

                case 126:
                    if event.modifierFlags.isShiftKey() {
                        userEvent = .Key_Shift_Up
                    } else {
                        userEvent = .Key_Up
                    }

                case 12:
                    userEvent = .Key_Q


                // ⌘ + "1", ⌘ + 2, ⌘ + 3
                case 18:
                    if event.modifierFlags.isCommandKey() {
                        userEvent = .Key_Command_1
                    }

                case 19:
                    if event.modifierFlags.isCommandKey() {
                        userEvent = .Key_Command_2
                    }

                case 20:
                    if event.modifierFlags.isCommandKey() {
                        userEvent = .Key_Command_3
                    }

                case 21:
                    if event.modifierFlags.isCommandKey() {
                        userEvent = .Key_Command_4
                    }

                // F3 (Temporary)
                case 99:
                    println("F3")
                    NSApplication.sharedApplication().hide(nil)

                default:
                    ()
            }

            if let recognizedEvent = userEvent {
                self.observer?.userEventSourceDidReceiveEvent(recognizedEvent)
            }

            return event
        })


        // http://stackoverflow.com/questions/28281653/how-to-listen-to-global-hotkeys-with-swift-in-an-os-x-app
        let keyCode = UInt16(kVK_F1)
        let keyMask: NSEventModifierFlags = .CommandKeyMask

        let options = NSDictionary(object: kCFBooleanTrue, forKey: kAXTrustedCheckOptionPrompt.takeUnretainedValue() as NSString) as CFDictionaryRef

        let trusted = AXIsProcessTrustedWithOptions(options)
        if trusted != 0 {
            NSEvent.addGlobalMonitorForEventsMatchingMask(.KeyDownMask, handler: { (event) -> Void in
                if (event.keyCode == keyCode &&
                    event.modifierFlags & keyMask == keyMask) {
                    NSApp.activateIgnoringOtherApps(true)
                }
            })
        }
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
