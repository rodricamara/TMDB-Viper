//
//  MoviesListViewTests.swift
//  MoviesTests
//
//  Created by Rodrigo Camara on 27/10/2022.
//

import XCTest
@testable import Movies

final class MoviesListViewTests: XCTestCase {
    
    var view: MoviesListViewController?
    var presenterMock: MoviesListPresenterMock!
    
    override func setUp() {
        super.setUp()
        presenterMock = .init()
        view = MoviesListViewController(dependencyResolver: MoviesListDependencyResolverMock(presenter: presenterMock))
    }
    
    override func tearDown() {
        view = nil
        presenterMock = nil
        super.tearDown()
    }
    
    func test_setUpView() {
        // Given
        let viewModel = MoviesListViewModel(page: 1,
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
        let viewCount = view?.view.subviews.count ?? 0
        view?.setUpView(viewModel: viewModel)
        
        let setupViewExp = expectation(description: "setUpView")
        
        DispatchQueue.main.async {
            setupViewExp.fulfill()
        }
        
        wait(for: [setupViewExp], timeout: 1)
        
        //Then
        let newViewCount = view?.view.subviews.count
        XCTAssertEqual(newViewCount, viewCount + 1, "View must have 1 new view inside subviews")
    }
}
