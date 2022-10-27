//
//  MoviesBaseViewController.swift
//  Movies
//
//  Created by Rodrigo Camara on 25/10/2022.
//

import UIKit

protocol MoviesBaseViewProtocol: AnyObject {
    func setUpBackButton()
    func setUpLeftButton(target: AnyObject, action: Selector, with image: UIImage?)
}

class MoviesBaseViewController: UIViewController {
    
    var navigationBarColor: UIColor? {
        didSet {
            guard let color = navigationBarColor else {
                return
            }
            setUpNavigationController(with: color)
        }
    }
    
    required init(dictionary: [AnyHashable: Any?]?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationController()
    }
    
}

extension MoviesBaseViewController: MoviesBaseViewProtocol {
    func setUpBackButton() {
        setUpLeftButton(target: self, action: #selector(pop), with: UIImage(named: "arrow"))
    }
    
    func setUpLeftButton(target: AnyObject, action: Selector, with image: UIImage? = nil) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: image,
            style: .plain,
            target: target,
            action: action)
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    

}

private extension MoviesBaseViewController {
    func setUpNavigationController(with color: UIColor? = .black90) {
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = color
            appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            
        } else {
            navigationController?.navigationBar.barTintColor = .blue
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
    }
    
    @objc
    private func pop() {
        navigationController?.popViewController(animated: true)
    }
}

fileprivate extension UIImage {
    static var backArrow: UIImage? { UIImage(named: "arrow") }
}
