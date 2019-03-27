//
//  ViewController.swift
//  Lifo
//
//  Created by Mark Meretzky on 3/22/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import UIKit;

class ViewController: UIViewController {
    var count: Int?;   //how many employees we currently have

    @IBOutlet weak var textField: UITextField!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        title = "Employee number \(count! + 1)";
        textField.becomeFirstResponder();
    }

    @IBAction func returnKeyPressed(_ sender: UITextField) {
        sender.resignFirstResponder();
    }
    
}
