//
//  MoviesHeaderView.swift
//  Movies
//
//  Created by Rodrigo Camara on 26/10/2022.
//

import UIKit

final class MoviesHeaderView: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLbl: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.text = "TODAS"
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

extension MoviesHeaderView: ProgramaticallyLayoutable {
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
            
            titleLbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 17),
            titleLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            titleLbl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            titleLbl.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
        ])
    }
}
