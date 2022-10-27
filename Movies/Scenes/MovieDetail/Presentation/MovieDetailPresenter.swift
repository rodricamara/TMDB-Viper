//
//  MovieDetailPresenter.swift
//  Movies
//
//  Created Rodrigo Camara on 26/10/2022.
//

import Foundation

protocol MovieDetailPresenterProtocol {
    func viewIsReady()
}

final class MovieDetailPresenter {
    
    private weak var view: MovieDetailViewProtocol?
    private var params: [AnyHashable: Any?]?
    private let interactor: MovieDetailInteractorProtocol
    private let mapper: MovieDetailViewModelMapperProtocol
    private let viewModel: MoviesResultViewModel?
    
    init(
        view: MovieDetailViewProtocol,
        params: [AnyHashable: Any?]?,
        interactor: MovieDetailInteractorProtocol,
        mapper: MovieDetailViewModelMapperProtocol,
        viewModel: MoviesResultViewModel?
    ) {
        self.view = view
        self.params = params
        self.interactor = interactor
        self.mapper = mapper
        self.viewModel = viewModel
    }
}

extension MovieDetailPresenter: MovieDetailPresenterProtocol {
    func viewIsReady() {
        guard let viewModel = viewModel else {
            return
        }
        view?.setUpView(viewModel: viewModel)
    }
}
