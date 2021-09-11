//
//  CSVParser.swift
//  RaboB
//
//  Created by Pavle Mijatovic on 11.9.21..
//

import Foundation

class CSVParser {
    func parseCSV(fromEncodedData encodedData: String) -> [Person]? {
        
        var persons = [Person]()
        var dataArr = encodedData.components(separatedBy: "\r\n").map({ $0.components(separatedBy: ",") })
        dataArr.remove(at: 0)
        
        for line in dataArr {
            guard line.count == 4 else {
                continue
            }
            let person = Person(firstName: Person.filter(text: line[0]), surName: Person.filter(text: line[1]), issueCount: Person.filter(text: line[2]), dateOfBirth: Person.filter(text: line[3]))
            persons.append(person)
        }
        return persons
    }
}
