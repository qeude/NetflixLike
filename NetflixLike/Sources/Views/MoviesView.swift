//
//  MoviesView.swift
//  NetflixLike
//
//  Created by Quentin Eude on 02/03/2020.
//  Copyright © 2020 Quentin Eude. All rights reserved.
//

import SwiftUI

struct MoviesView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 25) {
                HorizontalMoviesListView(moviesViewModel: MoviesViewModel(fetcher: APIEndpoints.popularMovies), listName: "Popular Movies")
                HorizontalMoviesListView(moviesViewModel: MoviesViewModel(fetcher: APIEndpoints.topRatedMovies), listName: "Top Rated Movies")
                HorizontalMoviesListView(moviesViewModel: MoviesViewModel(fetcher: APIEndpoints.popularMovies), listName: "Popular Movies")
                HorizontalMoviesListView(moviesViewModel: MoviesViewModel(fetcher: APIEndpoints.topRatedMovies), listName: "Top Rated Movies")
            }
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
       ZStack {
            Color(.black).edgesIgnoringSafeArea(.all)
            MoviesView()
        }
    }
}