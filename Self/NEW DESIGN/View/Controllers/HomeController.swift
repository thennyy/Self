//
//  HomeController.swift
//  Self
//
//  Created by Thenny Chhorn on 9/14/22.
//

import UIKit
import GoogleMobileAds
import AdSupport

class HomeCController: UIViewController {
    
    lazy var homeNavigationView = HomeNavigationView(delegate: self)
    let homeView = HomeView()
  
    lazy var tabBarView = CustomeTabView(delegate: self)
    
    private let banner: GADBannerView = {
        let banner = GADBannerView()
        banner.adUnitID = "ca-app-pub-8648710989263241/5555430074"
        banner.load(GADRequest())
        //banner.backgroundColor = .shareColor
        
        return banner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        homeView.delegate = self
        configureUI()
        
    }
    
    private func configureUI() {
        
        view.backgroundColor = .white
        view.addSubview(homeNavigationView)
        homeNavigationView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                  left: view.leftAnchor,
                                  right: view.rightAnchor,
                                  height: 120)
  
        view.addSubview(homeView)
        homeView.anchor(top: homeNavigationView.bottomAnchor,
                        left: view.leftAnchor,
                        bottom: view.bottomAnchor,
                        right: view.rightAnchor, paddingTop: 0,
                        paddingLeft: 0,
                        paddingBottom: -20,
                        paddingRight: 0)

        view.addSubview(tabBarView)
        tabBarView.anchor(left: view.leftAnchor,
                          bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          right: view.rightAnchor,
                          paddingLeft: 20,
                          paddingBottom: 0,
                          paddingRight: 20,
                          height: 60)
        
        tabBarView.layer.cornerRadius = 60/2

    
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        configureAdds()
    }
    
    private func configureAdds() {
        banner.rootViewController = self
        requestIDFA()
    }
}

extension HomeCController: HomeViewDelegate {
    
    func homeView(_ view: HomeView) {
        let layout = UICollectionViewFlowLayout()
        let vc = AddReflectionController(collectionViewLayout: layout)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeCController: CustomeTabBarViewDelegate {
    func customTabBarView(_ view: CustomeTabView, reflectButton: UIButton) {
        let layout = UICollectionViewFlowLayout()
        let vc = ReflectionController(collectionViewLayout: layout)
      
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func customTabBarView(_ view: CustomeTabView, goalButton: UIButton) {
        let layout = UICollectionViewFlowLayout()
        let vc = GoalCollectionController(collectionViewLayout: layout)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func customTabBarView(_ view: CustomeTabView, noteButton: UIButton) {
        let layout = UICollectionViewFlowLayout()
        let vc = NoteCollectionController(collectionViewLayout: layout)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func customTabBarView(_ view: CustomeTabView, diaryButton: UIButton) {
        let layout = UICollectionViewFlowLayout()
        let vc = DiaryCollectionController(collectionViewLayout: layout)
        navigationController?.pushViewController(vc, animated: true)
    }
    
//    func customTabBarView(_ view: CustomeTabView, button: UIButton, tabBar: TabBar) {
//
//
//    }
  
}
extension HomeCController {
    
   // @available(iOS 14, *)
    
    func requestIDFA() {
  
        view.addSubview(banner)
        banner.anchor(left: view.leftAnchor,
                      bottom: tabBarView.topAnchor,
                      right: view.rightAnchor,
                      paddingLeft: 10,
                      paddingBottom: 10,
                      paddingRight: 10,
                      height: 60)
        
          
    }
}
    // MARK: - HomeNavigationViewDelegate
extension HomeCController: HomeNavigationViewDelegate {
    func homeNavigationView(_ view: HomeNavigationView, calendarButton: UIButton) {
        let layout = UICollectionViewFlowLayout()
        let vc = CalendarCollectionController(collectionViewLayout: layout)
        
        present(vc, animated: true)
        
     //   navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
