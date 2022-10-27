//
//  MoviesListViewModelMapper.swift
//  Movies
//
//  Created Rodrigo Camara on 25/10/2022.
//

import Foundation

protocol MoviesListViewModelMapperProtocol {
    func map(model: MoviesListModelProtocol) -> MoviesListViewModel?
}

final class MoviesListViewModelMapper {}

extension MoviesListViewModelMapper: MoviesListViewModelMapperProtocol {
    func map(model: MoviesListModelProtocol) -> MoviesListViewModel? {
        return MoviesListViewModel(
            page: model.page,
            results: mapResults(model: model.results),
            totalPages: model.totalPages,
            totalResults: model.totalResults)
    }
}

private extension MoviesListViewModelMapper {
    func mapResults(model: [MoviesResultModelProtocol]) -> [MoviesResultViewModel] {
        return model.compactMap { model in
            mapResult(model: model)
        }
    }
    
    func mapResult(model: MoviesResultModelProtocol) -> MoviesResultViewModel {
        return .init(
            title: model.title,
            year: model.year,
            overview: model.overview,
            backdropPath: model.backdropPath,
            posterPath: model.posterPath,
            genre: model.genre,
            id: model.id)
    }
}
