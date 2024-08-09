# GIF Finder
#### Video Demo:  https://youtu.be/6TJ5ZS9gaqQ

### Project Description:

This is an app designed for GIF enthusiasts, offering a vibrant platform where you can discover the most popular and trending GIFs of the moment. With an intuitive search feature, you can easily find GIFs that match your mood or preferences, whether you're looking for something funny, emotional, or just plain quirky. The app also allows you to share your favorite GIFs with friends and on social media, making it easy to spread the fun. Additionally, you can save your favorite GIFs to a personalized collection, so you can quickly access and use them later for any occasion. Whether you want to browse, search, share, or save, this app provides a seamless and enjoyable experience for all your GIF needs.


### Screenshots


<table>
  <tr>
    <td>
      <img src="https://github.com/user-attachments/assets/e53bc80b-6899-435b-b462-fdd96f34da9a" alt="App Screenshot 2" width="300" /> 
    </td>
    <td>
      <img src="https://github.com/user-attachments/assets/bc4b4cc4-86bb-4566-985d-739eff0c8ef3" alt="App Screenshot 1" width="300" />
    </td>
    <td>
      <img src="https://github.com/user-attachments/assets/30b4f0be-2266-4f4d-aab0-fe286fab41cd" alt="App Screenshot 1" width="300" />
    </td>
    <td>
      <img src="https://github.com/user-attachments/assets/8d16788d-0846-4d7f-a2ff-7b1f9cb5278a" alt="App Screenshot 1" width="300" />
    </td>
  </tr>
</table>


## Getting Started

### Prerequisites
The app has been tested on android using vscode.

Before setting up the project, ensure you have the following installed on your development machine:

- Flutter SDK 3.22.3
- Dart SDK 3.4.4
- Git (to clone the repository)

- ### Clone the Repository
```
git clone https://github.com/joaoconstancio1/gif_finder_CS50.git
cd gif_finder_CS50
```

### Flutter and Dart Versions
Make sure you have Flutter SDK version 3.22.3 and Dart SDK version 3.4.4 installed. You can check the versions by running the following commands:

```
flutter --version
dart --version
```

If the Flutter or Dart version is different, you can download and install the specific versions using the Flutter SDK manager or by visiting the Flutter and Dart websites.

### Get Dependencies
After cloning the repository and ensuring you have the correct Flutter and Dart versions installed, you need to get the project dependencies. Run the following command in the project root directory:

```
flutter pub get
```
This will fetch all the required packages and dependencies for the project.

### Run the App

You can run the app on an emulator/simulator or a physical device by executing the following command:

```
flutter run 
```


This will build the app and run it on the connected device. Make sure you have the emulator/simulator running or a physical device connected to your development machine.

Now, you should have the project set up and running successfully with the specified Flutter and Dart versions!

Here's an improved version of your project description in English:

---

## Project Overview

This Flutter application is designed to provide a seamless experience for browsing and sharing GIFs using the Giphy Developers API. Below is a brief description of the key components and functionalities:

### Project Structure
- **lib**
  - **datasources**: Contains the logic to interact with the Giphy API, fetching the latest trending GIFs or searching for specific GIFs based on user input.
  - **pages**: Manages the various screens of the app, including the main page, detailed GIF view, and the saved items screen.
- **main.dart**: The entry point of the application, where the app's core functionality is initialized.

### App Functionality

- **Main Page**: 
  - Upon launching the app, the data source fetches the trending GIFs and displays them in a grid of cards, showing the top 20 GIFs.
  - A search bar is available at the top, allowing users to search for specific GIFs by entering keywords. The app then queries the API and displays the search results.
  - Users can also load more GIFs related to the search query by clicking the "Load More..." button.

- **GIF Details Page**: 
  - When a user clicks on a GIF, a detailed view opens where the user can share the GIF across various platforms.
  - The user also has the option to save the GIF for later viewing.

- **Saved Items Page**: 
  - The main page includes a button that leads to the saved items screen. Here, users can view all the GIFs they have saved.
  - Users can open any saved GIF or remove it from their saved items list.

---


