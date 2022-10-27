//
//  MoviesMoviesListDependencyResolver.swift
//  Movies
//
//  Created Rodrigo Camara on 25/10/2022.
//

import Alamofire

protocol MoviesListDependencyResolverProtocol {
    func resolvePresenter(params: [AnyHashable: Any?]?,
                          view: MoviesListViewProtocol) -> MoviesListPresenterProtocol
}

final class MoviesListDependencyResolver {
    
    private let client: Session
    
    init(client: Session) {
        self.client = client
    }
}

extension MoviesListDependencyResolver: MoviesListDependencyResolverProtocol {
    func resolvePresenter(params: [AnyHashable: Any?]?,
                          view: MoviesListViewProtocol) -> MoviesListPresenterProtocol {
        return MoviesListPresenter(
            view: view,
            params: params,
            interactor: resolveInteractor(),
            mapper: resolveViewModelMapper(),
            router: resolveRouter())
    }
}

private extension MoviesListDependencyResolver {
    func resolveViewModelMapper() -> MoviesListViewModelMapperProtocol {
        return MoviesListViewModelMapper()
    }
    
    func resolveInteractor() -> MoviesListInteractorProtocol {
        return MoviesListInteractor(repository: resolveRepository(),
                                          mapper: resolveModelMapper())
    }
    
    func resolveModelMapper() -> MoviesListModelMapperProtocol {
        return MoviesListModelMapper()
    }
    
    func resolveRepository() -> MoviesListRepositoryProtocol {
        return MoviesListRemoteRepository(dataSource: resolveDatasource())
    }
    
    func resolveDatasource() -> MoviesListDataSourceProtocol {
        return MoviesListDataSource(client: client)
    }
    
    func resolveRouter() -> MoviesListRouterProtocol {
        return MoviesListRouter()
    }
}
