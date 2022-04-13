import UIKit

struct Stack {

    var sentence: [Element] = []
    
    public init() {  }
    
    mutating func push(_ string: Element){
        sentence.append(string)
    }
    mutating func pop() -> Element? {
        sentence.popLast()
    }
    public func peek() -> Element? {
        guard let topElement = sentence.first
        else { fatalError("The stack is empty") }
        return topElement
    }
}

extension Stack: CustomStringConvertible  {
    public var description: String {
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n-----------\n"

        let stackElements = storage.joined(separator: "\n")
        
        return topDivider + stackElements + bottomDivider
    }
}



func checkParentheses(_ sentence: String) -> Bool {
    
    var stack = Stack<character>()
    
    for character in sentence {
        if character == "(" {
            stack.push(character)
        } else if character == ")" {
          if stack.isEmpty {
            return false
          } else {
              stack.pop()
          }
        }
    }
    return stack.isEmpty
}

