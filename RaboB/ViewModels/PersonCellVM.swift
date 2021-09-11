//
//  PersonCellVM.swift
//  RaboB
//
//  Created by Pavle Mijatovic on 11.9.21..
//


import UIKit

struct PersonCellVM {
    let name: String
    let issueCount: String
    let dateOfBirth: String
    
    let textFont = UIFont.boldSystemFont(ofSize: 16)
    let textFontBig = UIFont.boldSystemFont(ofSize: 20)

    let textColor = UIColor(red: 242/255.0, green: 215/255.0, blue: 102/255.0, alpha: 1)
    let numberOfLines = 0
    let backgroundColor = UIColor(red: 66/255.0, green: 66/255.0, blue: 66/255.0, alpha: 1)
    let spacing = CGFloat(10)
    let leadingAnchor = CGFloat(10)
    let trailingAnchor = CGFloat(-10)
    let topAnchor = CGFloat(16)
}

extension PersonCellVM {
    init(person: Person) {
        name = "Name: " + person.firstName + " " + person.surName
        issueCount = "Issue Count: " + person.issueCount
        dateOfBirth = person.dateOfBirth
    }
}

extension PersonCellVM {
    var dateOfBirthNice: String {
        guard let date = self.date else { return "None" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY/MM/dd"
        return "Date Of Birth: " + dateFormatter.string(from: date)
    }
    
    private var date: Date? {
        let isoDate = dateOfBirth
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = dateFormatter.date(from:isoDate)!
        return date
    }
}
