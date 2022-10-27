//
//  MoviesListViewModelMapperMock.swift
//  MoviesTests
//
//  Created by Rodrigo Camara on 26/10/2022.
//

import Foundation
@testable import Movies

final class MoviesListViewModelMapperMock: MoviesListViewModelMapperProtocol {
    
    var model: MoviesListViewModel?
    
    func map(model: MoviesListModelProtocol) -> MoviesListViewModel? {
        return self.model
    }
}
