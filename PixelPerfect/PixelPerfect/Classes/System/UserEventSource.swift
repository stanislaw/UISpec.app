//
//  UserEventSource.swift
//  PixelPerfect
//
//  Created by Stanislaw Pankevich on 21/08/15.
//  Copyright (c) 2015 Stanislaw Pankevich. All rights reserved.
//

import Cocoa

enum UserEvent {
    case Key_Up
    case Key_Shift_Up

    case Key_Down
    case Key_Shift_Down

    case Key_Left
    case Key_Shift_Left

    case Key_Right
    case Key_Shift_Right

    case Key_Q
    case Key_Command_1
    case Key_Command_2
    case Key_Command_3
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

    }
}
