//
//  WalkTask.swift
//  ARKExample
//
//  Created by Timothy Lam on 10/8/16.
//  Copyright © 2016 ARK. All rights reserved.
//

import ResearchKit

public var WalkTask: ORKOrderedTask {
    return ORKOrderedTask.fitnessCheck(withIdentifier: "WalkTask",
                                                         intendedUseDescription: nil,
                                                         walkDuration: 15 as TimeInterval,
                                                         restDuration: 15 as TimeInterval,
                                                         options: [])
}
