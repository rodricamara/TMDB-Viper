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
    
    let listModel = MoviesListModel(
        page: 1,
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
    
    let listViewModel = MoviesListViewModel(
        page: 1,
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
    
    let resultViewModel = MoviesResultViewModel(
        title: "Movie",
        year: "1994",
        overview: "It's a movie...",
        backdropPath: "/aaaaaa.jpg",
        posterPath: "/bbbbb.jpg",
        genre: "Drama",
        id: 190)
    
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
        interactorMock.response = .success(listModel)
        mapperMock.model = listViewModel
        
        // When
        presenter?.viewIsReady()
        
        // Then
        XCTAssertTrue(viewMock.lastFunction == .setUpView,
                      "The fuction viewIsReady() should execute setupView() because there is a viewModel")
    }
    
    func test_onCellSelection_failure() {
        // Given
        viewMock = nil
        
        // When
        presenter?.onCellSelection(viewModel: resultViewModel)
        
        // Then
        XCTAssertFalse(routerMock.wasCalled,
                       "onCellSelection router must not present next VC")
    }
    
    func test_onCellSelection_success() {
        // When
        presenter?.onCellSelection(viewModel: resultViewModel)
        
        // Then
        XCTAssertTrue(routerMock.wasCalled,
                      "onCellSelection router must present next VC")
    }
    
}
