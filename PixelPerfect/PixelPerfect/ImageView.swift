//
//  ImageView.swift
//  PixelPerfect
//
//  Created by Stanislaw Pankevich on 19/05/15.
//  Copyright (c) 2015 Stanislaw Pankevich. All rights reserved.
//

import Cocoa

class ImageView: NSImageView, NSDraggingDestination {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        registerForDraggedTypes(NSImage.imageTypes())

        println(self.registeredDraggedTypes)
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

            
        }
    }
}
