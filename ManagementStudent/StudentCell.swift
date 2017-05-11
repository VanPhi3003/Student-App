//
//  StudentCell.swift
//  ManagementStudent
//
//  Created by Phi Trinh on 5/9/17.
//  Copyright © 2017 Phi Trinh. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {

    
    @IBOutlet weak var lblStudentName: UILabel!
    
    func configCellWith(student: Student) {
        lblStudentName.text! = student.name
        
    }

}
