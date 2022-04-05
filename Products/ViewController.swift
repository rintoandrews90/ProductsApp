//
//  ViewController.swift
//  Products
//
//  Created by Rinto Andrews on 05/04/22.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var bannerCollection: UICollectionView!
    @IBOutlet weak var categoryCollection: UICollectionView!
    @IBOutlet weak var productsCollection: UICollectionView!
    
    var viewModel: WeatherViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollection.dataSource = self
        categoryCollection.delegate = self
        
        bannerCollection.dataSource = self
        bannerCollection.delegate = self
        
        productsCollection.dataSource = self
        productsCollection.delegate = self
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        productsCollection.collectionViewLayout = flowLayout
        
        viewModel = WeatherViewModel(service: ProductService(), delegate: self)
        viewModel.getProducts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

}

extension ViewController: ProductViewModelDelegate {
    
    func success() {
        categoryCollection.reloadData()
        bannerCollection.reloadData()
        productsCollection.reloadData()
    }
    
    func fail() {
         
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollection {
            return viewModel.categories?.values.count ?? 0
        } else if collectionView == bannerCollection {
            return viewModel.banner?.values.count ?? 0
        } else if collectionView == productsCollection {
            return viewModel.products?.values.count ?? 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == categoryCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            if let category = viewModel.categories?.values[indexPath.row] {
                cell.configure(catagory: category)
                if let url =  URL(string: category.imageURL ?? "") {
                    cell.categoryImage.kf.setImage(with: url)
                }
            }
            
            cell.backgroundImage.layer.cornerRadius = cell.backgroundImage.frame.size.width / 2
            cell.backgroundImage.clipsToBounds = true
            
            return cell
        } else if collectionView == bannerCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
            if let banner = viewModel.banner?.values[indexPath.row] {
                if let url =  URL(string: banner.bannerURL ?? "") {
                    cell.bannerImage.kf.setImage(with: url)
                }
            }
            
            cell.contentView.layer.cornerRadius = 5
            cell.contentView.clipsToBounds = true
            
            return cell
        } else if collectionView == productsCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as! ProductsCollectionViewCell
            if let banner = viewModel.products?.values[indexPath.row] {
                if let url =  URL(string: banner.image ?? "") {
                    cell.productImage.kf.setImage(with: url)
                }
                cell.configure(data: banner)
            }
            
            cell.contentView.layer.cornerRadius = 5
            cell.contentView.clipsToBounds = true
            cell.contentView.layer.borderWidth = 0.5
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == categoryCollection {
            return CGSize(width: 80, height: 80)
        } else if collectionView == bannerCollection {
            return CGSize(width: collectionView.bounds.width - 30, height: 170)
        }else if collectionView == productsCollection {
            return CGSize(width: 190, height: collectionView.bounds.height - 20)
        }
        
        return CGSize.zero
    }
}
