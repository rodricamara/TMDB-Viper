//
//  MoviesListInteractor.swift
//  Movies
//
//  Created Rodrigo Camara on 25/10/2022.
//

import Foundation

typealias MoviesListInteractorResponse = MoviesResult<MoviesListModelProtocol, MoviesError>

protocol MoviesListInteractorProtocol {
    func fetchTopRatedMovies(page: Int, completion: @escaping (MoviesListInteractorResponse) -> Void)
}

final class MoviesListInteractor {
    
    private let repository: MoviesListRepositoryProtocol
    private let mapper: MoviesListModelMapperProtocol
    
    init(
        repository: MoviesListRepositoryProtocol,
        mapper: MoviesListModelMapperProtocol
    ) {
        self.repository = repository
        self.mapper = mapper
    }
}

extension MoviesListInteractor: MoviesListInteractorProtocol {
    func fetchTopRatedMovies(page: Int, completion: @escaping (MoviesListInteractorResponse) -> Void) {
        repository.fetchTopRatedMovies(page: page) { [weak self] response in
                switch response {
                case .success(let dto):
                    guard let model = self?.mapper.map(dto: dto)
                    else {
                        completion(.failure(.init()))
                        return
                    }
                    completion(.success(model))
                case .failure(_):
                    completion(.failure(.init()))
                }
            }
    }
}
