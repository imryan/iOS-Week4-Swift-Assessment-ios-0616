# iOS Week4 Swift Assessment

This assessment is designed to test students' ability to create view controllers, navigation controllers, and nested views in Interface Builder, then combine these elements programmatically.

## Part 1
You are provided two files: `Main.storyboard` and `ViewController.swift`.

### Storyboard
* In Interface Builder, add a View Controller.
* Embed that View Controller inside of a Navigatoin Controller.
* Set the custom class of the View Controller in Interface Builder to the `ViewController.swift` file.
* In Interface Builder, add a Table View to the view of the View Controller.
* Create an IBOutlet from this Table View to the `ViewController.swift` file and name this outlet `tableView`.


### ViewController Class

* To get rid of those errors, lets start by typing the following in the `viewDidLoad()` method, below `super.viewDidLoad()`.

```swift
self.tableView.delegate = self
self.tableView.dataSource = self
```
* Now what? If we are making claim to take on the responsibility for table views, what methods do we need to implement? Don't implement those functions (yet), but create them to get rid of these errors (for now).


* We want to be able to store `String`'s inside of an `Array` within our ViewController that will ultimately be displayed inside our `tableView`.  Add a instance property on our View Controller called `eletricWords`, it's default value should be an array of words. What words? Each word from this sentence:
> We're going to rock down to Electric Avenue


* We need to setup the constraints on our `tableView`, but we  aren't going to do this in Interface Builder. You're required to setup constraints in code! But don't just throw this in `viewDidLoad()`. Create a separate function called `setupTableView()` that takes in no arguments and returns nothing. The sole purpose of this function is to setup the proper constraints as follows:
	*  `tableView` width should equal the width of the `view`
	* `tableView` height should be 75% of the height of the `view`
	* `tableView` center X should be equal to the `view`'s center X.
	* `tableView` bottom should equal the `view`'s bottom.


* Implement those three methods you were asked to make in the first step. How many sections should we have here? How many rows (what are we looking to display)? How do we create this cell?


Run the app and see that each row in your table view contains one word from the provided sentence.

## Part 2
* Create a function called `shift(_:words:)`, which takes in an `Int` and an `Array` of `String`'s and returns an `Array` of `String`'s. This function should shift the contents of the array argument by the number of spaces indicated by the int argument. The shifted array is what should be returned. For example:

```swift
let billWords = ["Bill", "Nye", "the", "Science", "Guy"]

print(billWords)
// prints "["Bill", "Nye", "the", "Science", "Guy"]"


let result = shift(2, words: billWords)

print(result)
// prints "["Science", "Guy", "Bill", "Nye", "the"]"
```

* In Interface Builder add a bar button item to the navigation bar and change its text to `Shift`.
* Connect this button to an `IBAction` called `shiftButtonTapped` in the `ViewController` class which calls the `shift` function you just wrote.
* The following should happen when the `Shift` button is tapped:
  * A random number should be generated.
  * The `shift` function should be called and the random number and `electricArray` should be passed in as arguments. The return should be assigned to `electricArray`.
  * `tableView` should be updated with the shifted array's contents.

Run the app and see that tapping the `Shift` button results in the strings shifting appropriately.
