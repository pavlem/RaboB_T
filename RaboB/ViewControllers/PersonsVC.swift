//
//  StartVC.swift
//  RaboB
//
//  Created by Pavle Mijatovic on 11.9.21..
//

import UIKit

class PersonsVC: UIViewController {
    
    // MARK: - API
    weak var coordinator: MainCoordinator?
    
    // MARK: - Properties
    private var personsVM = PersonsVM() {
        didSet {
            personsVM.isLoading ? BlockingScreen.start(vc: self) : BlockingScreen.stop(vc: self)
        }
    }
    
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, Person>?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setModels()
        fetchData()
    }
    
    // MARK: - Helper
    private func setUI() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = personsVM.background
        collectionView.register(PersonCell.self, forCellWithReuseIdentifier: PersonCell.reuseIdentifier)
        collectionView.delegate = self
        view.addSubview(collectionView)
        title = personsVM.title
    }
    
    private func setModels() {
        self.personsVM = PersonsVM(isLoading: true)
    }
    
    private func fetchData() {
        personsVM.fetch { persons in
            DispatchQueue.main.async {
                self.personsVM = PersonsVM(isLoading: false)
                self.createDataSource()
                self.reloadData(sections: [Section(persons: persons)])
            }
        }
    }
    
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Person>(collectionView: collectionView) { collectionView, indexPath, person in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCell.reuseIdentifier, for: indexPath) as? PersonCell else {
                fatalError("Unable to dequeue \(PersonCell.reuseIdentifier)")
            }
            
            cell.vm = PersonCellVM(person: person)
            return cell
        }
    }
    
    private func reloadData(sections: [Section]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Person>()
        snapshot.appendSections(sections)
        for section in sections {
            snapshot.appendItems(section.persons, toSection: section)
        }
        dataSource?.apply(snapshot)
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            return self.createSmallTableSection(bottomInset: self.personsVM.bottomInset, height: self.personsVM.estimatedHeight)
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        layout.configuration = config
        return layout
    }
    
    private func createSmallTableSection(bottomInset: CGFloat, height: CGFloat) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: bottomInset, trailing: 0)
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(height))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize, subitems: [layoutItem])
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        return layoutSection
    }
}

// MARK: - UICollectionViewDelegate
extension PersonsVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = dataSource?.itemIdentifier(for: indexPath) else { return }
        print(item.firstName)
        // TODO: - Open a new screen, like details for example...
    }
}
