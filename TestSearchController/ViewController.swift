//
//  ViewController.swift
//  TestSearchController
//
//  Created by ERU on 2017/12/05.
//  Copyright © 2017年 ERU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        definesPresentationContext = true
//        extendedLayoutIncludesOpaqueBars = true
//        navigationController?.hidesBarsWhenVerticallyCompact = true
        
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.barHideOnTapGestureRecognizer.addTarget(self, action: #selector(barHideAction(_:)))
        navigationItem.searchController = searchController
        navigationController?.hidesBarsOnTap = true
        
        // For debug
        self.view.backgroundColor = UIColor.cyan
        self.navigationController?.navigationBar.barTintColor = UIColor.yellow
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super .viewWillTransition(to: size, with: coordinator)
        
        if let nc = navigationController, nc.isNavigationBarHidden {
            if size.width > size.height {
                searchController.searchBar.isHidden =  size.width > size.height
            }
        }
    }
    
    @objc func barHideAction(_ guesture: UITapGestureRecognizer) {
        if let nc = navigationController {
            let isHidden = nc.isNavigationBarHidden
            searchController.searchBar.isHidden = isHidden
//            if isHidden {
//                self.additionalSafeAreaInsets.top = -(self.navigationController?.navigationBar.frame.size.height)!
//            }
//            else {
//                self.additionalSafeAreaInsets.top = 0
//            }
//            nc.setNavigationBarHidden(!isHidden, animated: true)
        }
    }
}
