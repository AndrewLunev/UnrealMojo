//
//  InfoRouting.swift
//  UnrealMojo
//
//  Created by Andrey Lunev on 18/10/2018.
//  Copyright © 2018 Andrey Lunev. All rights reserved.
//

import UIKit

protocol InfoRouterInput: class {
    func navigateToInfoDetail()
    func setDataToNextScene(_ segue: UIStoryboardSegue)
}

class InfoRouting {
    
    // MARK: - Properties
    
    weak var viewController: InfoTableViewController!
    
    
    
    // MARK:- Private
    
    fileprivate func setDataToShowDetailScene(_ segue: UIStoryboardSegue) {
        if let selectedIndexPath = viewController.tableView.indexPathForSelectedRow {
            let selectedItem = viewController.listObject[selectedIndexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            
            detailViewController.presenter.saveSelectedItemModel(selectedItem)
        }
    }
}



// MARK:- InfoRouterInput

extension InfoRouting: InfoRouterInput {
    
    func navigateToInfoDetail() {
        viewController.performSegue(withIdentifier: "ShowUrlDetail", sender: nil)
    }
    
    func setDataToNextScene(_ segue: UIStoryboardSegue) {
        if segue.identifier == "ShowUrlDetail" {
            setDataToShowDetailScene(segue)
        }
    }
}
