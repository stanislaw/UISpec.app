//
//  Mac.swift
//  PixelPerfect
//
//  Created by Stanislaw Pankevich on 21/08/15.
//  Copyright (c) 2015 Stanislaw Pankevich. All rights reserved.
//

import Cocoa

class Mac: NSObject {
    var screenSize: CGSize {
        let mainScreen: NSScreen = NSScreen.mainScreen()!
        println(mainScreen.deviceDescription)

        let screenSize: NSSize = mainScreen.deviceDescription[NSDeviceSize]!.sizeValue
        println()
        println(screenSize)
        println()

        return screenSize
    }
}
