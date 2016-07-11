//
//  TestViewController.swift
//  iOS-Week4-Swift-Assessment
//
//  Created by Flatiron School on 7/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var electricArray = "We're going to rock down to Electric Avenue".componentsSeparatedByString(" ")
    // And then we'll take it higher!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.setupTableView()
    }
    
    func setupTableView() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.removeConstraints(self.tableView.constraints)
        self.tableView.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.75).active = true
        self.tableView.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor).active = true
        self.tableView.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        self.tableView.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor).active = true
    }
    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return self.electricArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if let textLabel = cell.textLabel {
            textLabel.text = self.electricArray[indexPath.row]
        }
        
        return cell
    }
    
    @IBAction func shiftButtonTapped(sender: AnyObject) {
        let randomNumber = Int(arc4random_uniform(UInt32(self.electricArray.count)))
        print("Shift strings in \(self.electricArray)\n \(randomNumber) spaces")
        self.electricArray = self.shift(randomNumber, strings: self.electricArray)
        print("Result: \(self.electricArray)")
        self.tableView.reloadData()
    }
    
    func shift(spaces: Int, strings: Array<String>) -> Array<String> {
        var shiftedStrings = strings
        var i = spaces
        while i > 0 {
            if let lastString = shiftedStrings.popLast() {
                shiftedStrings.insert(lastString, atIndex: 0)
            }
            i -= 1
        }
        return shiftedStrings
    }

}