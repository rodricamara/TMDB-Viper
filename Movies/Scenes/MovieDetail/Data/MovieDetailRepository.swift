//
//  MovieDetailRepository.swift
//  Movies
//
//  Created Rodrigo Camara on 26/10/2022.
//

import Foundation

protocol MovieDetailRepositoryProtocol {}

final class MovieDetailRepository {
    
    private let dataSource: MovieDetailDataSourceProtocol
    
    init(dataSource: MovieDetailDataSourceProtocol) {
        self.dataSource = dataSource
	}
}

extension MovieDetailRepository: MovieDetailRepositoryProtocol {}
