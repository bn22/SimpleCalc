//
//  main.swift
//  SimpleCalc
//
//  Created by Bruce Ng on 10/7/15.
//  Copyright © 2015 Bruce Ng. All rights reserved.
//

import Foundation
func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    print (result)
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func convert(incoming:String) -> Int {
    return NSNumberFormatter().numberFromString(incoming)!.integerValue
}

let firstInput = input()
let operation = input()
var result = 0

if operation == "+" {
    let input1 = convert(firstInput)
    let input2 = convert(input())
    result = input1 + input2
    print (result)
} else if operation == "-" {
    let input1 = convert(firstInput)
    let input2 = convert(input())
    result = input1 - input2
    print (result)
} else if operation == "*" {
    let input1 = convert(firstInput)
    let input2 = convert(input())
    result = input1 * input2
    print (result)
} else if operation == "/" {
    let input1 = convert(firstInput)
    let input2 = convert(input())
    result = input1 / input2
    print (result)
} else if operation == "%" {
    let input1 = convert(firstInput)
    let input2 = convert(input())
    result = input1 % input2
    print (result)
} else if operation == "fact" {
    let input1 = convert(firstInput)
    result = 1
    if (input1 != 0) {
        for (var index = 1; index <= input1; index++) {
            result = result * index
        }
    }
    print (result)
} else if operation == "count" {
    var inputArray = firstInput.characters.split{$0 == " "}.map(String.init)
    result = inputArray.count;
    print (result)
} else if operation == "avg" {
    var inputArray = firstInput.characters.split{$0 == " "}.map(String.init)
    for (var index = 0; index < inputArray.count; index++) {
        result = result + convert(inputArray[index])
    }
    let avg = Double(result) / Double(inputArray.count)
    print(avg)
} else {
    print ("Please enter a valid operation (i.e. +, -, *, /, %, fact, count, avg)")
}