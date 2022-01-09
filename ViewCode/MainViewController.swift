//
//  ViewController.swift
//  ViewCode
//
//  Created by Thiago Monteiro on 09/01/22.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainView: MainView
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = mainView
    }
    
    init() {
        self.mainView = MainView()
        super.init(nibName: nil, bundle: nil)
        self.mainView.cuctomCollectionView.delegate = self
        self.mainView.cuctomCollectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let square = collectionView.frame.width / 3
        return CGSize(width: square, height: square)
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .lightGray
        return cell
    }
}

