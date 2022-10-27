//
//  MoviesResult.swift
//  Movies
//
//  Created by Rodrigo Camara on 25/10/2022.
//

import Foundation

enum MoviesResult<Success, Failure> where Failure: Error {
    case success(Success)
    case failure(Failure)
}
