//
//  ScanningHistory.swift
//  EasyPass
//
//  Created by Evgeny on 3/4/15.
//  Copyright (c) 2015 Evgeny. All rights reserved.
//

import UIKit

public class ScanningHistoryController: UIViewController, ScanningViewController {
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        addTabBarItem()
    }
    
    public override func viewDidLoad() {
        self.tabBarController?.navigationItem.title =
            NSLocalizedString("Scanning History", comment: "")
    }
    
    public func addTabBarItem() {
        let tabBarItem = UITabBarItem(tabBarSystemItem: .History, tag: 0)
        self.tabBarItem = tabBarItem
    }
}