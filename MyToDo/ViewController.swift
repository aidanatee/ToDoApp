//
//  ViewController.swift
//  MyToDo
//
//  Created by Айдана Токбаева on 6/15/17.
//  Copyright © 2017 Aidana Tokbayeva. All rights reserved.
//

import UIKit


class ViewController: UIViewController, Communicatable {
    
    var message: String?
    var list = ["buy milk", "visit grandma", "find a sofa"]
    
    @IBOutlet weak var editBarButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func nextPage(_ sender: Any) {
        let myVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        myVC.delegate = self
        navigationController?.pushViewController(myVC, animated: true)
    }
    
    func get(message: String?) {
        list.append(message ?? " ")
        tableView.reloadData()
    }
    
    @IBAction func editAction(_ sender: Any) {
         self.tableView.isEditing = !self.tableView.isEditing
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")
        cell?.textLabel?.text = list[indexPath.row]
        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    
        func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
       
            return true
        }
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                list.remove(at: indexPath.row)
                tableView.reloadData()
            }
        }
        func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
            let moved = list.remove(at: sourceIndexPath.row)
            list.insert(moved, at: destinationIndexPath.row)
        }
    }


