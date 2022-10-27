//
//  MovieDetailModelMapper.swift
//  Movies
//
//  Created Rodrigo Camara on 26/10/2022.
//

import Foundation

protocol MovieDetailModelMapperProtocol {
    func map(dto: MovieDetailDTO) -> MovieDetailModelProtocol
}

final class MovieDetailModelMapper {}

extension MovieDetailModelMapper: MovieDetailModelMapperProtocol {
    func map(dto: MovieDetailDTO) -> MovieDetailModelProtocol {
        return MovieDetailModel()
    }
}
