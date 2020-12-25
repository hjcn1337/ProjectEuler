//
//  ProjectEulerTasks.swift
//  ProjectEuler
//
//  Created by Ростислав Ермаченков on 25.12.2020.
//

import Foundation

protocol TaskPresentable {
    var name: String { get }
    var answer: String { get }
}

struct Task1: TaskPresentable {
    var name = "Task 1"
    
    var answer: String {
        return getAnswer()
    }

    private func getAnswer() -> String {

        var sum = 0
        for i in 1..<1000 {
            if (i % 3 == 0) || (i % 5 == 0) {
                sum += i
            }
        }
        return String(sum)
    }
    
}

struct Task2: TaskPresentable {
    
    var name = "Task 2"
    
    var answer: String {
        return getAnswer()
    }
   
    private func getAnswer() -> String {

        var number1 = 1
        var number2 = 2
        let limit = 4_000_000
        var currentNumber = 0
        var sum = 2
        
        while currentNumber < limit {
            currentNumber = number1 + number2
            number1 = number2
            number2 = currentNumber
            sum = currentNumber % 2 == 0 ? sum + currentNumber : sum
        }
        return String(sum)
    }
    
}

struct Task4: TaskPresentable {
    var name = "Task 4"
    
    var answer: String {
        return getAnswer()
    }

    private func getAnswer() -> String {

        var res = 0
        for i in stride(from: 999, to: 100, by: -1) {
            for j in stride(from: 999, to: 100, by: -1) {
                let number = i * j
                let str = String(number)
                let strFirstHalf = str.prefix(3)
                let strSecondHalf = String(str.suffix(3).reversed())
                if strFirstHalf == strSecondHalf && number > res {
                    res = number
                }
            }
        }
        return String(res)
    }
    
}

struct Task5: TaskPresentable {
    var name = "Task 5"
    
    var answer: String {
        return getAnswer()
    }

    private func getAnswer() -> String {

        var number = 20
      
        while true {
            var isNumberDividedSuccesfully = true
            for i in 1...20 {
                if number % i != 0 {
                    isNumberDividedSuccesfully = false
                }
            }
            if isNumberDividedSuccesfully {
                return String(number)
            }
            number += 1
        }
    }
    
}

struct Task6: TaskPresentable {
    var name = "Task 6"
    
    var answer: String {
        return getAnswer()
    }

    private func getAnswer() -> String {

        var sumOfSquares = 0
        var squareOfSum = 0
        
        for i in 1...100 {
            sumOfSquares += i.square()
        }
        
        var sum = 0
        for i in 1...100 {
            sum += i
        }
        squareOfSum = sum.square()
        
        return String(squareOfSum - sumOfSquares)
    }
    
}

// MARK: - Неправильный ответ
struct Task7: TaskPresentable {
    var name = "Task 7"
    
    var answer: String {
        return getAnswer()
    }

    private func getAnswer() -> String {

        let veryBigNumberStr = "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"
        
        let veryBigNumberArray = Array(veryBigNumberStr)
             
        var x1 = ""
        //var x2 = ""
        var sequenceNumberArray: [String] = []
        var sequenceNumberArray2: [String] = []
        var multipliedSequence = 0
        for i in 0..<veryBigNumberArray.count - 1 {
            x1 = String(veryBigNumberArray[i])
            //x2 = String(veryBigNumberArray[i+1])
                
            if x1 != String(0) && sequenceNumberArray.count < 13 {
                sequenceNumberArray.append(x1)
            } else if sequenceNumberArray.count == 13  {
                multipliedSequence = getMultipledArrayElements(array: sequenceNumberArray)
                
            } else if x1 != String(0) && sequenceNumberArray.count == 13 {
                sequenceNumberArray.remove(at: 0)
                sequenceNumberArray.append(x1)
                let newMultipliedSequence = getMultipledArrayElements(array: sequenceNumberArray)
                if newMultipliedSequence > multipliedSequence {
                    multipliedSequence = newMultipliedSequence
                    
                }
            } else if x1 == String(0) && multipliedSequence != 0 {
                sequenceNumberArray = []
            }
            
        }
        print(sequenceNumberArray)
        //print(multipliedSequence)
        
        return ""
    }
    
    private func getMultipledArrayElements(array: [String]) -> Int {
        var result = 1
        for element in array {
            result *= Int(element)!
        }
        return result
    }
    
}
