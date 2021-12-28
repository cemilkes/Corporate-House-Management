//
//  TabbarVC.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/12/21.
//

import UIKit

class TabbarVC: UITabBarController {

    // MARK: LifeCycle
    
    // This function get called when views load into the memory. And only called 1 time.
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabbarVC()
        // Do any additional setup after loading the view.
    }
    
    // MARK: Helpers
    
    func configureTabbarVC() {
        viewControllers = [createJanitorHoursNC(), createHomeNC(), createCredentialsNC(), createListingsNC()]
        tabBar.tintColor = .purple
    }
    
    
    func createHomeNC() -> UINavigationController {
        let homeVC = HomeVC()
        homeVC.title = "Home"
        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        
        return UINavigationController(rootViewController: homeVC)
    }
    
    
    func createJanitorHoursNC() -> UINavigationController {
        let janitorHoursVC = JanitorHoursVC()
        janitorHoursVC.title = "Cleaning Hours"
        janitorHoursVC.tabBarItem = UITabBarItem(title: "Cleaning", image: UIImage(systemName: "bed.double"), tag: 0)
        
        return UINavigationController(rootViewController: janitorHoursVC)
    }
    
    
    func createListingsNC() -> UINavigationController {
        let listingsVC = ListingsVC()
        listingsVC.title = "Listings"
        listingsVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 3)
        let listingsNC = UINavigationController(rootViewController: listingsVC)
        
        return listingsNC
    }
    
    
    func createCredentialsNC() -> UINavigationController {
        let credentialsVC = CredentialsVC()
        credentialsVC.title = "Credentials"
        credentialsVC.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 2)
        let credentialNC = UINavigationController(rootViewController: credentialsVC)
        
        return credentialNC
    }
    
//    func createTabbar() -> UITabBarController {
//        let tabbar = UITabBarController()
//        UITabBar.appearance().tintColor = .systemGreen
//        tabbar.viewControllers = [createHomeNC(), createJanitorHoursNC()]
//
//        return tabbar
//    }
    
    // MARK: If you want to use custom unselected/selected image
    // Usage: let homeVC = templateNavigationController(unselectedImage: "", selectedImage: "", rootViewController: HomeVC())
    /*
    func templateNavigationController(unselectedImage: UIImage,
                                      selectedImage: UIImage,
                                      rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .red
        return nav
    }
    */
    
}
