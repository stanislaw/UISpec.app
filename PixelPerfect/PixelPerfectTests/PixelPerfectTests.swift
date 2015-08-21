//
//  PixelPerfectTests.swift
//  PixelPerfectTests
//
//  Created by Stanislaw Pankevich on 18/05/15.
//  Copyright (c) 2015 Stanislaw Pankevich. All rights reserved.
//

import Cocoa
import XCTest
import Carbon
import PixelPerfect

public class UserEventSimulator: NSObject {
    func triggerKeyboardEvent(keyCode: CGKeyCode) {
        let source = CGEventSourceCreate(CGEventSourceStateID(kCGEventSourceStateHIDSystemState)).takeRetainedValue()

        let location = CGEventTapLocation(kCGHIDEventTap)

        let event = CGEventCreateKeyboardEvent(source, keyCode, true).takeRetainedValue()

        CGEventPost(location, event)
    }
}

class PixelPerfectTests: XCTestCase {
    private let simulator = UserEventSimulator()

    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSetup() {
        let app: App = App()

        app.setup(NSApp as! NSApplication)

        XCTAssert(app.nsApp === NSApp, "")
    }

    func testLeftArrowKeyPressedEvent() {
        let app: App = PP

        let expectation = expectationWithDescription("Description")

        NSEvent.addLocalMonitorForEventsMatchingMask(NSEventMask.KeyDownMask, handler: { (event) -> NSEvent in
            XCTAssert(CGKeyCode(event.keyCode) == CGKeyCode(kVK_UpArrow), "")

            expectation.fulfill()

            return event
        })

        NSRunLoop.currentRunLoop().runUntilDate(NSDate(timeIntervalSinceNow: 1))

        println("olalala \(NSApp)")
        println("olalala \(PP.nsApp)")

        println("olalala \(app.nsApp.windows)")

        let window: NSWindow = app.nsApp.windows.first as! NSWindow

        println("olalala \(window)")

        simulator.triggerKeyboardEvent(CGKeyCode(kVK_UpArrow))

        NSRunLoop.currentRunLoop().runUntilDate(NSDate(timeIntervalSinceNow: 1))

        waitForExpectationsWithTimeout(3, handler: { (error) -> Void in

        })
    }

    func testBasicDrag() {
        let window: NSWindow = NSApplication.sharedApplication().windows.first as! NSWindow

        XCTAssert(window.title! == "PixelPerfect", "")
    }
}
