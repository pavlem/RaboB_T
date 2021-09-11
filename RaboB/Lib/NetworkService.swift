//
//  NetworkService.swift
//  RaboB
//
//  Created by Pavle Mijatovic on 11.9.21..
//

import Foundation

class NetworkService {
    
    func fetchData(completion: @escaping (Result<[Person], Error>) -> ()) {
        
        // Simulating a real network request....
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            
            guard let path = Bundle.main.path(forResource: "issues", ofType: "csv") else {
                completion(.failure(CocoaError(.coderInvalidValue))) // some random error
                return
            }
            
            guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)), let encodedData = String(data: data, encoding: .utf8) else {
                completion(.failure((CocoaError(.coderInvalidValue))))
                return
            }
            
            if let persons = self.csvParser.parseCSV(fromEncodedData: encodedData) {
                completion(.success(persons))
            } else {
                completion(.failure((CocoaError(.coderInvalidValue))))

            }
                        
        }
    }
    
    private let csvParser: CSVParser
    
    init (csvParser: CSVParser) {
        self.csvParser = csvParser
    }
    
    
}
