//
//  Extensions.swift
//  UISpec
//
//  Created by Stanislaw Pankevich on 21/08/15.
//  Copyright (c) 2015 Stanislaw Pankevich. All rights reserved.
//

import Cocoa

class ImageViewDimensionsCalculator {
    func dimensions(imageView: NSImageView) -> CGSize? {
        if let rep: AnyObject = imageView.image?.representations.first {
            let concreteRep: NSImageRep = rep as! NSImageRep

            print("real size \(concreteRep.size)")
            print("real size \(concreteRep.pixelsHigh)")
            print("real size \(concreteRep.pixelsWide)")

            return CGSizeMake(CGFloat(concreteRep.pixelsWide), CGFloat(concreteRep.pixelsHigh))
        }

        return nil
    }
}
