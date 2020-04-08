# swift-button

WekanButton is a custom button with different types and styles. You can also customise it. 

![alt text](https://github.com/WekanCompany/swift-button/blob/master/readme_screenshot.png)


## How to use ##

* Drag-drop the ```` WekanButton.swift```` class to your project.

* Declare the button as WekanButton
 ````
 @IBOutlet weak var loginButton: WekanButton!
````

* When adding UIButton in storyboard, change class to ```` WekanButton ````, and change the button type to ````custom````.  Set the requitred constraints.


* Configure the buttons as shown in the sample ViewController
````
loginButton.configure(withContent: .textOnly,
                          backgroundType: .outlined,
                          cornerType: .smooth,
                          text: "Login")
````
