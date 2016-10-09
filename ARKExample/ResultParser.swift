//
//  ResultParser.swift
//  ARKExample
//
//  Created by Timothy Lam on 10/8/16.
//  Copyright © 2016 ARK. All rights reserved.
//

import Foundation
import ResearchKit

struct ResultParser {
    
    static func findWalkHeartFiles(result: ORKTaskResult) -> [NSURL] {
        
        var urls = [NSURL]()
        
        if let results = result.results
            , results.count > 4,
            let walkResult = results[3] as? ORKStepResult,
            let restResult = results[4] as? ORKStepResult {
            
            for result in walkResult.results! {
                if let result = result as? ORKFileResult,
                    let fileUrl = result.fileURL {
                    urls.append(fileUrl as NSURL)
                }
            }
            
            for result in restResult.results! {
                if let result = result as? ORKFileResult,
                    let fileUrl = result.fileURL {
                    urls.append(fileUrl as NSURL)
                }
            }
        }
        
        return urls
    }
}
