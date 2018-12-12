//
//  DetailAssembly.swift
//  UnrealMojo
//
//  Created by Andrey Lunev on 22/10/2018.
//  Copyright © 2018 Andrey Lunev. All rights reserved.
//

import Foundation

class DetailAssembly {
    
    // MARK: - Properties
    
    static let sharedInstance = DetailAssembly()
    
    
    
    // MARK: - Configure
    
    func configure(_ viewController: DetailViewController) {
        
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
    
}
