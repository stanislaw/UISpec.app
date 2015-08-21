//
//  ViewController.swift
//  PixelPerfect
//
//  Created by Stanislaw Pankevich on 18/05/15.
//  Copyright (c) 2015 Stanislaw Pankevich. All rights reserved.
//

import Cocoa

public class StageViewController: NSViewController, ImageViewDelegate {
    @IBOutlet weak var imageView: ImageView!

    public private(set) weak var useCase: StageUseCase!

    override public func viewDidLoad() {
        super.viewDidLoad()

        imageView.delegate = self

        println(view.frame)
        println(view.window)
        println(imageView)
        println("original image dimensions: \(imageView.frame)")
    }

    // MARK: - Public API

    func configure(useCase: StageUseCase) {
        self.useCase = useCase
    }

    // MARK: -

    func imageViewReceivedImage(imageView: ImageView) {
        println("olaala \(imageView)")

        let calculator = ImageViewDimensionsCalculator()

        if let imageDimensions = calculator.dimensions(imageView) {
            let window: NSWindow = view.window!

            let windowWidth  = imageDimensions.width
            let windowHeight = imageDimensions.height

            let windowX: CGFloat = window.frame.origin.x
            let windowY: CGFloat = window.frame.origin.y

            window.setFrame(CGRectMake(windowX, windowY, windowWidth, windowHeight), display: true)
        }
    }
}

