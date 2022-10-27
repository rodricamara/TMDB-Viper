//
//  MoviesListPresenterTests.swift
//  MoviesTests
//
//  Created by Rodrigo Camara on 26/10/2022.
//

import Foundation
import XCTest
@testable import Movies

final class MoviesListPresenterTests: XCTestCase {
    
    var presenter: MoviesListPresenterProtocol?
    var viewMock: MoviesListViewMock!
    var interactorMock: MoviesListInteractorMock!
    var mapperMock: MoviesListViewModelMapperMock!
    var routerMock: MoviesListRouterMock!
    
    override func setUp() {
        super.setUp()
        viewMock = MoviesListViewMock(dictionary: nil)
        interactorMock = .init()
        mapperMock = .init()
        routerMock = .init()
        presenter = MoviesListPresenter(view: viewMock,
                                        params: nil,
                                        interactor: interactorMock,
                                        mapper: mapperMock,
                                        router: routerMock)
    }
    
    override func tearDown() {
        presenter = nil
        viewMock = nil
        interactorMock = nil
        mapperMock = nil
        routerMock = nil
        super.tearDown()
    }
    
    func test_viewIsReady_failure() {
        // Given
        
        // When
        presenter?.viewIsReady()
        
        // Then
        XCTAssertTrue(viewMock.lastFunction != .setUpView,
                      "The fuction viewIsReady() must not execute setupView() because there is no viewModel")
    }
    
    func test_viewIsReady_success() {
        // Given
        let model = MoviesListModel(page: 1,
                                    results: [MoviesResultModel(
                                        title: "Movie",
                                        year: "1994",
                                        overview: "It's a movie...",
                                        backdropPath: "/aaaaaa.jpg",
                                        posterPath: "/bbbbb.jpg",
                                        genre: "Drama",
                                        id: 190)],
                                    totalPages: 1,
                                    totalResults: 1)
        interactorMock.response = .success(model)
        
        mapperMock.model = MoviesListViewModel(page: 1,
                                               results: [MoviesResultViewModel(
                                                title: "Movie",
                                                year: "1994",
                                                overview: "It's a movie...",
                                                backdropPath: "/aaaaaa.jpg",
                                                posterPath: "/bbbbb.jpg",
                                                genre: "Drama",
                                                id: 190)],
                                               totalPages: 1,
                                               totalResults: 1)
        
        // When
        presenter?.viewIsReady()
        
        // Then
        XCTAssertTrue(viewMock.lastFunction == .setUpView,
                      "The fuction viewIsReady() should execute setupView() because there is a viewModel")
    }
    
    func test_onCellSelection_failure() {
        // Given
        viewMock = nil
        let viewModel = MoviesResultViewModel(title: "Movie",
                                              year: "1994",
                                              overview: "It's a movie...",
                                              backdropPath: "/aaaaaa.jpg",
                                              posterPath: "/bbbbb.jpg",
                                              genre: "Drama",
                                              id: 190)
        
        // When
        presenter?.onCellSelection(viewModel: viewModel)
        
        // Then
        XCTAssertFalse(routerMock.wasCalled,
                      "onCellSelection router must not present next VC")
    }
    
    func test_onCellSelection_success() {
        // Given
        let viewModel = MoviesResultViewModel(title: "Movie",
                                              year: "1994",
                                              overview: "It's a movie...",
                                              backdropPath: "/aaaaaa.jpg",
                                              posterPath: "/bbbbb.jpg",
                                              genre: "Drama",
                                              id: 190)
        // When
        presenter?.onCellSelection(viewModel: viewModel)
        
        // Then
        XCTAssertTrue(routerMock.wasCalled,
                      "onCellSelection router must present next VC")
    }
    
}
