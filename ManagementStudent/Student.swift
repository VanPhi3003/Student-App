//
//  Student.swift
//  ManagementStudent
//
//  Created by Phi Trinh on 5/9/17.
//  Copyright © 2017 Phi Trinh. All rights reserved.
//

import Foundation
class Student {
    var name: String
    var university: String
    var information: String
    var yearOld: Int
    
    init(name: String, university: String, information: String, yearOld: Int) {
        self.name = name
        self.university = university
        self.information = information
        self.yearOld = yearOld
    }
    
    class func createStudent() -> [Student]{
        var students = [Student]()
        
        students.append(Student(name: "Name 1", university: "University 1", information: "Info 1", yearOld: 19))
        students.append(Student(name: "Name 2", university: "University 2", information: "Info 2", yearOld: 19))
        students.append(Student(name: "Name 3", university: "University 3", information: "Info 3", yearOld: 19))
        students.append(Student(name: "Name 4", university: "University 4", information: "Info 4", yearOld: 19))
        students.append(Student(name: "Name 5", university: "University 5", information: "Info 5", yearOld: 19))
        students.append(Student(name: "Name 6", university: "University 6", information: "Info 6", yearOld: 19))
        students.append(Student(name: "Name 7", university: "University 7", information: "Info 7", yearOld: 19))
        students.append(Student(name: "Name 8", university: "University 8", information: "Info 8", yearOld: 19))
        
        return students
    }
}
