//
//  ImageView.swift
//  PixelPerfect
//
//  Created by Stanislaw Pankevich on 19/05/15.
//  Copyright (c) 2015 Stanislaw Pankevich. All rights reserved.
//

import Cocoa

protocol ImageViewDelegate: class {
    func imageViewReceivedImage(imageView: ImageView)
}

class ImageView: NSImageView, NSDraggingDestination {

    weak var delegate: ImageViewDelegate?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        registerForDraggedTypes(NSImage.imageTypes())

        initialLocation = CGPointZero
    }

    var initialLocation: CGPoint!

    override func mouseDown(theEvent: NSEvent) {
        println("mouseDown")
        let windowFrame = window!.frame

        initialLocation = NSEvent.mouseLocation()

        initialLocation.x -= windowFrame.origin.x
        initialLocation.y -= windowFrame.origin.y
    }

    override func mouseDragged(theEvent: NSEvent) {
        println("mouseDragged")
        var newOrigin = NSPoint()

        let screenFrame = NSScreen.mainScreen()!.frame
        let windowFrame = window!.frame

        let currentLocation = NSEvent.mouseLocation()

        newOrigin.x = currentLocation.x - initialLocation.x;
        newOrigin.y = currentLocation.y - initialLocation.y;

        // Don't let window get dragged up under the menu bar
        if ((newOrigin.y + windowFrame.size.height) > (screenFrame.origin.y + screenFrame.size.height)) {
            newOrigin.y = screenFrame.origin.y + (screenFrame.size.height - windowFrame.size.height)
        }

        window!.setFrameOrigin(newOrigin)
    }

    override func draggingEnded(sender: NSDraggingInfo?) {
        println("draggingEnded")

        println("self image \(image)")

        println("self image \(image?.size)")
        println("self image \(frame)")

        if let rep: AnyObject = image?.representations.first {
            let concreteRep: NSImageRep = rep as! NSImageRep

            println("real size \(concreteRep.size)")
            println("real size \(concreteRep.pixelsHigh)")
            println("real size \(concreteRep.pixelsWide)")

            delegate?.imageViewReceivedImage(self)
        }
    }
}
