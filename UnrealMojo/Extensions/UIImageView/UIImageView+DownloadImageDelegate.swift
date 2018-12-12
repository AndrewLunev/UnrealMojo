//
//  UIImageView+DownloadImageDelegate.swift
//  UnrealMojo
//
//  Created by Andrey Lunev on 18/10/2018.
//  Copyright © 2018 Andrey Lunev. All rights reserved.
//

import Foundation

protocol DownloadImageDelegate {
    func load(from url: String, closure: @escaping (Data?) -> Void) -> Void
}

extension UIImageView: DownloadImageDelegate {
    
    func load(from url: String, closure: @escaping (Data?) -> Void) -> Void {
        guard let url = URL(string: url) else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        closure(data)
                    }
                }
            }
        }
    }
}
