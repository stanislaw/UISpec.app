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

public class StageUseCase: NSObject {
    public private(set) var viewController: StageViewController!
    public private(set) var windowController: NSWindowController!

    public var window: NSWindow! {
        return windowController.window!
    }

    init(windowController: NSWindowController, viewController: StageViewController) {
        self.windowController = windowController
        self.viewController   = viewController
    }
}
