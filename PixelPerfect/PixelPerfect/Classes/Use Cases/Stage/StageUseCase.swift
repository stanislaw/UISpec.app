//
//  StageUseCase.swift
//  PixelPerfect
//
//  Created by Stanislaw Pankevich on 21/08/15.
//  Copyright (c) 2015 Stanislaw Pankevich. All rights reserved.
//

import Cocoa

public class StageUseCaseSetup {
    private var app: App!

    init(app: App) {
        self.app = app
    }

    func execute() -> Void {
        let stageStoryboard = app.construction.stageStoryboard()
        let windowController = app.construction.stageWindowController()
        let viewController = app.construction.stageViewController()

        let window = windowController.window!

        windowController.window?.contentViewController = viewController

        let width:  CGFloat = 300
        let height: CGFloat = 300

        let windowFrame = CGRectMake(
            (window.screen!.frame.width  - width) / 2,
            (window.screen!.frame.height - height) / 2,
            width,
            height
        )

        window.setFrame(windowFrame, display: true)
        window.movableByWindowBackground = true
        window.makeKeyAndOrderFront(nil)
        window.makeMainWindow()

        windowController.showWindow(nil)

        app.nsApp.activateIgnoringOtherApps(true)

        let stage = StageUseCase(windowController: windowController, viewController: viewController)

        app.userEventSource.observer = stage

        app.stage = stage
    }

    func unexecute() {
        assert(app.nsApp != nil, "")
        assert(app.stage != nil, "")

        let stage = app.stage

        let nsApp = app.nsApp

        let windowController = app.stage.windowController

        if windowController != nil {
            windowController.close()
            windowController.window?.close()
            windowController.window = nil
        }

        app.stage = nil
    }
}

public class StageUseCase: UserEventObserver {
    public private(set) var viewController: StageViewController!
    public private(set) var windowController: NSWindowController!

    public var window: NSWindow! {
        return windowController.window!
    }

    init(windowController: NSWindowController, viewController: StageViewController) {
        self.windowController = windowController
        self.viewController   = viewController

        viewController.configure(self)
    }

    func appReceivedNewImage(newImageDimensions: CGSize) {
        let windowWidth  = newImageDimensions.width
        let windowHeight = newImageDimensions.height

        println("newImage dimensions \(newImageDimensions)")

        let windowX: CGFloat = window.frame.origin.x
        let windowY: CGFloat = window.frame.origin.y

        window.setFrame(CGRectMake(windowX, windowY, windowWidth, windowHeight), display: true)

        println("new window frame \(window.frame)")
    }

    func userEventSourceDidReceiveEvent(event: UserEvent) {
        switch event {

            // LEFT
            case .Key_Left:
                var windowFrame: CGRect = window.frame

                windowFrame.origin.x -= CGFloat(1)
                window.setFrame(windowFrame, display: true)

            case .Key_Shift_Left:
                var windowFrame: CGRect = window.frame

                windowFrame.origin.x -= CGFloat(10)
                window.setFrame(windowFrame, display: true)

            // RIGHT
            case .Key_Right:
                var windowFrame: CGRect = window.frame

                windowFrame.origin.x += CGFloat(1)
                window.setFrame(windowFrame, display: true)

            case .Key_Shift_Right:
                var windowFrame: CGRect = window.frame

                windowFrame.origin.x += CGFloat(10)
                window.setFrame(windowFrame, display: true)

            // DOWN
            case .Key_Down:
                var windowFrame: CGRect = window.frame

                windowFrame.origin.y -= CGFloat(1)

                window.setFrame(windowFrame, display: true)

            case .Key_Shift_Down:
                var windowFrame: CGRect = window.frame

                windowFrame.origin.y -= CGFloat(10)
                window.setFrame(windowFrame, display: true)

            // UP
            case .Key_Up:
                var windowFrame: CGRect = window.frame

                windowFrame.origin.y += CGFloat(1)

                window.setFrame(windowFrame, display: true)

            case .Key_Shift_Up:
                var windowFrame: CGRect = window.frame

                windowFrame.origin.y += CGFloat(10)
                window.setFrame(windowFrame, display: true)

            // Q
            case .Key_Q:
                if window.alphaValue == 1 {
                    window.alphaValue = 0.75
                }

                else if window.alphaValue == 0.75 {
                    window.alphaValue = 0.5
                }

                else if window.alphaValue == 0.5 {
                    window.alphaValue = 0.25
                }

                else {
                    window.alphaValue = 1
            }

            default:
                ()
        }
    }
}
