//
//  MoviesListPresenter.swift
//  Movies
//
//  Created Rodrigo Camara on 25/10/2022.
//

import Foundation

protocol MoviesListPresenterProtocol {
    func viewIsReady()
    func isLoadingLastCell()
    func onCellSelection(viewModel: MoviesResultViewModel)
}

final class MoviesListPresenter {
    
    private weak var view: MoviesListViewProtocol?
    private var params: [AnyHashable: Any?]?
    private let interactor: MoviesListInteractorProtocol
    private let mapper: MoviesListViewModelMapperProtocol
    private let router: MoviesListRouterProtocol
    private var moviesViewModel: MoviesListViewModel?
    private var currentPage = 0
    
    init(
        view: MoviesListViewProtocol,
        params: [AnyHashable: Any?]?,
        interactor: MoviesListInteractorProtocol,
        mapper: MoviesListViewModelMapperProtocol,
        router: MoviesListRouterProtocol
    ) {
        self.view = view
        self.params = params
        self.interactor = interactor
        self.mapper = mapper
        self.router = router
    }
}

extension MoviesListPresenter: MoviesListPresenterProtocol {
    func viewIsReady() {
        fetchData()
    }
    
    func isLoadingLastCell() {
        fetchData()
    }
    
    func onCellSelection(viewModel: MoviesResultViewModel) {
        router.handleMovieDetail(with: viewModel)
    }
}

private extension MoviesListPresenter {
    func fetchData() {
        currentPage += 1
        interactor.fetchTopRatedMovies(page: currentPage) { [weak self] response in
            guard let self = self else {
                return
            }
            switch response {
            case .success(let model):
                guard let viewModel = self.mapper.map(model: model) else {
                    return
                }
                if self.moviesViewModel.isNil {
                    self.moviesViewModel = viewModel
                } else {
                    self.moviesViewModel?.results.append(contentsOf: viewModel.results)
                }
                self.view?.setUpView(viewModel: self.moviesViewModel)
            case .failure(_):
                // Handle error and show some feedback view.
                break
            }
        }
    }
}
