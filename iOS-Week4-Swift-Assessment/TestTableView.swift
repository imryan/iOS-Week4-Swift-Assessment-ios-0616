//
//  TestTableView.swift
//  iOS-Week4-Swift-Assessment
//
//  Created by Flatiron School on 7/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TestTableView: UITableView {

    var testStrings = ["we're", "going", "to", "rock", "down", "to", "electric", "avenue"]
    
    // And then we take it higher!
    
    override func numberOfRowsInSection(section: Int) -> Int {
        return testStrings.count
    }
    
    override func cellForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell? {
        let cell = dequeueReusableCellWithIdentifier("testCell", forIndexPath: indexPath)
        
        if let textLabel = cell.textLabel {
            textLabel.text = testStrings[indexPath.row]
        }
        
        return cell
    }
    
    func shuffle() {
        var tempArray: Array<String> = []
        while self.testStrings.count > 0 {
            let index = Int(arc4random_uniform(UInt32(self.testStrings.count - 1)))
            tempArray.append(self.testStrings[index])
            self.testStrings.removeAtIndex(index)
        }
        self.testStrings = tempArray
        self.reloadData()
    }
    
}
