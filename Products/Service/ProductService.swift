//
//  ProductService.swift
//  MVVM
//
//  Created by Rinto Andrews on 05/04/22.
//

import Foundation

class ProductService {
    
    typealias CompletionClosure =  ((Products?,Error?) -> Void)
    
    func getProducts(url: String, completionHandler: CompletionClosure?) {
        guard let request = NetworkManager.shared.createRequest(for: "\(APIConstents.baseURL)\(url)") else {
            completionHandler?(nil, NetworkError.invalidUrl)
               return
           }
        NetworkManager.shared.executeRequest(request: request, completion: completionHandler)
    }
}
