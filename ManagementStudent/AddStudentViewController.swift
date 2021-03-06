//
//  AddStudentViewController.swift
//  ManagementStudent
//
//  Created by Phi Trinh on 5/10/17.
//  Copyright © 2017 Phi Trinh. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController {

    
    @IBOutlet weak var txtStudentName: UITextField!
    
    @IBOutlet weak var txtStudentYearOld: UITextField!
    
    @IBOutlet weak var txtStudentSchool: UITextField!
    
    @IBOutlet weak var txtStudentINformation: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func actionSave(_ sender: UIBarButtonItem){
        if txtStudentName.text!.isEmpty || txtStudentSchool.text!.isEmpty ||  txtStudentINformation.text!.isEmpty ||  txtStudentYearOld.text!.isEmpty {
            let alert = UIAlertController(title: "Thông Báo", message: "Thiếu thông tin", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil));
            
            self.present(alert, animated: true, completion: nil);
        }
        else {
            Constants.isLoadDataAgain = true
            let student: Student = Student(name: txtStudentName.text!, university: txtStudentSchool.text!, information: txtStudentINformation.text!, yearOld: Int(txtStudentYearOld.text!)!)
            Constants.student = student
            self.navigationController?.popViewController(animated: true)
        }
    }
    

}
