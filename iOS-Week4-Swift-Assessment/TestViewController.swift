//
//  TestViewController.swift
//  iOS-Week4-Swift-Assessment
//
//  Created by Flatiron School on 7/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    @IBOutlet weak var testTableView: TestTableView! = TestTableView()
    
    var shuffleCounter = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }

    func setupTableView() {
        self.testTableView.translatesAutoresizingMaskIntoConstraints = false
        self.testTableView.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor).active = true
        self.testTableView.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor).active = true
        self.testTableView.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        self.testTableView.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
        
        
    }
    
    @IBAction func colorButtonTapped(sender: AnyObject) {
        self.view.backgroundColor = getRandomColor()
    }
    
    func getRandomColor() -> UIColor{
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
    
    @IBAction func shuffleButtonTapped(sender: AnyObject) {
        self.testTableView.shuffle()
    }
    
}

