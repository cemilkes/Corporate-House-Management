//
//  ListingsVC.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/9/21.
//

import UIKit

class ListingsVC: UIViewController {

    enum Section {
        case main
    }
    
    var listings: [Listing] = []
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Listing>!
    
    var client_id_a = Bundle.main.infoDictionary?["CLIENT_ID_A"] as! String
    var client_secret_a = Bundle.main.infoDictionary?["CLIENT_SECRET_A"] as! String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        configureCollectionView()
        getAngelListings(client_id: client_id_a, client_secret: client_secret_a)
        configureDataSource()
    }

    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createTwoColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ListingsCell.self, forCellWithReuseIdentifier: ListingsCell.reuseID)
    }
    
    
    func getAngelListings(client_id: String, client_secret: String) {
//        guard let client_id_a = Bundle.main.infoDictionary?["CLIENT_ID_A"] as? String,
//              let client_secret_a = Bundle.main.infoDictionary?["CLIENT_SECRET_A"] as? String else {
//                  print("Error occured")
//                  return
//        }

        let convertedClient_id_a = client_id_a.replacingOccurrences(of: "\"", with: "")
        let convertedClient_secret_a = client_secret_a.replacingOccurrences(of: "\"", with: "")
        
        showLoadingView()
        
        TokenService.shared.requestToken(client_id: convertedClient_id_a,
                                         client_secret: convertedClient_secret_a, userDefaultKey: "a_listings")
        
        delayWithSeconds(3.0) {
            ListingsAPI.shared.getListings(for: convertedClient_id_a,
                                              clientSecret: convertedClient_secret_a,
                                           hostUserDefault: "a_listings", page: 1) { result in

                self.dismissLoadingView()
                
                switch result {
                case .success(let listings):
                    self.listings = listings.data
                    print(listings)
                    self.updateData()
                case .failure(let error):
                    print(error.rawValue)
                }

            }
        }
    }
    
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Listing>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, itemIdentifier) -> UICollectionViewCell? in
            //itemIdentifier -> Listing object
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListingsCell.reuseID, for: indexPath) as! ListingsCell
            cell.backgroundColor = .systemBackground
            cell.set(listing: itemIdentifier)
            
            return cell
        })
    }
    
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Listing>()
        snapshot.appendSections([.main])
        snapshot.appendItems(listings)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
        }
    }
    
}
