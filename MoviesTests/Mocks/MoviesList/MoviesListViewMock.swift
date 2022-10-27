//
//  MoviesListViewMock.swift
//  MoviesTests
//
//  Created by Rodrigo Camara on 26/10/2022.
//

import Foundation
@testable import Movies

enum MoviesListViewMethods: String {
    case setUpView = "setUpView(viewModel:)"
}

final class MoviesListViewMock: MoviesBaseViewController, MoviesListViewProtocol, LoggerProtocol {
    
    typealias GenericMethod = MoviesListViewMethods
    
    var functionStack = [MoviesListViewMethods]()
    
    var lastFunction: MoviesListViewMethods?
    
    func setUpView(viewModel: MoviesListViewModel?) {
        log()
    }
}
