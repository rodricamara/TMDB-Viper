//
//  MoviesListContainerView.swift
//  Movies
//
//  Created Rodrigo Camara on 25/10/2022.
//

import UIKit

protocol MoviesListContainerViewProtocol {
    func setUpView(viewModel: MoviesListViewModel?)
}

protocol MoviesListContainerViewDelegate: AnyObject {
    func isLoadingLastCell()
    func didTapOnCell(viewModel: MoviesResultViewModel)
}

final class MoviesListContainerView: UIView {
    
    private var viewModel: MoviesListViewModel? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private weak var delegate: MoviesListContainerViewDelegate?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.sectionHeaderTopPadding = 0
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.tableFooterView = nil
        tableView.register(MoviesListCell.self, forCellReuseIdentifier: MoviesListCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init(
        viewModel: MoviesListViewModel? = nil,
        delegate: MoviesListContainerViewDelegate?
    ) {
        super.init(frame: .zero)
        self.viewModel = viewModel
        self.delegate = delegate
        setUpView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MoviesListContainerView: ProgramaticallyLayoutable {
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeTopAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: safeBottomAnchor),
        ])
    }
    
    func setUpAdditionalConfigs() {
        backgroundColor = .blackTwo
    }
}

extension MoviesListContainerView: MoviesListContainerViewProtocol {
    func setUpView(viewModel: MoviesListViewModel?) {
        self.viewModel = viewModel
    }
}

private extension MoviesListContainerView {
    
}

extension MoviesListContainerView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MoviesListCell.identifier,
                                                       for: indexPath) as? MoviesListCell,
              let viewModel = viewModel
        else {
            return UITableViewCell()
        }
        let isLastCell = indexPath.row == viewModel.results.count - 1
        if isLastCell {
            delegate?.isLoadingLastCell()
        }
        cell.configure(with: viewModel.results[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return MoviesHeaderView()
    }
}

extension MoviesListContainerView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedMovieResultViewModel = viewModel?.results[indexPath.row]
        else {
            return
        }
        delegate?.didTapOnCell(viewModel: selectedMovieResultViewModel)
    }
}
