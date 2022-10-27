//
//  ProgramaticallyLayoutable.swift
//  Movies
//
//  Created by Rodrigo Camara on 25/10/2022.
//

import Foundation

protocol ProgramaticallyLayoutable {
    func setUpView()
    func buildViewHierarchy()
    func setUpConstraints()
    func setUpAdditionalConfigs()
}

extension ProgramaticallyLayoutable {
    
    func setUpView() {
        buildViewHierarchy()
        setUpConstraints()
        setUpAdditionalConfigs()
    }
    
    func setUpAdditionalConfigs() {}
}
