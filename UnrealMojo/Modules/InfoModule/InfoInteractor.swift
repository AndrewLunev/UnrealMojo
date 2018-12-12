//
//  InfoInteractor.swift
//  UnrealMojo
//
//  Created by Andrey Lunev on 18/10/2018.
//  Copyright © 2018 Andrey Lunev. All rights reserved.
//

import Foundation

protocol InfoInteractorInput: class {
    func fetchListObjectFromDataManager()
}

protocol InfoInteractorOutput: class {
    func providedListObject(_ list: [UnrealMojoModel])
    func serviceError(_ error: Error)
}

class InfoInteractor {
    
    // MARK: - Properties
    
    weak var presenter: InfoInteractorOutput!
    var unrealMojoDataManager: UnrealMojoDataManagerProtocol!
}



// MARK: - InfoInteractorInput

extension InfoInteractor: InfoInteractorInput {
    
    func fetchListObjectFromDataManager() {
        unrealMojoDataManager.fetchListObject(closure: { (error, listObject) in
            if let list = listObject {
                print(list)
                let sortedList = list.sorted(by: { $0.title < $1.title })
                self.presenter.providedListObject(sortedList)
            } else if let error = error {
                self.presenter.serviceError(error)
            }
        })
    }
}
