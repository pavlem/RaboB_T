//
//  PersonCellVMTests.swift
//  RaboBTests
//
//  Created by Pavle Mijatovic on 11.9.21..
//

import XCTest
@testable import RaboB

class PersonCellVMTests: XCTestCase {

    func testExample() throws {
        // given
        let person = Person(firstName: "John", surName: "Doe", issueCount: "11", dateOfBirth: "1978-01-02T00:00:00")
       
        // when
        let personCellVM = PersonCellVM(person: person)

        // then
        XCTAssert(personCellVM.name == "Name: John Doe")
        XCTAssert(personCellVM.issueCount == "Issue Count: 11")
        XCTAssert(personCellVM.dateOfBirthNice == "Date Of Birth: 78/01/02")
    }
}
