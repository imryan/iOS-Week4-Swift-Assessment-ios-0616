# iOS Week4 Swift Assessment

This assessment is designed to test students' ability to create view controllers, navigation controllers, and nested views in Interface Builder, then combine these elements programmatically.

## Part 1 (30 minutes)
You are provided two files: `Main.storyboard` and `ViewController.swift`.

### Storyboard
* In interface builder, add a view controller nested within a navigation controller.
* We'll need to customize the content of the view controller programmatically, so set its class to `ViewController`.
* Add a table view to this view controller, then connect the table view to `ViewController` as an `IBOutlet` named `tableView`.

### ViewController Class
* Add a property to your class file called `electricArray` which contains as a collection each separate word in this sentence: `We're going to rock down to Electric Avenue`
  * Set this as a calculated property if you can. Otherwise, manually enter in the default value for `electricArray`.
* Post the following two lines into your `viewDidLoad` method:

```swift
self.tableView.delegate = self
self.tableView.dataSource = self
```

* Create a function called `setupTableView` call this from your `viewDidLoad`. This function should layout the table view you added in Interface Builder to be equal in width to the superview, 75% the height of the superview, centered along the X axis of the superview, and pinned to the bottom of the superview.
* `tableView` should have as many rows as there are strings in `electricArrays`.
* Set the 

## Part 2 (15 minutes)
