//
//  ViewController.swift
//  SideBarMenu
//
//  Created by Yonadab on 11/27/18.
//  Copyright © 2018 Yonadab. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {
    
    @IBOutlet weak var menuContainer: UIView!
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    
    var isMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(toggleMenu),
                                               name: NSNotification.Name("ToggleMenu"),
                                               object: nil)
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(toggleMenu))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
    }
    
    @objc func toggleMenu() {
        if isMenuOpen {
            isMenuOpen = false
            sideMenuConstraint.constant = -menuContainer.frame.size.width
        }
        else {
            isMenuOpen = true
            sideMenuConstraint.constant = 0
        }
        NotificationCenter.default.post(name: NSNotification.Name("HideContent"), object: nil)
        
        UIView.animate(withDuration: 0.3){
            self.view.layoutIfNeeded()
        }
    }

  

}

