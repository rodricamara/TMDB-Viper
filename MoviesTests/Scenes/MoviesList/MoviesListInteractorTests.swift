//
//  MoviesListInteractorTests.swift
//  MoviesTests
//
//  Created by Rodrigo Camara on 27/10/2022.
//

import Foundation
@testable import Movies
import XCTest

final class MoviesListInteractorTests: XCTestCase {
    
    var interactor: MoviesListInteractorProtocol?
    var repositoryMock: MoviesListRepositoryMock!
    var mapperMock: MoviesListModelMapperMock!
    
    var moviesDTO = MoviesDTO(
        moviesList: MoviesListDTO(
            page: 1,
            results: nil,
            totalPages: 1,
            totalResults: 1),
        genres: GenresDTO(
            genres: [
                .init(
                    id: 0,
                    name: "Drama")
            ]))
    
    let listModel = MoviesListModel(
        page: 1,
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
    
    override func setUp() {
        super.setUp()
        repositoryMock = .init()
        mapperMock = .init()
        interactor = MoviesListInteractor(repository: repositoryMock,
                                          mapper: mapperMock)
    }
    
    override func tearDown() {
        repositoryMock = nil
        mapperMock = nil
        interactor = nil
        super.tearDown()
    }
    
    func test_fetchTopRatedMovies_failure() {
        // When
        interactor?.fetchTopRatedMovies(page: 1, completion: { response in
            
            // Then
            if case .success(_) = response {
                XCTFail("Must failure because the response is failure")
            }
        })
    }
    
    func test_fetchTopRatedMovies_success_mapFailure() {
        // Given
        repositoryMock.response = .success(moviesDTO)
        mapperMock.mapMovies = nil
        
        // When
        interactor?.fetchTopRatedMovies(page: 1, completion: { response in
            
            // Then
            if case .success(_) = response {
                XCTFail("Must failure because the mapper returned nil")
            }
        })
    }
    
    func test_fetchTopRatedMovies_success() {
        // Given
        repositoryMock.response = .success(moviesDTO)
        mapperMock.mapMovies = listModel
        
        // When
        interactor?.fetchTopRatedMovies(page: 1, completion: { response in
            
            // Then
            if case .failure(_) = response {
                XCTFail("Must failure because the response is success")
            }
        })
    }
}
