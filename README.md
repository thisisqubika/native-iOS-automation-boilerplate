# Native Automation for iOS

This project aims to automate testing for native mobile applications developed for iOS platforms, this project will be using **Swift** as programming language and **XCUITest** as the Testing framework

## Project Objective

Test automation on mobile devices can be performed with different tools, such as Detox or Appium. These tools will be useful when the application is developed with a cross-platform approach, for example applications made with react-native or flutter. On the other hand, when the applications are native for each platform, the native automation approach appears. In this repository you will find examples of how this automation can be done for iOS platforms.

## Requirements
Make sure you have the following tools and environments set up on your system before running the tests:
  - Xcode: For iOS test development and execution.
  - iOS Emulators: Natively included with XCode dev tools.
  - Swift: The programming language used in the automation project.
  - Cocoapods (Optional): Will be needed if the project uses external packages

## Getting Started
Run iOS Tests from terminal: ```make run-tests``` (You must be located on project root directory to run this command)
For more information about the commands that are being executed to run the test check the Makefile

## Folder Structure
- **AccessibilityIdentifiers**: Location for enums containing the ids used to get elements
- **Base**: Setup and Teardown configuration
- **Extensions**: Base interactions extending **XCElement** class
- **GenericComponents**: Generic way to interact with reused components
- **Screens**: Page Object Models for the app screens
- **TestData**: Test data to use in tests
- **Tests**: Test scripts

## Getting the elements
A breakpoint must be setted and the test should be runned.
When the execution stops at the breakpoint, the terminal can be used to type `po app`, with this command the whole structure of the screen will be displayed on the terminal.

## Resources
- [iOS App Example: TAU iOS Automation course](https://testautomationu.applitools.com/introduction-to-ios-test-automation-with-xcuitest/)
- [XCUITest resource and cheatsheet](https://www.hackingwithswift.com/articles/148/xcode-ui-testing-cheat-sheet)

## App Examples
- [iOS](https://github.com/Shashikant86/XCUITest-TAU)