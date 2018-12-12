//
//  DetailViewController.swift
//  UnrealMojo
//
//  Created by Andrey Lunev on 22/10/2018.
//  Copyright © 2018 Andrey Lunev. All rights reserved.
//

import UIKit

protocol DetailViewControllerInput: class {
    func viewPage(_ url: String)
}

protocol DetailViewControllerOutput: class {
    func saveSelectedItemModel(_ itemModel: UnrealMojoModel)
    func loadPage()
}

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: DetailViewControllerOutput!
    
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var webView: UIWebView!
    
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadPage()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DetailAssembly.sharedInstance.configure(self)
    }
}



// MARK: - DetailViewControllerInput

extension DetailViewController: DetailViewControllerInput {
    func viewPage(_ url: String) {
        if let destinationUrl = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
            let request = URLRequest(url: destinationUrl)
            webView.loadRequest(request)
        }
    }
}
