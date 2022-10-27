//
//  MoviesListDataSource.swift
//  Movies
//
//  Created Rodrigo Camara on 25/10/2022.
//

import Alamofire
import Foundation

typealias MoviesListResponse = MoviesResult<MoviesDTO, MoviesError>
typealias GenresResponse = MoviesResult<GenresDTO, MoviesError>

protocol MoviesListDataSourceProtocol {
    func fetchTopRatedMovies(page: Int, completion: @escaping (MoviesListResponse) -> Void)
}

final class MoviesListDataSource {
    
    private let client: Session
    private var genres: GenresDTO?
    
    init(client: Session) {
        self.client = client
    }
}

extension MoviesListDataSource: MoviesListDataSourceProtocol {
    func fetchTopRatedMovies(page: Int, completion: @escaping (MoviesListResponse) -> Void) {
        
        let url = "\(Constants.baseURL)\(String.topRatedPath)\(page)&api_key=\(Constants.apiKey)"
        
        client.request(
            url,
            method: .get
        )
        .responseDecodable(completionHandler: { (response: DataResponse<MoviesListDTO, AFError>) in
            switch response.result {
            case .success(let model):
                guard let genres = self.genres else {
                    self.fetchGenres { response in
                        switch response {
                        case .success(let genres):
                            self.genres = genres
                            let moviesDTO = MoviesDTO(moviesList: model, genres: genres)
                            completion(.success(moviesDTO))
                        case .failure(_):
                            // Wrappear AFError en un MoviesError
                            completion(.failure(.init()))
                        }
                    }
                    return
                }
                let moviesDTO = MoviesDTO(moviesList: model, genres: genres)
                completion(.success(moviesDTO))
            case .failure(_):
                // Wrappear AFError en un MoviesError
                completion(.failure(.init()))
            }
        })
    }
    
}

private extension MoviesListDataSource {
    func fetchGenres(completion: @escaping (GenresResponse) -> Void) {
        
        let url = "\(Constants.baseURL)\(String.genrePath)?api_key=\(Constants.apiKey)"
        
        client.request(
            url,
            method: .get
        )
        .responseDecodable(completionHandler: { (response: DataResponse<GenresDTO, AFError>) in
            switch response.result {
            case .success(let model):
                completion(.success(model))
            case .failure(_):
                // Wrappear AFError en un MoviesError
                completion(.failure(.init()))
            }
        })
    }
}

fileprivate extension String {
    static let topRatedPath = "/movie/top_rated?page="
    static let genrePath = "/genre/movie/list"
}

