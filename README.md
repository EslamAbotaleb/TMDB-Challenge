# TMDB Movie Ios  
This project is a SwiftUI application that displays movies from The Movie Database (TMDB) API. It uses a clean architecture approach with separate layers for behavior, data, domain, and presentation, The app includes functionality for displaying (now playing, popular, and upcoming movies), as well as movie details.

# Project Structure
- The app's codebase follows Domain-Driven Design principles, separating concerns into domain, data, and presentation layers :- 
  1. Data Layer: Manages data operations, and factory for URL components related to a network request, model, mapper.
  2. Domain Layer: Defines core entities, repository interfaces, and use cases.
  3. Presentation Layer: Includes  views and view models and Mapper for ui content.
  4. I Don't depend on any third-party framework in the app  everything is created by native functionality.
  5. Create unit test cases only for now playing movies.
  6. Deal with the network monitor to check the connectivity network (connect || disconnect).
  7. Handle failure for any api request and display a message to the user in the ui if there is any failure request or another error.

# Project features
 - General (now-playing movies,popular movies,upcoming movies).
 - Details movie.

# ScreenShots
![Simulator Screenshot - iPhone 15 Pro Max - 2024-07-07 at 09 57 22](https://github.com/EslamAbotaleb/TMDB-Challenge/assets/50490125/ab095216-95a8-49b0-9ee0-7f5ab72b9c97)
![Simulator Screenshot - iPhone 15 Pro Max - 2024-07-07 at 09 53 30](https://github.com/EslamAbotaleb/TMDB-Challenge/assets/50490125/5b182add-6e33-4d96-8e47-f6f892da0f4d)
![Simulator Screenshot - iPhone 15 Pro Max - 2024-07-07 at 09 53 27](https://github.com/EslamAbotaleb/TMDB-Challenge/assets/50490125/3d36d0d6-66c2-472a-9fde-6a6d71f8243c)
![Simulator Screenshot - iPhone 15 Pro Max - 2024-07-07 at 09 53 17](https://github.com/EslamAbotaleb/TMDB-Challenge/assets/50490125/95c55c0d-85f9-4b1c-ab23-6f7d59770560)


# Technologies
 - Clean architecture.
 -  Follow domain drive design principle (Data, Domain, Presentation).
 - Add some test cases specific for now playing movies.
 - Add test cases for the network layer.

# Resources:- 
1. ![1_be0csos3sWD9I5KhFz_8dg@2x (1)](https://github.com/EslamAbotaleb/TMDB-Challenge/assets/50490125/40d0b0e8-f2c7-478a-ac8e-3220d522340a)
2. https://tech.olx.com/clean-architecture-and-mvvm-on-ios-c9d167d9f5b3

# Server
The Movie DB: https://api.themoviedb.org/

# APIS
- https://api.themoviedb.org/3/movie/now_playing
- https://api.themoviedb.org/3/movie/popular
- https://api.themoviedb.org/3/movie/upcoming
- https://api.themoviedb.org/3/movie/movie_id
