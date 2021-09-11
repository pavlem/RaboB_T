//
//  NetworkService.swift
//  RaboB
//
//  Created by Pavle Mijatovic on 11.9.21..
//

import UIKit

protocol Coordinator {
    var childCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
