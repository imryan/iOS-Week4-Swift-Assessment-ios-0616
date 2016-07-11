//
//  TestViewController.swift
//  iOS-Week4-Swift-Assessment
//
//  Created by Flatiron School on 7/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var testTableView: UITableView! = UITableView()
    
    var testStrings = ["we're", "going", "to", "rock", "down", "to", "electric", "avenue"]
    // And then we'll take it higher!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }

    func setupTableView() {
        self.testTableView.delegate = self
        self.testTableView.dataSource = self
        
        self.testTableView.translatesAutoresizingMaskIntoConstraints = false
        self.testTableView.removeConstraints(self.testTableView.constraints)
        self.testTableView.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor).active = true
        self.testTableView.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor).active = true
        self.testTableView.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
        self.testTableView.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
    }
    

    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return self.testStrings.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if let textLabel = cell.textLabel {
            textLabel.text = self.testStrings[indexPath.row]
        }
        
        return cell
    }
    
    @IBAction func shuffleButtonTapped(sender: AnyObject) {
        print("Shuffling strings in \(self.testStrings)")
        var tempArray: Array<String> = []
        while self.testStrings.count > 0 {
            let index = Int(arc4random_uniform(UInt32(self.testStrings.count)))
            tempArray.append(self.testStrings[index])
            self.testStrings.removeAtIndex(index)
        }
        self.testStrings = tempArray
        print("Result: \(self.testStrings)")
        self.testTableView.reloadData()
    }
    
    @IBAction func shiftButtonTapped(sender: AnyObject) {
        let randomNumber = Int(arc4random_uniform(UInt32(self.testStrings.count)))
        print("Shift strings in \(self.testStrings)\n \(randomNumber) spaces")
        self.testStrings = self.shift(randomNumber, strings: self.testStrings)
        print("Result: \(self.testStrings)")
        self.testTableView.reloadData()
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

