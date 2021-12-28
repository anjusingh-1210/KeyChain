//
//  ViewModel.swift
//  Demo
//
//  Created by Mamta on 11/11/21.
//

import Foundation
protocol getEmployeeData {
    func getEmpData(username: String?, password: String?)
}
class EmployeeData {
    
    
    var username: String?
    var password: String?
    init() {
       
        
    }
    func setData() {
        self.username = "Anju"
        self.password = "12345"
    }
}
