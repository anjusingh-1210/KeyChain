//
//  Model.swift
//  Demo
//
//  Created by Mamta on 11/11/21.
//

import Foundation
struct Employee {
    var username: String?
    var password: String?
}

struct Stack {
    private var items: [String] = []
    
    func peek() -> String {
        
        guard let topElement = items.first else {
            fatalError("This stack is empty")
            
        }
        return topElement
    }
    
    mutating func pop() -> String {
        return items.removeFirst()
    }
    
    mutating func push( element: String) {
        items.insert(element, at: 0)
    }
}
