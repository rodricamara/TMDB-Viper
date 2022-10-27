//
//  MovieDetailInteractor.swift
//  Movies
//
//  Created Rodrigo Camara on 26/10/2022.
//

import Foundation

protocol MovieDetailInteractorProtocol {}

final class MovieDetailInteractor {
    
    private let repository: MovieDetailRepositoryProtocol
    private let mapper: MovieDetailModelMapperProtocol
    
    init(repository: MovieDetailRepositoryProtocol,
         mapper: MovieDetailModelMapperProtocol) {
        self.repository = repository
        self.mapper = mapper
	}
}

extension MovieDetailInteractor: MovieDetailInteractorProtocol {}
