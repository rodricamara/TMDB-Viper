//
//  MoviesListCell.swift
//  Movies
//
//  Created by Rodrigo Camara on 25/10/2022.
//

import UIKit

protocol MoviesListCellProtocol {
    func configure(with viewModel: MoviesResultViewModel?)
}

final class MoviesListCell: UITableViewCell {
    
    private var viewModel: MoviesResultViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            image.image(fromString: viewModel.backdropPath)
            titleLbl.text = viewModel.title
            genreView.configure(with: viewModel.genre)
        }
    }
    
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var genreView: GenreView = {
        let view = GenreView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLbl: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .iceBlue
        label.numberOfLines = 0
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(style: .default, reuseIdentifier: nil)
    }
    
}

extension MoviesListCell: ProgramaticallyLayoutable {
    func buildViewHierarchy() {
        contentView.addSubview(containerView)
        containerView.addSubviews(image,
                                  genreView,
                                  titleLbl)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.safeTopAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.safeBottomAnchor, constant: -20),
            containerView.heightAnchor.constraint(equalToConstant: 156),
            
            image.topAnchor.constraint(equalTo: containerView.topAnchor),
            image.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            genreView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            genreView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -6),
            
            titleLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 18),
            titleLbl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -18),
            titleLbl.bottomAnchor.constraint(equalTo: containerView.safeBottomAnchor, constant: -15),
        ])
    }
    
    func setUpAdditionalConfigs() {
        backgroundColor = .clear
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 3.0
        selectionStyle = .none
    }
}

extension MoviesListCell: MoviesListCellProtocol {
    func configure(with viewModel: MoviesResultViewModel?) {
        self.viewModel = viewModel
    }
}
