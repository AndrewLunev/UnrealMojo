//
//  UnrealMojoModel.swift
//  UnrealMojo
//
//  Created by Andrey Lunev on 18/10/2018.
//  Copyright © 2018 Andrey Lunev. All rights reserved.
//

import Foundation

struct UnrealMojoModel: Codable {
    let title: String
    let desc: String
    let image: String?
    let url: String
    var picture: Data?
}

