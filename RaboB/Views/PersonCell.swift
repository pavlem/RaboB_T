//
//  SmallTableCell.swift
//  TapStore
//
//  Created by Paul Hudson on 01/10/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit

class PersonCell: UICollectionViewCell {
    
    // MARK: - API
    static let reuseIdentifier = "PersonCell"
    
    var vm: PersonCellVM? {
        willSet {
            updateUI(vm: newValue)
        }
    }
    
    // MARK: - Properties
    private let name = UILabel()
    private let issueCount = UILabel()
    private let dateOfBirth = UILabel()
    
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("not supported...")
    }
    
    // MARK: - Helper
    private func updateUI(vm: PersonCellVM?) {
        guard let vm = vm else { return }
        
        name.font = vm.textFontBig
        name.textColor = vm.textColor
        name.numberOfLines = vm.numberOfLines
        name.text = vm.name
        
        issueCount.font = vm.textFont
        issueCount.textColor = vm.textColor
        issueCount.numberOfLines = vm.numberOfLines
        issueCount.text = vm.issueCount
        
        dateOfBirth.font = vm.textFont
        dateOfBirth.textColor = vm.textColor
        dateOfBirth.numberOfLines = vm.numberOfLines
        dateOfBirth.text = vm.dateOfBirth
        
        setLayout(vm: vm, labels: [name, issueCount, dateOfBirth])
    }
    
    private func setLayout(vm: PersonCellVM, labels: [UILabel]) {
        let stackView = UIStackView(arrangedSubviews: labels)
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.spacing = vm.spacing
        contentView.addSubview(stackView)
        contentView.backgroundColor = vm.backgroundColor
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: vm.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: vm.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: vm.topAnchor)
        ])
    }
}
