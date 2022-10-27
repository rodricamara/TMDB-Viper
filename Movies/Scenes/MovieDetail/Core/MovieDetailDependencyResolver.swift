//
//  MovieDetailDependencyResolver.swift
//  Movies
//
//  Created Rodrigo Camara on 26/10/2022.
//

import UIKit
import Alamofire

protocol MovieDetailDependencyResolverProtocol {
    func resolvePresenter(params: [AnyHashable: Any?]?,
                          view: MovieDetailViewProtocol,
                          viewModel: MoviesResultViewModel?) -> MovieDetailPresenterProtocol
}

final class MovieDetailDependencyResolver {
    
    private let client: Session
    
    init(client: Session) {
        self.client = client
    }
}

extension MovieDetailDependencyResolver: MovieDetailDependencyResolverProtocol {
    func resolvePresenter(params: [AnyHashable: Any?]?,
                          view: MovieDetailViewProtocol,
                          viewModel: MoviesResultViewModel?) -> MovieDetailPresenterProtocol {
        return MovieDetailPresenter(
            view: view,
            params: params,
            interactor: resolveInteractor(),
            mapper: resolveViewModelMapper(),
            viewModel: viewModel
        )
    }
}

private extension MovieDetailDependencyResolver {
    func resolveViewModelMapper() -> MovieDetailViewModelMapperProtocol {
        return MovieDetailViewModelMapper()
    }
    
    func resolveInteractor() -> MovieDetailInteractorProtocol {
        return MovieDetailInteractor(repository: resolveRepository(),
                                     mapper: resolveModelMapper())
    }
    
    func resolveModelMapper() -> MovieDetailModelMapperProtocol {
        return MovieDetailModelMapper()
    }
    
    func resolveRepository() -> MovieDetailRepositoryProtocol {
        return MovieDetailRepository(dataSource: resolveDatasource())
    }
    
    func resolveDatasource() -> MovieDetailDataSourceProtocol {
        return MovieDetailDataSource(client: client)
    }
}
