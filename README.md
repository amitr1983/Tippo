# Pre-work - *Tippo Tip Calculator*

Tippo is a tip calculator application for iOS.

Submitted by: Amit Kumar Rajoriya

Time spent: 13.5 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] **Customer can save take a picture** of receipt and save it for later use.
- [x] Remember the Bill amount & default Tip percentage at App start.
- [x] Consistent behaviour on both Main & settings screen
- [x] Fixed Autolayout. Its showing correctly across devices (Portrait) 
- [x] Added Per Person slider and deviding bill across group
- [x] Added Light/Dark ThemeSelection

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

![Walkthrough of ios_tip_calculator](https://github.com/amitr1983/Tippo/blob/master/screenshot/ios_tip_calculator.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** I’m very impressed by iOS App development platform so far. Its very exciting to see that we don’t need to reinvent the wheel for anything and everything is ready to use given that we understand the platform thoroughly and know how to use any method and why? 

In my opinion, Outlet and Action are simple keywords used by Interface builder.  Outlet is a declaration of UI object and provide a reference to UI components. Eg. You create a textfield then you need to create an outlet in order to link it to this textfield. On the other hand action tell the UI which method to call. Eg. Get text from textfield. 
Interface builder creates a XML under the hood and Outlet and Action are defender under connections. Whenever user create/edit an outlet or action, it updates the xml files and set the correct attribute for Outlet and Action.

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** Before explaining how to get a strong reference cycle for closure, I would like to explain what is strong reference cycle. Strong reference is a type of reference which protects the object from getting deallocated from automatic reference count (ARC).
We can get a strong reference cycle for closures by assigning it to class property and closure capture the instance. This capture happens because closure are reference type. Assigning a closure to the property, assign a reference to the closure. This create two strong reference which prevent deallocation from ARC. Capture list is a solution to resolve that. 

## License

    Copyright [2017] [Amit Rajoriya]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
