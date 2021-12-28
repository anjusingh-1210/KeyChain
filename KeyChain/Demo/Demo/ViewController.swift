//
//  ViewController.swift
//  Demo
//
//  Created by Mamta on 11/11/21.
//

import UIKit


class ViewController: UIViewController, getEmployeeData {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var nameStack = Stack()
        nameStack.push(element: "Objective C")
        nameStack.push(element: "Swift")
        nameStack.push(element: "Java")
        print(nameStack)
        let a: String = nameStack.pop()
        let b: String  = nameStack.peek()
        print(a, b)
//        let empData = EmployeeData()
//        empData.setData()
//        self.getEmpData(username: empData.username, password: empData.password)
//        // Do any additional setup after loading the view.
    }
    func getEmpData(username: String?, password: String?) {
        let emp: Employee = Employee.init(username:username , password: password)
        print(emp.username ?? "", emp.password ?? "")
    }
    


}

