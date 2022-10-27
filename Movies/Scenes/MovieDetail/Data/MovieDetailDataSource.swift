//
//  MovieDetailDataSource.swift
//  Movies
//
//  Created Rodrigo Camara on 26/10/2022.
//

import Foundation
import Alamofire

protocol MovieDetailDataSourceProtocol {}

final class MovieDetailDataSource {
    
    private let client: Session
    
    init(client: Session) {
        self.client = client
	}
}

extension MovieDetailDataSource: MovieDetailDataSourceProtocol {}
