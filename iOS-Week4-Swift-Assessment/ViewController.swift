//
//  TestViewController.swift
//  iOS-Week4-Swift-Assessment
//
//  Created by Flatiron School on 7/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /*
     
     * Add your properties here!
     
     */
    
    override func viewDidLoad() {
        self.tableView.removeFromSuperView()
        self.view.addSubview(self.tableView)
        super.viewDidLoad()
    }
    
    /*
 
     * Write your code here!
 
    */
}
