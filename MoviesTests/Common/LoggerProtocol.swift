//
//  LoggerProtocol.swift
//  MoviesTests
//
//  Created by Rodrigo Camara on 26/10/2022.
//

protocol LoggerProtocol: AnyObject {
    associatedtype GenericMethod: RawRepresentable where GenericMethod.RawValue == String
    var lastFunction: GenericMethod? { get set }
    var functionStack: [GenericMethod] { get set}
    func log(logMessage: String?, functionName: String)
}

extension LoggerProtocol {
    func log(logMessage: String? = nil, functionName: String = #function) {
        lastFunction = .init(rawValue: functionName)
        guard let funcName = GenericMethod(rawValue: functionName) else {
            return
        }
        functionStack.append(funcName)
    }
}
