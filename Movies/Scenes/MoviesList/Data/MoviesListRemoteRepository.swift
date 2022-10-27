//
//  MoviesListRemoteRepository.swift
//  Movies
//
//  Created Rodrigo Camara on 25/10/2022.
//

import Foundation

final class MoviesListRemoteRepository {
    
    private let dataSource: MoviesListDataSourceProtocol
    
    init(dataSource: MoviesListDataSourceProtocol) {
        self.dataSource = dataSource
	}
}

extension MoviesListRemoteRepository: MoviesListRepositoryProtocol {
    func fetchTopRatedMovies(page: Int, completion: @escaping (MoviesListResponse) -> Void) {
        dataSource.fetchTopRatedMovies(page: page) { response in
            completion(response)
        }
    }
}
