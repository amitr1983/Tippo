# Pre-work - *Tippo Tip Calculator*

Tippo is a tip calculator application for iOS.

Submitted by: Amit Kumar Rajoriya

Time spent: 4.5 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] Remember the Bill amount & default Tip percentage at App start.
- [x] Consistent behaviour on both Main & settings screen

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

![Walkthrough of ios_tip_calculator](https://github.com/amitr1983/Tippo/blob/master/screenshot/ios_tip_calculator.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** I’m very impressed by iOS App development platform so far. Its very exciting to see that we don’t need to reinvent the wheel for anything and everything is ready to use given that we understand the platform thoroughly and know how to use any method and why? 

In my opinion, Outlet and Action are simple keywords used by Interface builder.  Outlet is a declaration of UI object and provide a reference to UI. Eg. You create a textfield then you need to create an outlet in order to declare it. On the other hand action tell the UI which method to call. Eg. Get text from textfield. 
Interface build created a XML under the hood and Outlet and Action are defender under connections..


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
