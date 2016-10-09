//
//  ViewController.swift
//  ARKExample
//
//  Created by Timothy Lam on 10/7/16.
//  Copyright © 2016 ARK. All rights reserved.
//

import UIKit
import ResearchKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func consentTapped(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: ConsentTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }

    @IBAction func surveyTapped(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: SurveyTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func microphoneTapped(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: MicrophoneTask, taskRun: nil)
        taskViewController.delegate = self
        taskViewController.outputDirectory = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] , isDirectory: true) as URL
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func authorizeTapped(sender: AnyObject) {
        HealthKitManager.authorizeHealthKit()
    }
    
    @IBAction func walkTapped(sender: AnyObject) {
        let taskViewController = ORKTaskViewController(task: WalkTask, taskRun: nil)
        taskViewController.delegate = self
        taskViewController.outputDirectory = NSURL(fileURLWithPath:
            NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0],
                                                   isDirectory: true) as URL
        present(taskViewController, animated: true, completion: nil)
        HealthKitManager.startMockHeartData()
    }
    
    @IBAction func musicTapped(sender: AnyObject) {
        let taskViewController = ORKTaskViewController(task: MusicTask, taskRun: nil)
        taskViewController.delegate = self
        taskViewController.outputDirectory = NSURL(fileURLWithPath:
            NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0],
                                                   isDirectory: true) as URL
        present(taskViewController, animated: true, completion: nil)
        HealthKitManager.startMockHeartData()
    }
    
    func taskViewController(taskViewController: ORKTaskViewController, viewControllerForStep step: ORKStep) -> ORKStepViewController? {
        
        if step.identifier == "music" {
            return MusicStepViewController(step: step)
        } else {
            return nil
        }
    }
}

extension ViewController : ORKTaskViewControllerDelegate {
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        HealthKitManager.stopMockHeartData()
        
        if (taskViewController.task?.identifier == "MusicTask"
            && reason == .completed) {
            
            let clip = ResultParser.findClip(task: taskViewController.task)
            print("clip name: \(clip!.rawValue)")
            
            let heartURL = ResultParser.findMusicHeartFiles(result: taskViewController.result)
            if let heartURL = heartURL {
                do {
                    let string = try NSString.init(contentsOf: heartURL as URL, encoding: String.Encoding.utf8.rawValue)
                    print(string)
                } catch {}
            }
        }
        
        taskViewController.dismiss(animated: true, completion: nil)
        
        if (taskViewController.task?.identifier == "WalkTask"
            && reason == .completed) {
            
            let heartURLs = ResultParser.findWalkHeartFiles(result: taskViewController.result)
            
            for url in heartURLs {
                do {
                    let string = try NSString.init(contentsOf: url as URL, encoding: String.Encoding.utf8.rawValue)
                    print(string)
                } catch {}
            }
        }
    }
}

