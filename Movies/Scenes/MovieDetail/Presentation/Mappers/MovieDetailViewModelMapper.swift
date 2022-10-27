//
//  MovieDetailViewModelMapper.swift
//  Movies
//
//  Created Rodrigo Camara on 26/10/2022.
//

import Foundation

protocol MovieDetailViewModelMapperProtocol {
    func map(model: MovieDetailModelProtocol) -> MovieDetailViewModel?
}

final class MovieDetailViewModelMapper {}

extension MovieDetailViewModelMapper: MovieDetailViewModelMapperProtocol {
    func map(model: MovieDetailModelProtocol) -> MovieDetailViewModel? {
        return MovieDetailViewModel()
    }
}
