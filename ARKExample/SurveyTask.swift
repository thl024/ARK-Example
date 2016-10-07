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
    
    let colorQuestionStepTitle = "What color do you hate the most?"
    let colorTuples = [
        (UIImage(named: "red")!, "Red"),
        (UIImage(named: "orange")!, "Orange"),
        (UIImage(named: "yellow")!, "Yellow"),
        (UIImage(named: "green")!, "Green"),
        (UIImage(named: "blue")!, "Blue"),
        (UIImage(named: "purple")!, "Purple")
    ]
    let imageChoices : [ORKImageChoice] = colorTuples.map {
        return ORKImageChoice(normalImage: $0.0, selectedImage: nil, text: $0.1, value: $0.1 as NSCoding & NSCopying & NSObjectProtocol)
    }
    let colorAnswerFormat: ORKImageChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: imageChoices)
    let colorQuestionStep = ORKQuestionStep(identifier: "ImageChoiceQuestionStep", title: colorQuestionStepTitle, answer: colorAnswerFormat)
    steps += [colorQuestionStep]
    
    let sportQuestionStepTitle = "Select all the sports you like to watch."
    let sportChoices = [
        ORKTextChoice(text: "Basketball", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Baseball", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Soccer", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Football", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Hockey", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Water Polo", value: 5 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    let sportAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .multipleChoice, textChoices: sportChoices)
    let sportQuestionStep = ORKQuestionStep(identifier: "MultipleChoiceQuestionStep", title: sportQuestionStepTitle, answer: sportAnswerFormat)
    steps += [sportQuestionStep]
    
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "End of Survey"
    summaryStep.text = "Be sure to re-take this survey regularly."
    steps += [summaryStep]
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)

}
