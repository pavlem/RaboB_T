//
//  NetworkService.swift
//  RaboB
//
//  Created by Pavle Mijatovic on 11.9.21..
//

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = PersonsVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
