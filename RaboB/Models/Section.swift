//
//  Section.swift
//  RaboB
//
//  Created by Pavle Mijatovic on 11.9.21..
//

import Foundation

struct Section: Decodable, Hashable {
    var id: UUID? = UUID()
    let persons: [Person]
}
