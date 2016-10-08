//
//  ActiveTask.swift
//  ARKExample
//
//  Created by Timothy Lam on 10/7/16.
//  Copyright © 2016 ARK. All rights reserved.
//

import ResearchKit

public var MicrophoneTask: ORKOrderedTask {

    return ORKOrderedTask.audioTask(withIdentifier: "AudioTask", intendedUseDescription: "A sentence prompt will be given to you to read.", speechInstruction: "This app is designed to test Apple Research Kit.", shortSpeechInstruction: "The Apple Research Kit is an important tool for research.", duration: 10, recordingSettings: nil, options: [])
    
}
