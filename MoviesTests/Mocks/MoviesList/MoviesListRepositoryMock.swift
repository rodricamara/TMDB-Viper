//
//  MoviesListRepositoryMock.swift
//  MoviesTests
//
//  Created by Rodrigo Camara on 27/10/2022.
//

import Foundation
@testable import Movies

final class MoviesListRepositoryMock: MoviesListRepositoryProtocol {
    
    var response = MoviesListResponse.failure(.init())
    
    func fetchTopRatedMovies(page: Int, completion: @escaping (MoviesListResponse) -> Void) {
        completion(response)
    }
    
}
