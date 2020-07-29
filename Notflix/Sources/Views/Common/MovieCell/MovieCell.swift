//
//  MovieCell.swift
//  Notflix
//
//  Created by Quentin Eude on 19/03/2020.
//  Copyright © 2020 Quentin Eude. All rights reserved.
//

import SwiftUI

struct MovieCell: View {
    var movie: Movie

    init(for movie: Movie) {
        self.movie = movie
    }
    var body: some View {
        NavigationLink(destination: MovieDetails(movieId: movie.id)) {
            Group {
                MoviePosterImage(for: movie)
            }
        }
    }
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(for: Movie(id: 330457,
                                      title: "Frozen II",
                                      overview: """
                Elsa, Anna, Kristoff and Olaf head far into
                the forest to learn the truth about an ancient
                mystery of their kingdom.
        """,
                                      popularity: 190.236,
                                      voteAverage: 7.1,
                                      video: false,
                                      adult: false,
                                      voteCount: 2860,
                                      genreIds: [6125, 2],
                                      genres: nil,
                                      posterPath: "/pjeMs3yqRmFL3giJy4PMXWZTTPa.jpg",
                                      backdropPath: "/xJWPZIYOEFIjZpBL7SVBGnzRYXp.jpg",
                                      releaseDate: "2019-11-20"))
    }
}
