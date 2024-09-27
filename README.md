README - WeatherApp

# weather_app_flutter
==================

A play project that shows the weather forecast. This is the
repository: https://github.com/Sello23/weather_app_flutter

**weather_app_flutter** is a fully functional Flutter app built entirely in Dart.
It follows Flutter design and development best practices using Clean Architecture.

* This project is built using Test-Driven-Development (TDD).
* Integration with a remote data API requiring authentication (API-key).
    - The authentication done on the project was only using an API-key. As requested, 3 screens were
      created, the MainScreen Screen, Search and Favourite Screen for offline saving of locations.
* Application with one mandatory screen and up to 2 optional screens.
    - The app has only three screens
* Some of the aspects of the UI components have to be data-driven. These can be background color,
  background image, font color, etc.
    - Background images change according to the weather conditions as specified in the requirements
      documents
    - Main screen images (icons) changes on the list as these are taken from the API calls

Project organization

* Branching strategies
    - We make the changes from a feature branch (feature/noted-improvements) and merge into the
      master branch (main in this case)
* File and folder structure follows the Clean architecture
* Naming conventions and coding, commenting style are done in Dart coding and naming
  style
* SonarLint was also used as a Tool that checks all the Clean Architecture standards to
  ensure everything is done accordingly
