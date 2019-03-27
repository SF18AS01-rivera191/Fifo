//
//  EmployeeTableViewController.swift
//  Lifo
//
//  Created by Mark Meretzky on 3/22/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import UIKit;

class EmployeeTableViewController: UITableViewController {
    //var employees: MyStackOfStrings = MyStackOfStrings();
    //var employees: MyStackOfInts    = MyStackOfInts();   //version 2
    //var employees: MyStack          = MyStack();
    //var employees: MyStack<String>  = MyStack<String>();
    var employees: MyQueueOfStrings<String> = MyQueueOfStrings<String>();
    
    override func viewDidLoad() {
        super.viewDidLoad();

        // Uncomment the following line to preserve selection between presentations
        // clearsSelectionOnViewWillAppear = false;

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         navigationItem.leftBarButtonItem = editButtonItem;
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath);

        // Configure the cell ...
        // The employeeNumber of the employee displayed in this cell.
        // The oldest employee has employeeNumber 1.
        // The most recent employee has employeeNumber employees.count
        
        let employeeNumber: Int = indexPath.row + 1;

        let employeeValue: String = employees[indexPath.row];
        //let employeeValue: Int = employees.get(employeeNumber - 1);   //version 2

        cell.textLabel!.text = "\(employeeNumber). \(employeeValue)";
        return cell;
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        // Only the most recently hired employee can be fired.
        return indexPath.row == 0;
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {
            return;
        }
        // Delete the row from the data source
        _ = employees.dequeue();
        tableView.deleteRows(at: [indexPath], with: .fade);
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        guard let viewController: ViewController = segue.destination as? ViewController else {
            fatalError("destination was of type \(type(of: segue.destination))");
        }
        
        // Pass the selected object to the new view controller.
        viewController.count = employees.count;
    }
    
    @IBAction func unwind(unwindSegue: UIStoryboardSegue) {
        guard unwindSegue.identifier == "HireSegue" else {
            return;   //Do nothing if the user cancelled the new hiring.
        }
        
        guard let viewController: ViewController = unwindSegue.source as? ViewController else {
            fatalError("source was of type \(type(of: unwindSegue.destination))");
        }

        let stringFromTextField: String = viewController.textField.text ?? "";
        
        let employeeValue: String = stringFromTextField;
        //guard let employeeValue: Int = Int(stringFromTextField) else {   //version 2
        //    fatalError("could not convert string \"\(stringFromTextField)\" to Int");
        //}

        employees.enqueue(employeeValue);
        tableView.reloadData();
    }
}
