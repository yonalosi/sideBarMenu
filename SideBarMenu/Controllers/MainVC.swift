//
//  MainVC.swift
//  SideBarMenu
//
//  Created by Yonadab on 11/27/18.
//  Copyright © 2018 Yonadab. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var otherViewBtn: UIButton!
    var button: HamburgerButton! = nil
    let viewNavBtn = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    var isMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGestures()
        button = HamburgerButton(frame: CGRect(x: -8, y: -8, width: 60, height: 60))
        self.button.addTarget(self, action: #selector(onMenuTapped), for:.touchUpInside)
        viewNavBtn.addSubview(button)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: viewNavBtn)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showProfile),
                                               name: NSNotification.Name("ShowProfile"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showSettings),
                                               name: NSNotification.Name("ShowSettings"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showLogIn),
                                               name: NSNotification.Name("ShowLogIn"),
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideContent),
                                               name: NSNotification.Name("HideContent"),
                                               object: nil)
    }
    
    
    @objc func showProfile(){
        performSegue(withIdentifier: "ShowProfile", sender: nil)
    }
    @objc func showSettings(){
        performSegue(withIdentifier: "ShowSettings", sender: nil)
    }
    @objc func showLogIn(){
        performSegue(withIdentifier: "ShowLogIn", sender: nil)
    }

    @IBAction func onMenuTapped() {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleMenu"), object: nil)
        
    }
   
    @objc func onMenuSwiped(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            if !isMenuOpen, swipeGesture.direction == UISwipeGestureRecognizer.Direction.right {
               onMenuTapped()
            } else if isMenuOpen, swipeGesture.direction == UISwipeGestureRecognizer.Direction.left {
               onMenuTapped()
            }
        }
    }
    
    @objc func hideContent(){
        otherViewBtn.isEnabled = isMenuOpen
        blackView.isHidden = isMenuOpen
        button.showsMenu = !button.showsMenu
        isMenuOpen = !isMenuOpen
    }
    
    func setupGestures(){
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(onMenuSwiped))
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(onMenuSwiped))
        swipeRight.direction = .right
        swipeRight.direction = .left
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
    }

}
