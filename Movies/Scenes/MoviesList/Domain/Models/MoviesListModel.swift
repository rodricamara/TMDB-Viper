//
//  MoviesListModel.swift
//  Movies
//
//  Created Rodrigo Camara on 25/10/2022.
//

import Foundation

protocol MoviesListModelProtocol {
    var page: Int { get }
    var results: [MoviesResultModelProtocol] { get }
    var totalPages: Int { get }
    var totalResults: Int { get }
}

struct MoviesListModel: MoviesListModelProtocol {
    let page: Int
    let results: [MoviesResultModelProtocol]
    let totalPages: Int
    let totalResults: Int
}

protocol MoviesResultModelProtocol {
    var title: String { get }
    var year: String { get }
    var overview: String { get }
    var backdropPath: String { get }
    var posterPath: String { get }
    var genre: String { get }
    var id: Int? { get }
}

struct MoviesResultModel: MoviesResultModelProtocol {
    let title: String
    let year: String
    let overview: String
    let backdropPath: String
    let posterPath: String
    let genre: String
    let id: Int?
}
