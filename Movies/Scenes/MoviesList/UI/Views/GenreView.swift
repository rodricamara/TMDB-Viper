//
//  GenreView.swift
//  Movies
//
//  Created by Rodrigo Camara on 25/10/2022.
//

import UIKit

protocol GenreViewProtocol {
    func configure(with title: String)
}

final class GenreView: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 3.0
        view.backgroundColor = .black39
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLbl: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GenreView: ProgramaticallyLayoutable {
    func buildViewHierarchy() {
        addSubview(containerView)
        containerView.addSubview(titleLbl)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 4),
            titleLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 14),
            titleLbl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -14),
            titleLbl.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
        ])
    }
}

extension GenreView: GenreViewProtocol {
    func configure(with title: String) {
        titleLbl.text = title.uppercased()
    }
}
