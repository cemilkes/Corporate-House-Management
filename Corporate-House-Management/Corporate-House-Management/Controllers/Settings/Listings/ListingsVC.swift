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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        configureCollectionView()
        getListings()
        configureDataSource()
    }

    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createTwoColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ListingsCell.self, forCellWithReuseIdentifier: ListingsCell.reuseID)
    }
    
    
    func getListings() {
        guard let client_id_a = Bundle.main.infoDictionary?["CLIENT_ID_A"] as? String,
              let client_secret_a = Bundle.main.infoDictionary?["CLIENT_SECRET_A"] as? String else {
                  print("Error occured")
                  return
        }
        //let client_id_m = Bundle.main.infoDictionary?["CLIENT_ID_M"] as? String,
        //let client_secret_m = Bundle.main.infoDictionary?["CLIENT_SECRET_M"] as? String
        print(client_id_a)
        print(client_secret_a)
        
        TokenService.shared.requestToken(client_id: "",
                                         client_secret: "", userDefaultKey: "a_listings")
        
        delayWithSeconds(3.0) {
            ListingsAPI.shared.getListings(for:"",
                                           clientSecret: "",
                                           hostUserDefault: "a_listings", page: 1) { result in

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
            cell.backgroundColor = .systemPink
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
