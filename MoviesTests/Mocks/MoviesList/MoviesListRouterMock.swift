//
//  MoviesListRouterMock.swift
//  MoviesTests
//
//  Created by Rodrigo Camara on 27/10/2022.
//

import Foundation
@testable import Movies

final class MoviesListRouterMock: MoviesListRouterProtocol {
    
    var wasCalled = false
    
    func handleMovieDetail(with viewModel: Movies.MoviesResultViewModel) {
        wasCalled = true
    }
}
