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
    
    var words = ["We're", "going", "to", "rock", "down", "to", "Electric", "Avenue"]
    
    @IBAction func shift() {
        let alertController = UIAlertController(title: "Shift", message: "How many indices to shift?", preferredStyle: .Alert)
        let randomShiftAction = UIAlertAction(title: "Random Shift", style: .Default) { (_) in
            let random = Int(arc4random_uniform(UInt32(self.words.count)))
            self.shift(random, words: self.words)
        }
        
        let shiftAction = UIAlertAction(title: "Shift", style: .Default) { (_) in
            let numberField = alertController.textFields![0]
            
            if let text = numberField.text {
                if let value = Int(text) {
                    self.shift(value, words: self.words)
                }
            }
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.keyboardType = .NumberPad
            textField.placeholder = "2"
        }
        
        alertController.addAction(shiftAction)
        alertController.addAction(randomShiftAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "CellId"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath)
        
        cell.textLabel?.text = words[indexPath.row]
        
        return cell
    }
    
    func setupConstraints() {
        tableView.topAnchor.constraintEqualToAnchor(view.topAnchor).active = true
        tableView.widthAnchor.constraintEqualToConstant(view.frame.size.width).active = true
        tableView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor).active = true
    }
    
    func shift(number: Int, words: [String]) {
        var newStrings = words
        
        for _ in 1...number {
            let lastItem = newStrings.popLast()
            newStrings.insert(lastItem!, atIndex: 0)
        }
        
        self.words = newStrings
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.removeConstraints(view.constraints)
        
        self.tableView.removeFromSuperview()
        self.view.addSubview(self.tableView)
        
        setupConstraints()
    }
}
