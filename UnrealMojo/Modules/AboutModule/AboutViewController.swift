//
//  AboutViewController.swift
//  UnrealMojo
//
//  Created by Andrey Lunev on 18/10/2018.
//  Copyright © 2018 Andrey Lunev. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var webView: UIWebView!
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAboutPage()
    }
    
    
    
    // MARK: - Private
    
    fileprivate func viewAboutPage() {
        if let asset = NSDataAsset(name: "cv") {
            let data = asset.data
            webView.load(data, mimeType: "application/pdf", textEncodingName: "", baseURL: NSURL() as URL)
        }
    }
}
