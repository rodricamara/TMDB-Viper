//
//  MoviesListDependencyResolverMock.swift
//  MoviesTests
//
//  Created by Rodrigo Camara on 27/10/2022.
//

import Foundation
@testable import Movies

final class MoviesListDependencyResolverMock: MoviesListDependencyResolverProtocol {
    
    var presenter: MoviesListPresenterProtocol
    
    init(presenter: MoviesListPresenterProtocol) {
        self.presenter = presenter
    }
    
    func resolvePresenter(params: [AnyHashable : Any?]?, view: MoviesListViewProtocol) -> MoviesListPresenterProtocol {
        return presenter
    }
}
