//
//  MovieDetailViewController.swift
//  Movies
//
//  Created Rodrigo Camara on 26/10/2022.
//

import UIKit

protocol MovieDetailViewProtocol: MoviesBaseViewController {
    func setUpView(viewModel: MoviesResultViewModel)
}

final class MovieDetailViewController: MoviesBaseViewController {
    
	private var presenter: MovieDetailPresenterProtocol?
    private var containerView: MovieDetailContainerViewProtocol?
    
    init(viewModel: MoviesResultViewModel) {
        let dependencyResolver = MoviesCoreDependencyResolver.shared.resolveMovieDetailDependencyResolver()
        super.init(dictionary: nil)
        presenter = dependencyResolver.resolvePresenter(params: nil, view: self, viewModel: viewModel)
    }
    
    required init(dictionary: [AnyHashable: Any?]?) {
        let dependencyResolver = MoviesCoreDependencyResolver.shared.resolveMovieDetailDependencyResolver()
        super.init(dictionary: nil)
        presenter = dependencyResolver.resolvePresenter(params: dictionary, view: self, viewModel: nil)
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        setUpBackButton()
        presenter?.viewIsReady()
    }
}

extension MovieDetailViewController: MovieDetailViewProtocol {
    func setUpView(viewModel: MoviesResultViewModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            let view = MovieDetailContainerView(viewModel: viewModel, delegate: self)
            self.view.addSubview(view)
            view.fillSuperView()
            self.containerView = view
        }
    }
}

extension MovieDetailViewController: MovieDetailContainerViewDelegate {}
