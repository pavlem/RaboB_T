//  PersonsVM.swift
//  RaboB
//
//  Created by Pavle Mijatovic on 11.9.21..
//

import UIKit

struct PersonsVM {
    
    // MARK: - API
    func fetch(success: @escaping ([Person]) -> Void) {
        networkService.fetchData { result in
            switch result {
            case .success(let persons):
                print(persons)
                success(persons)
            case .failure(let err):
                print(err) // handle error...
            }
        }
    }
    
    let background = UIColor.lightGray
    let title = "List of persons..."
    let bottomInset = CGFloat(1)
    let estimatedHeight = CGFloat(130)
    var isLoading = true
    
    // MARK: - Properties
    private let networkService = NetworkService(csvParser: CSVParser())
}
