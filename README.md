# BugReporter

This document provides an overview of our app's BugReporter feature and instructions for developers to set up the app, which includes dependencies managed by CocoaPods.

## BugReporter Feature Overview

The BugReporter is a feature designed to enhance user engagement and facilitate the bug reporting process. It allows users to either capture bugs via screenshots directly within the app or upload images from their gallery. These reports are then organized into a Google Sheet through the user's Google account, with a new tab for each day detailing the bugs reported, including titles and image URLs.

## Installation Instructions

Follow these steps to set up the iOS app on your development machine. This setup guide assumes the app uses CocoaPods for dependency management.

### Prerequisites

- Ensure CocoaPods is installed on your system. If you do not have CocoaPods, install it using the following command:

    ```sh
    sudo gem install cocoapods
    ```

### Setup

1. **Clone the Repository:**
   
   Use Git to clone the app's repository to your local machine:

    ```sh
    git clone [Repository URL]
    cd [App Directory]
    ```

    Replace `[Repository URL]` with the actual URL of your app's Git repository and `[App Directory]` with the name of the folder where your app is stored.

2. **Install Dependencies with CocoaPods:**

   Inside the app directory, install the required CocoaPods dependencies:

    ```sh
    pod install
    ```

3. **Open the Workspace:**

   After installing dependencies, open the `.xcworkspace` file in Xcode:

    ```sh
    open [YourAppName].xcworkspace
    ```

    Replace `[YourAppName]` with the actual name of your app.

4. **Build and Run:**

   - Select an iOS simulator or connect an iOS device to your Mac.
   - Build and run the app in Xcode by pressing the `Run` button or using the shortcut `Cmd + R`.

### Note

- Ensure your development machine has the latest version of Xcode and the iOS SDK installed.
- The BugReporter feature requires configuration of the Google Sheets API and appropriate permissions in your Google Cloud Console.
