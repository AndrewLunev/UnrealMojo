//
//  DetailInteractor.swift
//  UnrealMojo
//
//  Created by Andrey Lunev on 22/10/2018.
//  Copyright © 2018 Andrey Lunev. All rights reserved.
//

import Foundation

protocol DetailInteractorOutput: class {
    func sendUrlToView(_ url: String)
}

protocol DetailInteractorInput: class {
    func configureItemModel(_ itemModel: UnrealMojoModel)
    func getUrl()
}

class DetailInteractor {
    
    // MARK: - Properties
    
    weak var presenter: DetailInteractorOutput!
    var selectedItem: UnrealMojoModel?
}



// MARK: - DetailInteractorInput

extension DetailInteractor: DetailInteractorInput {
    
    func configureItemModel(_ itemModel: UnrealMojoModel) {
        self.selectedItem = itemModel
    }
    
    func getUrl() {
        if let item = selectedItem {
            self.presenter.sendUrlToView(item.url)
        }
    }
}
