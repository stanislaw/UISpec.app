//
//  PixelPerfectTests.swift
//  PixelPerfectTests
//
//  Created by Stanislaw Pankevich on 18/05/15.
//  Copyright (c) 2015 Stanislaw Pankevich. All rights reserved.
//

import Cocoa
import XCTest
import PixelPerfect

class PixelPerfectTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        XCTAssert(PPApp.sharedApp.nsApp === NSApp, "")
    }

    func testBasicDrag() {
        let window: NSWindow = NSApplication.sharedApplication().windows.first as! NSWindow

        XCTAssert(window.title! == "PixelPerfect", "")
    }
}
