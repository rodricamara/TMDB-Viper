//
//  MoviesListModelMapper.swift
//  Movies
//
//  Created Rodrigo Camara on 25/10/2022.
//

import Foundation

protocol MoviesListModelMapperProtocol {
    func map(dto: MoviesDTO) -> MoviesListModelProtocol?
}

final class MoviesListModelMapper {}

extension MoviesListModelMapper: MoviesListModelMapperProtocol {
    func map(dto: MoviesDTO) -> MoviesListModelProtocol? {
        guard let page = dto.moviesList?.page,
              let results = mapResults(dto: dto.moviesList?.results, genres: dto.genres),
              !results.isEmpty,
              let totalPages = dto.moviesList?.totalPages,
              let totalResults = dto.moviesList?.totalResults
        else {
            return nil
        }
        return MoviesListModel(
            page: page,
            results: results,
            totalPages: totalPages,
            totalResults: totalResults)
    }
}

private extension MoviesListModelMapper {
    func mapResults(dto: [ResultDTO]?, genres: GenresDTO?) -> [MoviesResultModelProtocol]? {
        var moviesModel = [MoviesResultModelProtocol]()
        
        dto?.forEach({ item in
            guard let title = item.title,
                  let year = item.releaseDate?.prefix(4),
                  let overview = item.overview,
                  let backdropPath = item.backdropPath,
                  let posterPath = item.posterPath,
                  let genre = getFirstGenreName(dto: item, genres: genres),
                  let id = item.id
            else {
                return
            }
            let movieModel = MoviesResultModel(
                title: title,
                year: String(year),
                overview: overview,
                backdropPath: String.baseImageURL + backdropPath,
                posterPath: String.basePosterURL + posterPath,
                genre: genre,
                id: id)
            moviesModel.append(movieModel)
        })
        return moviesModel
    }
    
    func getFirstGenreName(dto: ResultDTO?, genres: GenresDTO?) -> String? {
        let firstGenre = genres?.genres?.first(where: {
            $0.id == dto?.genreIDS?.first
        })
        return firstGenre?.name
    }
}

fileprivate extension String {
    static let baseImageURL = "https://image.tmdb.org/t/p/w500"
    static let basePosterURL = "https://image.tmdb.org/t/p/original/"
}
