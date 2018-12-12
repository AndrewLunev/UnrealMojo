//
//  UnrealMojoDataManager.swift
//  UnrealMojo
//
//  Created by Andrey Lunev on 18/10/2018.
//  Copyright © 2018 Andrey Lunev. All rights reserved.
//

import Foundation

protocol UnrealMojoDataManagerProtocol: class {
    func fetchListObject(closure: @escaping (Error?, [UnrealMojoModel]?) -> Void) -> Void
}

class UnrealMojoDataManager: UnrealMojoDataManagerProtocol {
    
    struct UnrealMojoServiceAPI {
        
        static let unrealMojoAPI = "http://13.94.153.86/api/Data"
    }
    
    func fetchListObject(closure: @escaping (Error?, [UnrealMojoModel]?) -> Void) -> Void {
        
        let url = NSURL(string: String(UnrealMojoServiceAPI.unrealMojoAPI))!
        var request = URLRequest(url: url as URL)
        
        request.httpMethod = "GET"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let fetchTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print("Error fetch from UnrealMojo API: \(error!)")
                closure(error as Error?, nil)
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let list = try jsonDecoder.decode([UnrealMojoModel].self, from: data!)
                closure(nil, list)
            } catch {
                print("Error parsing JSON: \(error)")
                closure(error, nil)
                return
            }
        }
        
        fetchTask.resume()
    }
}
