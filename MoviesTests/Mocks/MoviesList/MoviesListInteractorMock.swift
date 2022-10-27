//
//  MoviesListInteractorMock.swift
//  MoviesTests
//
//  Created by Rodrigo Camara on 26/10/2022.
//

import Foundation
@testable import Movies

final class MoviesListInteractorMock: MoviesListInteractorProtocol {
    
    var response = MoviesListInteractorResponse.failure(.init())
    
    func fetchTopRatedMovies(page: Int, completion: @escaping (MoviesListInteractorResponse) -> Void) {
        completion(response)
    }
}
