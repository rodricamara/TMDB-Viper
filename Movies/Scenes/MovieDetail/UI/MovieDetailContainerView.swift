//
//  MovieDetailContainerView.swift
//  Movies
//
//  Created Rodrigo Camara on 26/10/2022.
//

import UIKit

protocol MovieDetailContainerViewProtocol {}

protocol MovieDetailContainerViewDelegate: AnyObject {}

final class MovieDetailContainerView: UIView {
    
    private let viewModel: MoviesResultViewModel
    private weak var delegate: MovieDetailContainerViewDelegate?
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image(fromString: viewModel.posterPath)
        imageView.layer.cornerRadius = 6.0
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLbl: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = viewModel.title
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.font = label.font.withSize(24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var yearLbl: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = viewModel.year
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var overviewTitleLbl: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "OVERVIEW"
        label.textColor = .black
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var overviewText: UITextView = {
        let textView = UITextView(frame: .zero)
        return setUpTextView(textView)
    }()
    
    init(
        viewModel: MoviesResultViewModel,
        delegate: MovieDetailContainerViewDelegate?
    ) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.delegate = delegate
        setUpView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MovieDetailContainerView: ProgramaticallyLayoutable {
    func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(
            image,
            titleLbl,
            yearLbl,
            overviewTitleLbl,
            overviewText)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeTopAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeBottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 97),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -97),
            image.heightAnchor.constraint(equalToConstant: 320),
            
            titleLbl.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 23),
            titleLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 37),
            titleLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -37),
            
            yearLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 2),
            yearLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 37),
            yearLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -37),
            
            overviewTitleLbl.topAnchor.constraint(equalTo: yearLbl.bottomAnchor, constant: 43),
            overviewTitleLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 37),
            overviewTitleLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -37),
            
            overviewText.topAnchor.constraint(equalTo: overviewTitleLbl.bottomAnchor, constant: 10),
            overviewText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 37),
            overviewText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -37),
            overviewText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setUpAdditionalConfigs() {
        backgroundColor = .customYellow
    }
}

private extension MovieDetailContainerView {
    func setUpTextView(_ textView: UITextView) -> UITextView {
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.backgroundColor = .clear
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 18
        textView.setTextWithStyle(text: viewModel.overview, style: style)
        textView.font = .systemFont(ofSize: 14)
        textView.textColor = .white
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }
}

extension MovieDetailContainerView: MovieDetailContainerViewProtocol {}
