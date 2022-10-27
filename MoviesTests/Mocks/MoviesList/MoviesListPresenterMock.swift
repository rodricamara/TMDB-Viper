//
//  MoviesListPresenterMock.swift
//  MoviesTests
//
//  Created by Rodrigo Camara on 27/10/2022.
//

import Foundation
@testable import Movies

enum MoviesListPresenterMethods: String {
    case viewIsReady = "viewIsReady()"
    case isLoadingLastCell = "isLoadingLastCell()"
    case onCellSelection = "onCellSelection(viewModel:)"
}

final class MoviesListPresenterMock: MoviesListPresenterProtocol, LoggerProtocol {

    typealias GenericMethod = MoviesListPresenterMethods
    var lastFunction: MoviesListPresenterMethods?
    var functionStack = [MoviesListPresenterMethods]()
    
    func viewIsReady() {
        log()
    }
    
    func isLoadingLastCell() {
        log()
    }
    
    func onCellSelection(viewModel: MoviesResultViewModel) {
        log()
    }
}
