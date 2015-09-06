//
//  Construction.swift
//  UISpec
//
//  Created by Stanislaw Pankevich on 21/08/15.
//  Copyright (c) 2015 Stanislaw Pankevich. All rights reserved.
//

import Cocoa

class Construction {
    init() {}

    func stageStoryboard() -> NSStoryboard {
        let stageStoryboard = NSStoryboard(name: "Stage", bundle: nil)!

        return stageStoryboard
    }

    func stageWindowController() -> NSWindowController {
        return stageStoryboard().instantiateControllerWithIdentifier("StageWindowController") as! NSWindowController
    }

    func stageViewController() -> StageViewController {
        return stageStoryboard().instantiateControllerWithIdentifier("StageViewController") as! StageViewController
    }
}
