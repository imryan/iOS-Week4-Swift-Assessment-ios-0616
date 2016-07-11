# iOS Week4 Swift Assessment

This assessment is designed to test students' ability to create view controllers, navigation controllers, and nested views in Interface Builder, then combine these elements programmatically.

## Part 1 (30 minutes)
You are provided two files: `Main.storyboard` and `ViewController.swift`.

### Storyboard
* In interface builder, add a view controller embedded within a navigation controller.
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
* Set the text of each cell's `textLabel` to the string in `electricArray` that correspond's to the cell's row.

Run the app and see that each row in your table view contains one word from the provided sentence.

## Part 2 (15 minutes)
* Create a function called `shift`, which takes in an int and an array of strings and returns an array of strings. This function should shift the contents of the array argument by the number of spaces indicated by the int argument. The shifted array is what should be returned. For example:

```swift
Int = 2
Array = ["Bill", "Nye", "the", "Science", "Guy"]
Result = ["Science", "Guy", "Bill", "Nye", "the"]
```

* In Interface Builder add a bar button item to the navigation bar and change its text to `Shift`.
* Connect this button to an `IBAction` called `shiftButtonTapped` in the `ViewController` class which calls the `shift` funciton you just wrote.
* The following should happen when the `Shift` button is tapped:
  * A random number should be generated.
  * The `shift` function should be called and the random number and `electricArray` should be passed in as arguments. The return should be assigned to `electricArray`.
  * `tableView` should be updated with the shifted array's contents.

Run the app and see that tapping the `Shift` button results in the strings shifting appropriately.