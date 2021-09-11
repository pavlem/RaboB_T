# RaboB_T


First checkout the project and start the **RaboBT.xcodeproj** file, there are no third party dependencies, so it’s pretty simple. In case you want to build on a real device, add your bundle ID project settings. 

# User Interface:
* Just build the app and you will see the data fetched from the local CSV file inside a collection view (this is simulation of the API call)
* You can scroll this collection vertically like it was a classical table view.
* You can tap on any cell and the information will be printed. This can be expanded to show details for example.

# Architecture:
* MMVM-C is used as an app design pattern since it complements Apple's native, out of the box, MVC for UIKit and it's new MVVM in SwiftUI. Coordinator pattern is used to handle the flow for example from the main collection view list to the details screen
* Unit test is made for view model and this is just an example
* Reusable components have been made (like BlockingScreen) for illustration purposes. 
* File organisation: 
    * App - App related data 
    * Models
    * Views
    * ViewControllers
    * ViewModels
    * Lib - all custom made libraries 
    * Resources - storyboards, strings, images

**
**
