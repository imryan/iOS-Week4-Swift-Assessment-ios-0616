# iOS Week4 Swift Assessment

This assessment is designed to test students' ability to create view controllers, navigation controllers, and nested views in Interface Builder, then combine these elements programmatically.

The resulting program should display a list of words in a table view which shift in position when a "Shift" button is tapped.

## Part 1
You are provided two files: `Main.storyboard` and `ViewController.swift`.

### Storyboard
* In Interface Builder, add a view controller.
* Embed that view controller inside a navigation controller.
* Set the custom class of the view controller in Interface Builder to the `ViewController.swift` file.
* In Interface Builder, add a table view to the view of the view controller.
* Add a prototype cell to the table view and set its reuse identifier to `basicCell`.
* Create an IBOutlet from this table view to the `ViewController.swift` file and name this outlet `tableView`.

### ViewController Class

* Start by typing the following at the end of the `viewDidLoad()` method.

```swift
tableView.delegate = self
tableView.dataSource = self
```

* These lines indicate the view controller has adopted the UITableViewDataSource and UITableViewDelegate protocols. Since this view controller is claiming to take on the responsibility for table views, what functions do we need to implement? Don't implement those functions (yet), but declare them to get rid of the visible errors.

* We want to be able to store `String`s inside of an `Array` within our `ViewController` that will ultimately be displayed inside our `tableView`. Add an instance property on `ViewController` called `electricWords`. Its default value should be an array of words. What words? Each word from this sentence:

> We're going to rock down to Electric Avenue

* We need to set up the constraints on our `tableView`, but not in Interface Builder. You're going to set up constraints in code! Create a separate function called `setupTableView()` that takes in no arguments and returns nothing. The sole purpose of this function is to setup the proper constraints as follows:
  * `tableView` width should equal the width of the `view`
  * `tableView` height should be 75% of the height of the `view`
  * `tableView` center X should be equal to the `view`'s center X.
  * `tableView` bottom should equal the `view`'s bottom.

* Implement those table view methods you were asked to declare above. What content is being displayed? How many rows do we need? How do we create a cell to populate each row?

Run the app and see that each row in your table view contains one word from the provided sentence.

## Part 2
* Create a function called `shift(number:words:)`, which takes in an `Int` and an `Array` of `String`s and returns an `Array` of `String`s. This function should shift the contents of the `Array` argument by the number of spaces indicated by the `Int` argument. The shifted array is what should be returned. For example:

```swift
let billWords = ["Bill", "Nye", "the", "Science", "Guy"]

print(billWords)
// prints "["Bill", "Nye", "the", "Science", "Guy"]"

let result = shift(number: 2, words: billWords)

print(result)
// prints "["Science", "Guy", "Bill", "Nye", "the"]"
```

* In Interface Builder add a bar button item to the navigation bar and change its text to `Shift`.
* Connect this button to an `IBAction` called `shiftButtonTapped` in the `ViewController` class.
* The following should happen when the `Shift` button is tapped:
  * A random number should be generated.
  * The `shift` function should be called and the random number and `electricWords` should be passed in as arguments. The return should be assigned to `electricWords`.
  * `tableView` should be updated with the shifted array's contents.

Run the app and see that tapping the `Shift` button results in the strings shifting appropriately.
