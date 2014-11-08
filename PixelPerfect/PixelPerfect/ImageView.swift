//
//  ImageView.swift
//  PixelPerfect
//
//  Created by Stanislaw Pankevich on 08/11/14.
//  Copyright (c) 2014 Stanislaw Pankevich. All rights reserved.
//

import Cocoa

class ImageView: NSImageView {

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        println("hello")
    }
    
}
