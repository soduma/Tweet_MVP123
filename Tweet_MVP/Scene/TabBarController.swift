//
//  TabBarController.swift
//  Tweet_MVP
//
//  Created by 장기화 on 2022/02/01.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tabBarViewControllers: [UIViewController] = TabBarItem.allCases
            .map { tabCase in
                let viewController = tabCase.viewController
                viewController.tabBarItem = UITabBarItem(
                    title: tabCase.title,
                    image: tabCase.icon.default,
                    selectedImage: tabCase.icon.selected)
                return viewController
            }
        viewControllers = tabBarViewControllers
    }
}
