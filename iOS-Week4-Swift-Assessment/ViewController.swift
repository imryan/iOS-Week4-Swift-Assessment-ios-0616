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
        tableView.delegate = self
        tableView.dataSource = self
        setupTableView()
    }
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.removeConstraints(tableView.constraints)
        tableView.heightAnchor.constraintEqualToAnchor(view.heightAnchor, multiplier: 0.75).active = true
        tableView.widthAnchor.constraintEqualToAnchor(view.widthAnchor).active = true
        tableView.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        tableView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor).active = true
    }
    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return electricArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        if let textLabel = cell.textLabel {
            textLabel.text = electricArray[indexPath.row]
        }
        
        return cell
    }
    
    @IBAction func shiftButtonTapped(sender: AnyObject) {
        let randomNumber = Int(arc4random_uniform(UInt32(electricArray.count)))
        print("Shift strings in \(electricArray)\n \(randomNumber) spaces\n")
        self.electricArray = shift(randomNumber, strings: electricArray)
        print("Result: \(electricArray)\n")
        tableView.reloadData()
    }
    
    func shift(spaces: Int, strings: [String]) -> [String] {
        var shiftedStrings = strings
        var i = spaces % strings.count
        while i > 0 {
            if let lastString = shiftedStrings.popLast() {
                shiftedStrings.insert(lastString, atIndex: 0)
            }
            i -= 1
        }
        return shiftedStrings
    }
    
}
