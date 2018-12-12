//
//  InfoAssembly.swift
//  UnrealMojo
//
//  Created by Andrey Lunev on 18/10/2018.
//  Copyright © 2018 Andrey Lunev. All rights reserved.
//

import Foundation

class InfoAssembly {
    
    // MARK: - Properties
    
    static let sharedInstance = InfoAssembly()
    
    
    
    // MARK: - Configure
    
    func configure(_ viewController: InfoTableViewController) {
        
        let unrealMojoDataManager = UnrealMojoDataManager()
        let interactor = InfoInteractor()
        let presenter = InfoPresenter()
        let router = InfoRouting()
        
        router.viewController = viewController
        presenter.router = router
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.unrealMojoDataManager = unrealMojoDataManager
    }
    
}
