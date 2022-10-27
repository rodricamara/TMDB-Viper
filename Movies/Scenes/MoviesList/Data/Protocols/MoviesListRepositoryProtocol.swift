//
//  MoviesListRepositoryProtocol.swift
//  Movies
//
//  Created by Rodrigo Camara on 26/10/2022.
//

import Foundation

protocol MoviesListRepositoryProtocol {
    func fetchTopRatedMovies(page: Int, completion: @escaping (MoviesListResponse) -> Void)
}
