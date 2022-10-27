//
//  MoviesCoreDependencyResolver.swift
//  Movies
//
//  Created by Rodrigo Camara on 25/10/2022.
//

import Alamofire

protocol MoviesCoreDependencyResolverProtocol {
    func resolveMoviesListDependencyResolver() -> MoviesListDependencyResolverProtocol
    func resolveMovieDetailDependencyResolver() -> MovieDetailDependencyResolverProtocol
}

final class MoviesCoreDependencyResolver {
    
    static let shared: MoviesCoreDependencyResolverProtocol = MoviesCoreDependencyResolver()
    private let client: Session
    
    init(client: Session = AF) {
        self.client = client
    }
}

extension MoviesCoreDependencyResolver: MoviesCoreDependencyResolverProtocol {
    func resolveMoviesListDependencyResolver() -> MoviesListDependencyResolverProtocol {
        return MoviesListDependencyResolver(client: client)
    }
    
    func resolveMovieDetailDependencyResolver() -> MovieDetailDependencyResolverProtocol {
        return MovieDetailDependencyResolver(client: client)
    }
}
