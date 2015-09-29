//
//  ImageView.swift
//  UISpec
//
//  Created by Stanislaw Pankevich on 19/05/15.
//  Copyright (c) 2015 Stanislaw Pankevich. All rights reserved.
//

import Cocoa

protocol ImageViewDelegate: class {
    func imageViewReceivedImage(imageView: ImageView)
}

class ImageView: NSImageView {

    weak var delegate: ImageViewDelegate?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        registerForDraggedTypes(NSImage.imageTypes())

        initialLocation = CGPointZero
    }

    var initialLocation: CGPoint!

    // http://stackoverflow.com/questions/4563893/allow-click-and-dragging-a-view-to-drag-the-window-itself
    override func mouseDown(theEvent: NSEvent) {
        let windowFrame = window!.frame

        initialLocation = NSEvent.mouseLocation()

        initialLocation.x -= windowFrame.origin.x
        initialLocation.y -= windowFrame.origin.y
    }

    override func mouseDragged(theEvent: NSEvent) {
        var newOrigin = NSPoint()

        let currentLocation = NSEvent.mouseLocation()

        newOrigin.x = currentLocation.x - initialLocation.x;
        newOrigin.y = currentLocation.y - initialLocation.y;

        window!.setFrameOrigin(newOrigin)
    }

    override func draggingEnded(sender: NSDraggingInfo?) {
        if image?.representations.first != nil {
            delegate?.imageViewReceivedImage(self)
        }
    }
}
