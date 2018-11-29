//
//  SideMenuVC.swift
//  SideBarMenu
//
//  Created by Yonadab on 11/27/18.
//  Copyright © 2018 Yonadab. All rights reserved.
//

import UIKit

class SideMenuVC: UITableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        NotificationCenter.default.post(name: NSNotification.Name("ToggleMenu"), object: nil)
        switch indexPath.row {
        case 0:
            NotificationCenter.default.post(name: NSNotification.Name("ShowProfile"), object: nil)
        case 1:
            NotificationCenter.default.post(name: NSNotification.Name("ShowSettings"), object: nil)
        case 2:
            NotificationCenter.default.post(name: NSNotification.Name("ShowLogIn"), object: nil)
        default:
            break
        }
    }
    
}
