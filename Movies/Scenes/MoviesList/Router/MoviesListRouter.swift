//
//  MoviesListRouter.swift
//  Movies
//
//  Created by Rodrigo Camara on 26/10/2022.
//

import UIKit

protocol MoviesListRouterProtocol {
    func presentNextVC(from view: MoviesBaseViewController, viewModel: MoviesResultViewModel)
}

final class MoviesListRouter {}

extension MoviesListRouter: MoviesListRouterProtocol {
    func presentNextVC(from view: MoviesBaseViewController, viewModel: MoviesResultViewModel) {
        let targetVC = MovieDetailViewController(viewModel: viewModel)
        view.navigationController?.pushViewController(targetVC, animated: true)
    }
}
