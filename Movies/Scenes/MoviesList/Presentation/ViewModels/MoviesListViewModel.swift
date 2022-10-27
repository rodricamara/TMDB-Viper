//
//  MoviesListViewModel.swift
//  Movies
//
//  Created Rodrigo Camara on 25/10/2022.
//

import Foundation

struct MoviesListViewModel {
    let page: Int
    var results: [MoviesResultViewModel]
    let totalPages: Int
    let totalResults: Int
}

struct MoviesResultViewModel {
    let title: String
    let year: String
    let overview: String
    let backdropPath: String
    let posterPath: String
    let genre: String
    let id: Int?
}

