//
//  ViewController.swift
//  PixelPerfect
//
//  Created by Stanislaw Pankevich on 18/05/15.
//  Copyright (c) 2015 Stanislaw Pankevich. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, ImageViewDelegate {

    @IBOutlet weak var imageView: ImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.delegate = self

        println(view.frame)
        println(view.window)
        println(imageView)
        println("original image dimensions: \(imageView.frame)")
    }

    override func viewDidAppear() {
    }

    func imageViewReceivedImage(imageView: ImageView) {
        println("olaala \(imageView)")

        if let rep: AnyObject = imageView.image?.representations.first {
            let concreteRep: NSImageRep = rep as! NSImageRep

            println("real size \(concreteRep.size)")
            println("real size \(concreteRep.pixelsHigh)")
            println("real size \(concreteRep.pixelsWide)")

            let window: NSWindow = view.window!

            println("window \(window)")

            let windowWidth:  CGFloat = CGFloat(concreteRep.pixelsWide)
            let windowHeight: CGFloat = CGFloat(concreteRep.pixelsHigh)

            let windowX: CGFloat = window.frame.origin.x
            let windowY: CGFloat = window.frame.origin.y
            
            window.setFrame(CGRectMake(windowX, windowY, windowWidth, windowHeight), display: true)

            println("result image dimensions: \(imageView.frame)")
        }
    }
}

