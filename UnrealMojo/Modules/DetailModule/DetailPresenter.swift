//
//  DetailPresenter.swift
//  UnrealMojo
//
//  Created by Andrey Lunev on 22/10/2018.
//  Copyright © 2018 Andrey Lunev. All rights reserved.
//

import Foundation

protocol DetailPresenterInput: DetailViewControllerOutput, DetailInteractorOutput {
    
}

class DetailPresenter {
    
    // MARK: - Properties
    
    weak var view: DetailViewControllerInput!
    var interactor: DetailInteractorInput!
}



// MARK: - DetailPresenterInput

extension DetailPresenter: DetailPresenterInput {
    
    // MARK: - DetailViewControllerOutput
    
    func saveSelectedItemModel(_ itemModel: UnrealMojoModel) {
        self.interactor.configureItemModel(itemModel)
    }
    
    func loadPage() {
        interactor.getUrl()
    }
    
    
    
    // MARK: - DetailInteractorOutput
    
    func sendUrlToView(_ url: String) {
        self.view.viewPage(url)
    }
}
