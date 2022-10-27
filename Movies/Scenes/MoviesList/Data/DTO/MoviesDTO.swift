//
//  MoviesDTO.swift
//  Movies
//
//  Created by Rodrigo Camara on 26/10/2022.
//

import Foundation

struct MoviesDTO: Decodable {
    let moviesList: MoviesListDTO?
    let genres: GenresDTO?
}
