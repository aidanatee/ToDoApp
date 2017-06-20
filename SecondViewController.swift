//
//  SecondViewController.swift
//  MyToDo
//
//  Created by Айдана Токбаева on 6/15/17.
//  Copyright © 2017 Aidana Tokbayeva. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate{
 
    @IBOutlet weak var toDoLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    var delegate: Communicatable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self;
        
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        if (textField.text != ""){
            delegate?.get(message: textField.text)
        }
        self.navigationController?.popViewController(animated: true)
    }
  
    func get(message: String?) {
        textField.text = message
        
    }
}
