//
//  Person.swift
//  RaboB
//
//  Created by Pavle Mijatovic on 11.9.21..
//

import Foundation

struct Person: Decodable, Hashable {
    let firstName: String
    let surName: String
    let issueCount: String
    let dateOfBirth: String
}

extension Person {
    static func filter(text: String) -> String {
        text.replacingOccurrences(of: "\"", with: "")
    }
}
