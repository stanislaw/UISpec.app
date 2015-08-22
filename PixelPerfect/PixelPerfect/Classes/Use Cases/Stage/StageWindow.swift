//
//  StageWindow.swift
//  PixelPerfect
//
//  Created by Stanislaw Pankevich on 21/08/15.
//  Copyright (c) 2015 Stanislaw Pankevich. All rights reserved.
//

import Cocoa

enum StageWindowZoom {
    case Zoom_100
    case Zoom_75
    case Zoom_50
    case Zoom_25
}

class StageWindow: NSWindow {

    required init?(coder: NSCoder) {
        zoom = .Zoom_100

        super.init(coder: coder)
    }

    override init(contentRect: NSRect, styleMask aStyle: Int, backing bufferingType: NSBackingStoreType, defer flag: Bool) {
        zoom = .Zoom_100

        super.init(contentRect: contentRect, styleMask: aStyle, backing: bufferingType, defer: flag)
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        movableByWindowBackground = true
    }

    override var canBecomeMainWindow: Bool {
        return true
    }

    // MARK: -

    var currentImageDimensions: CGSize?
    var zoom: StageWindowZoom

    func setFrameForNewImage(newImageDimensions: CGSize) {
        let windowWidth  = newImageDimensions.width
        let windowHeight = newImageDimensions.height

        let windowX: CGFloat = frame.origin.x
        let windowY: CGFloat = frame.origin.y

        setFrame(CGRectMake(windowX, windowY, windowWidth, windowHeight), display: true)

        currentImageDimensions = newImageDimensions
        zoom = .Zoom_100
    }

    func setZoom(newZoom: StageWindowZoom) {
        if newZoom == zoom { return }

        var windowFrame: CGRect = frame

        switch newZoom {
            case .Zoom_100:
                if let currentImageDimensions = currentImageDimensions {
                    windowFrame.size = currentImageDimensions
                }

            case .Zoom_75:
                if let currentImageDimensions = currentImageDimensions {
                    windowFrame.size.width  = currentImageDimensions.width * 0.75
                    windowFrame.size.height = currentImageDimensions.height * 0.75
                }

            case .Zoom_50:
                if let currentImageDimensions = currentImageDimensions {
                    windowFrame.size.width  = currentImageDimensions.width * 0.5
                    windowFrame.size.height = currentImageDimensions.height * 0.5
                }

            case .Zoom_25:
                if let currentImageDimensions = currentImageDimensions {
                    windowFrame.size.width  = currentImageDimensions.width * 0.25
                    windowFrame.size.height = currentImageDimensions.height * 0.25
                }

            default: ()
        }

        setFrame(windowFrame, display: true)

        zoom = newZoom
    }
}
