# Modus Technical Test

To complete this technical test follow the instructions to implement the features that are missing from this simple application.

The overall functionality of the application is to display a gallery of popular movies fetched from The Movie DB

## Movies Client

 - Implement the empty methods in `MoviesClient.swift`
 - Use the following endpoint for `popularMovies()`: https://developers.themoviedb.org/3/movies/get-popular-movies
 - Use the following endpoint for `movieDetails(_)`: https://developers.themoviedb.org/3/movies/get-movie-details

You can use the following API Key: bf718d4dd8b23985d9c3edbcfd440a27

## AppDelegate

 - Use the `AppDelegate` to initialize the interface 
 
## Popular Movies View Controller

 - Implement the missing methods in `PopularMoviesViewController` in order to display a gallery of movies
 - Popular Movies should be loaded when the view appears
 - Movies should be displayed in two columns (only the portrait iPhone layout will be tested)
 - The height of each cell should be 1.5x its width
 - Spacing between items and margins to the edges of the screen should be the same
 
## Popular Movie Cell Content View
  
  - Implement the layout using SwiftUI in `PopularMovieCellContentView`
  - Display the following:
    - Title
    - Overview (limited to 3 lines)
    - Poster 
  - Highlight movies with a score of over 8 in any way you want (i.e. a star icon, a colored border, etc.)
