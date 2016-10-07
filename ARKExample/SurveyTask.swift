//
//  SurveyTask.swift
//  ARKExample
//
//  Created by Timothy Lam on 10/7/16.
//  Copyright © 2016 ARK. All rights reserved.
//

import ResearchKit

public var SurveyTask: ORKOrderedTask {

    var steps = [ORKStep]()
    
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "Sample Survey"
    instructionStep.text = "Complete this survey for us to know more about you!"
    steps += [instructionStep]
    
    let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
    nameAnswerFormat.multipleLines = false
    let nameQuestionStepTitle = "What is your name?"
    let nameQuestionStep = ORKQuestionStep(identifier: "QuestionStep", title: nameQuestionStepTitle, answer: nameAnswerFormat)
    steps += [nameQuestionStep]
    
    let foodQuestionStepTitle = "Out of the four, which food do you prefer?"
    let textChoices = [
        ORKTextChoice(text: "Sushi", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Taco", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Burger", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Pasta", value: 3 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    let foodAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
    let foodQuestionStep = ORKQuestionStep(identifier: "TextChoiceQuestionStep", title: foodQuestionStepTitle, answer: foodAnswerFormat)
    steps += [foodQuestionStep]
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)

}
