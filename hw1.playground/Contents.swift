//: # Homework 1 - Swift Playground

//: In order to answer the [EXPLAIN YOUR ANSWER HERE] questions,
//: you must go to Editor -> Show Raw Markup and edit the bracketed text.
//: Once done, go to Editor -> Show Rendered Markup to return to the previous view mode.


import UIKit


//: ## Q1: Optionals
class Words {
    var wordA : String!
    var wordB : String!
    
    init (wordA: String?, wordB: String?) {
        self.wordA = wordA
        self.wordB = wordB
    }

//: ### Are the values passed in to the **init** function and those set to the instance
//: ### variables the same type? If not, why?


//: [Yes, the values set to the instance variables are of type Implicitly Unwrapped String Optional, 
//: while the values passed to the init method are of type String Optional.
//: This means that the isntance variables are force unwrapped dueing initialization. However, this does
//: not mean that the value cannot still take on nil. It can.


//: ## Q2: Variable Types and Function Types
    class func arePalindromes(_ words: [String]) -> Bool {
        let reversedWords = words.map() { String($0.characters.reversed()) }
        let numElements = words.count
        
        for i in 0 ..< numElements {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        return true
    }
    
    
//: ### Why does the compiler dislike the **for loop**? Fix it.
//: ### What else is wrong with this function? You may have to refer to (but **not**
//: ### change) the code at the very bottom. Debug the function.


//: [There is a compilation error because the function was initially
//: declared as an instance member, i.e. it can only be called by instances of the class. The usage
//: below was that of a type member, i.e. it assumed the method can be called by the class itself.
//: The proper corrective action is to add the class keyword in order to declare the method as callable by 
//: class type (or, in the case of using the class keyword, it would be callable by both the class or
//: an instance of the class). Also, as a final error, the function should return true if it exits the 
//: while loop.]


//: ## Q3: More Functions and Object Initialization
    func isAnagram() -> Bool {
        var countLetters  = [Character : Int]() //Line X
        
        let lenA : Int
        let lenB : Int
        
        if let val = self.wordA?.characters.count {
            lenA = val
        } else {return false} // if wordA is nil, return false.
        
        if let val = self.wordB?.characters.count {
            lenB = val
        } else {return false} // if wordA is nil, return false.
        
        if lenA != lenB {
            return false
        }
        
        var arrA = Array(self.wordA.characters)
        var arrB = Array(self.wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] { //Line Y
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (_, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
//: ### What is the problem with declaring **countLetters** as we do in **Line X**,
//: ### and then using it in **Line Y**? Fix it (by only changing **Line X**).
//: ### What else is wrong with this function? You may have to refer to (but **not**
//: ### change) the code at the very bottom. Debug the function.


//: [Problem 1: Last line should return true in the case that all map values are zero.
//: Proble, 2: The method was declared to be of class type, rather than of instance type. Deleting the
//: "class" keyword fixes this. Problem 3: "let var" is declaring a variable constant (oxymoron). One
//: has to go. Since we're clearly trying to use optional binding here, "let" stays, "var" goes.
//: Problem 3: Trying to use optional binding on a non-optional type from dictionary value. 
//: Solution: Declare Dictionary value as Int Optional, and force unwrap in the body of the optional binding.
//: Problem 4: Dictionary was declared but not initialized, and hence was referenced before being initialized.
//: Solution: Use alternate initializer: var countLetters  = [Character : Int?]()  ]
    
    
}


//: ## Check Your Answers
//: ### If you now see an output stream in the right sidebar, you have successfully
//: ### debugged the code above. Remember that you must also fully and correctly answer
//: ### all of the written questions above to receive full credit for this homework.


//: **DO NOT** touch any code below this point.
Words.arePalindromes(["hih", "racecar", "mom", "wow"])
Words.arePalindromes(["gene", "shawn", "hello"])
var wordsObj = Words.init(wordA: "anagram", wordB: "managra")
wordsObj.isAnagram()
wordsObj.wordA = "hello"
wordsObj.wordB = "what"
wordsObj.isAnagram()
