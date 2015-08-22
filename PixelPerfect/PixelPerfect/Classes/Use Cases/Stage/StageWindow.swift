//
//  StageWindow.swift
//  PixelPerfect
//
//  Created by Stanislaw Pankevich on 21/08/15.
//  Copyright (c) 2015 Stanislaw Pankevich. All rights reserved.
//

import Cocoa

class StageWindow: NSWindow {

    override func awakeFromNib() {
        super.awakeFromNib()

        movableByWindowBackground = true
    }

    override var canBecomeMainWindow: Bool {
        return true
    }
}
