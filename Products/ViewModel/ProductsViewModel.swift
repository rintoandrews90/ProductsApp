//
//  ProductsViewModel.swift
//  Products
//
//  Created by Rinto Andrews on 05/04/22.
//

import Foundation

protocol ProductViewModelDelegate: AnyObject {
    func success()
    func fail()
}

class WeatherViewModel {
    
    var service: ProductService?
    var productsModel: Products?
    weak var delegate: ProductViewModelDelegate?
    
    var categories: HomeDatum?
    var banner: HomeDatum?
    var products: HomeDatum?
    
    
    init(service: ProductService, delegate: ProductViewModelDelegate) {
        self.service = service
        self.delegate = delegate
    }
    
    func getProducts() {
        service?.getProducts(url: "v3/69ad3ec2-f663-453c-868b-513402e515f0" , completionHandler: { model, error in
            if let _ = error {
                self.delegate?.fail()
            } else if let model = model {
                self.productsModel = model
                
                self.categories = self.productsModel?.homeData.filter { $0.type == "category"}.first
                self.banner = self.productsModel?.homeData.filter { $0.type == "banners"}.first
                self.products = self.productsModel?.homeData.filter { $0.type == "products"}.first
                
                self.delegate?.success()
            }
        })
    }
}
