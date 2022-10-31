//
//  MoviesListRouter.swift
//  Movies
//
//  Created by Rodrigo Camara on 26/10/2022.
//

import UIKit

protocol MoviesListRouterProtocol {
    func handleMovieDetail(with viewModel: MoviesResultViewModel)
}

final class MoviesListRouter {
    
    private weak var vc: UIViewController?
    
    init(vc: UIViewController?) {
        self.vc = vc
    }
}

extension MoviesListRouter: MoviesListRouterProtocol {
    func handleMovieDetail(with viewModel: MoviesResultViewModel) {
        let targetVC = MovieDetailViewController(viewModel: viewModel)
        vc?.navigationController?.pushViewController(targetVC, animated: true)
    }
}
