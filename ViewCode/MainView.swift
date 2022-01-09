//
//  MainView.swift
//  ViewCode
//
//  Created by Thiago Monteiro on 09/01/22.
//

import UIKit

class MainView: UIView {
    
   lazy var cuctomCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 200)
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.backgroundColor = .white
        collection.clipsToBounds = true
        return collection
    }()
    
    private let customSegmentControll: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["White", "Red", "Green", "Blue"])
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.selectedSegmentIndex = 0
        segment.backgroundColor = .white
        segment.tintColor = .black
        segment.addTarget(self, action: #selector(segmentTapped(_:)), for: .valueChanged)
        return segment
    }()
    
    @objc func segmentTapped(_ sender: UISegmentedControl) {
        if customSegmentControll.selectedSegmentIndex == 0 {
            self.backgroundColor = .white
            self.cuctomCollectionView.backgroundColor = .white
            
        } else if customSegmentControll.selectedSegmentIndex == 1 {
            self.backgroundColor = .red
            self.cuctomCollectionView.backgroundColor = .red
            
        } else if customSegmentControll.selectedSegmentIndex == 2 {
            self.backgroundColor = .green
            self.cuctomCollectionView.backgroundColor = .green
            
        } else if customSegmentControll.selectedSegmentIndex == 3 {
            self.backgroundColor = .blue
            self.cuctomCollectionView.backgroundColor = .blue
            
        } else {
            self.backgroundColor = .white
            self.cuctomCollectionView.backgroundColor = .white
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.buildHierarchyView()
        self.setupConstraints()
    }
    
    private func buildHierarchyView() {
        self.addSubview(cuctomCollectionView)
        self.addSubview(customSegmentControll)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.cuctomCollectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.cuctomCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.cuctomCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.cuctomCollectionView.heightAnchor.constraint(equalToConstant: 250),
            
            self.customSegmentControll.topAnchor.constraint(equalTo: self.cuctomCollectionView.bottomAnchor, constant: 20),
            self.customSegmentControll.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            self.customSegmentControll.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            self.customSegmentControll.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

