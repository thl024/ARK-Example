//
//  MusicStepViewController.swift
//  ARKExample
//
//  Created by Timothy Lam on 10/9/16.
//  Copyright © 2016 ARK. All rights reserved.
//

import AVFoundation
import ResearchKit

class MusicStepViewController: ORKActiveStepViewController {
    var audioPlayer: AVAudioPlayer?
    
    override func start() {
        super.start()
        
        if let step = step as? MusicStep {
            do {
                try audioPlayer = AVAudioPlayer(contentsOf: step.clip.fileURL() as URL,
                                                fileTypeHint: AVFileTypeMPEGLayer3)
                audioPlayer?.play()
            } catch {}
        }
    }
    
    override func stepDidFinish() {
        super.stepDidFinish()
        audioPlayer?.stop()
    }
}
