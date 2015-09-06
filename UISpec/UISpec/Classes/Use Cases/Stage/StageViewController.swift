//
//  ViewController.swift
//  UISpec
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
    }

    // MARK: - Public API

    func configure(useCase: StageUseCase) {
        self.useCase = useCase
    }

    // MARK: - <ImageViewDelegate>

    func imageViewReceivedImage(imageView: ImageView) {
        let calculator = ImageViewDimensionsCalculator()

        if let imageDimensions = calculator.dimensions(imageView) {
            useCase.appReceivedNewImage(imageDimensions)
        }
    }
}
