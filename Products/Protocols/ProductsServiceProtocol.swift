//
//  ProductsServiceProtocol.swift
//  MVVM
//
//  Created by Rinto Andrews on 05/04/22.
//

import Foundation

protocol ProductsServiceProtocol {
    
    func getProducts(url: String, completionHandler completion: @escaping (_ result: Products, _ error: Error) -> Void)
}
