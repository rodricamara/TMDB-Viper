//
//  MoviesListViewController.swift
//  Movies
//
//  Created Rodrigo Camara on 25/10/2022.
//

import UIKit

protocol MoviesListViewProtocol: MoviesBaseViewController {
    func setUpView(viewModel: MoviesListViewModel?)
}

final class MoviesListViewController: MoviesBaseViewController {
    
	private var presenter: MoviesListPresenterProtocol?
    private var containerView: MoviesListContainerViewProtocol?
    private var resultsViewModel: [MoviesResultViewModel]?
    
    init(dependencyResolver: MoviesListDependencyResolverProtocol) {
        super.init(dictionary: nil)
        presenter = dependencyResolver.resolvePresenter(params: nil, view: self)
    }
    
    required init(dictionary: [AnyHashable: Any?]?) {
        let dependencyResolver = MoviesCoreDependencyResolver.shared.resolveMoviesListDependencyResolver()
        super.init(dictionary: nil)
        presenter = dependencyResolver.resolvePresenter(params: dictionary, view: self)
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        setUpNavigationBar()
        presenter?.viewIsReady()
    }
}

private extension MoviesListViewController {
    func setUpNavigationBar() {
        setUpLeftButton(target: self,
                        action: #selector(didTapLeftBarButton),
                        with: UIImage(named: "magnifierGlass"))
        title = "TV Show Reminder"
    }
    
    @objc
    func didTapLeftBarButton() {
        // Present modally new search view
    }
}

extension MoviesListViewController: MoviesListViewProtocol {
    func setUpView(viewModel: MoviesListViewModel?) {
        if containerView != nil {
            containerView?.setUpView(viewModel: viewModel)
        } else {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {
                    return
                }
                let view = MoviesListContainerView(viewModel: viewModel, delegate: self)
                self.view.addSubview(view)
                view.fillSuperView()
                self.containerView = view
            }
        }
    }
}

extension MoviesListViewController: MoviesListContainerViewDelegate {
    func isLoadingLastCell() {
        presenter?.isLoadingLastCell()
    }
    
    func didTapOnCell(viewModel: MoviesResultViewModel) {
        presenter?.onCellSelection(viewModel: viewModel)
    }
}
