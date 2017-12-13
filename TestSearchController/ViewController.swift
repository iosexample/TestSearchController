//
//  ViewController.swift
//  TestSearchController
//
//  Created by ERU on 2017/12/05.
//  Copyright © 2017年 ERU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.barHideOnTapGestureRecognizer.addTarget(self, action: #selector(barHideAction(_:)))
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.hidesBarsOnTap = true
        
        // For debug
        self.view.backgroundColor = UIColor.cyan
        self.navigationController?.navigationBar.barTintColor = UIColor.yellow
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super .viewWillTransition(to: size, with: coordinator)
        
        
        
        coordinator.animate(alongsideTransition: { (context) in
            let orient = UIApplication.shared.statusBarOrientation
            
            switch orient {
            case .portrait:
                print("Portrait")
            default:
                print("Anything But Portrait")
            }
        }) { (context) in
            print("rotation completed")
//            self.updateFrame()
        }
        
//        if let nc = navigationController, nc.isNavigationBarHidden &&
//            !searchController.isActive {
//            if size.width > size.height {
//                searchController.searchBar.isHidden =  size.width > size.height
//            }
//        }
    }
    
    
    @objc func barHideAction(_ guesture: UITapGestureRecognizer) {
        updateFrame()
    }
    
    func updateFrame() {
        if let nc = navigationController {
            let isHidden = nc.isNavigationBarHidden
//            searchController.searchBar.isHidden = isHidden
            searchController.searchBar.superview?.isHidden = isHidden

//            if searchController.isActive {
//                if isHidden {
//                    self.additionalSafeAreaInsets.top = -nc.navigationBar.frame.size.height -
//                        UIApplication.shared.statusBarFrame.size.height
//                }
//                else {
//                    self.additionalSafeAreaInsets.top = 0
//                }
//            }
//            else {
//
//            }
            
            if isHidden {
                self.additionalSafeAreaInsets.top = -64 // fixed by a magic num
            }
            else {
                self.additionalSafeAreaInsets.top = 0
            }
        }
    }
}

