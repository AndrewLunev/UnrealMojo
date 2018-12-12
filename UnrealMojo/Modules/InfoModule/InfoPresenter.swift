//
//  InfoPresenter.swift
//  UnrealMojo
//
//  Created by Andrey Lunev on 18/10/2018.
//  Copyright © 2018 Andrey Lunev. All rights reserved.
//

import Foundation

protocol InfoPresenterInput: InfoViewControllerOutput, InfoInteractorOutput {
    
}

class InfoPresenter {
    
    // MARK: - Properties
    
    weak var view: InfoViewControllerInput!
    var interactor: InfoInteractorInput!
    var router: InfoRouterInput!
}



// MARK: - InfoPresenterInput

extension InfoPresenter: InfoPresenterInput {
    
    // MARK: - InfoInteractorOutput
    
    func providedListObject(_ list: [UnrealMojoModel]) {
        self.view.displayFetchedListObject(list: list)
    }
    
    func serviceError(_ error: Error) {
        self.view.displayErrorView(error.localizedDescription)
    }
    
    
    
    // MARK: - InfoViewControllerOutput
    
    func fetchListObject() {
        interactor.fetchListObjectFromDataManager()
    }
    
    func goToInfoDetailScreen() {
        self.router.navigateToInfoDetail()
    }
    
    func setDataToNextScene(_ segue: UIStoryboardSegue) {
        self.router.setDataToNextScene(segue)
    }
}
