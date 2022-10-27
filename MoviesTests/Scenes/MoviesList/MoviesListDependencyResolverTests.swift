//
//  MoviesListDependencyResolverTests.swift
//  MoviesTests
//
//  Created by Rodrigo Camara on 27/10/2022.
//

import XCTest
@testable import Movies

final class MoviesListDependencyResolverTests: XCTestCase {
    
    var dependencyResolver: MoviesListDependencyResolverProtocol?
    var alamofireMock: AlamofireMock!
    var viewMock: MoviesListViewMock!
    
    override func setUp() {
        super.setUp()
        alamofireMock = .init()
        viewMock = .init(dictionary: nil)
        dependencyResolver = MoviesListDependencyResolver(client: alamofireMock)
    }
    
    override func tearDown() {
        dependencyResolver = nil
        alamofireMock = nil
        viewMock = nil
        super.tearDown()
    }
    
    func test_resolvePresenter() {
        // When
        let presenter = dependencyResolver?.resolvePresenter(params: nil, view: viewMock)
        
        // Then
        XCTAssertNotNil(presenter, "Presenter must be not nil")
        XCTAssertTrue(presenter is MoviesListPresenter, "Presenter must be MoviesListPresenter tpye.")
    }
}

