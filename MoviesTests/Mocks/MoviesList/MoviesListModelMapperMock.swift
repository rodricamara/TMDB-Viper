//
//  MoviesListModelMapperMock.swift
//  MoviesTests
//
//  Created by Rodrigo Camara on 27/10/2022.
//

import Foundation
@testable import Movies

final class MoviesListModelMapperMock: MoviesListModelMapperProtocol {
    
    var mapper = MoviesListModelMapper()
    
    var movies = MoviesListModel(page: 1,
                                 results: [MoviesResultModel(
                                     title: "Movie",
                                     year: "1994",
                                     overview: "It's a movie...",
                                     backdropPath: "/aaaaaa.jpg",
                                     posterPath: "/bbbbb.jpg",
                                     genre: "Drama",
                                     id: 190)],
                                 totalPages: 1,
                                 totalResults: 1)
    
    var useMock = false
    
    var mapMovies: MoviesListModelProtocol? {
        didSet {
            useMock = true
        }
    }
    
    func map(dto: MoviesDTO) -> MoviesListModelProtocol? {
        return useMock ? mapMovies: mapper.map(dto: dto)
    }
}
