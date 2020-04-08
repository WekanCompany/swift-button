# swift-button
A library that has buttons of different types for use in apps

## How to use ##

* Add ```` WekanButton.swift```` class to your project.
* When you declare UIButtons, declare them as WekanButton. Change the type in storyboard as well.
 ````
 @IBOutlet weak var borderedTextBtn: WekanButton!
````
* Configure the button
````
borderedTextBtn.configure(withContent: .textOnly,
                          backgroundType: .outlined,
                          cornerType: .smooth,
                          text: "New User?")
````
