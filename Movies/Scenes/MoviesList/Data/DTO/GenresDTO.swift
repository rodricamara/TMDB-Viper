//
//  GenresDTO.swift
//  Movies
//
//  Created by Rodrigo Camara on 26/10/2022.
//

import Foundation

struct GenresDTO: Decodable {
    let genres: [Genre]?
}

struct Genre: Decodable {
    let id: Int?
    let name: String?
}
