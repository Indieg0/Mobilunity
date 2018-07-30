//
//  ViewController.swift
//  Test
//
//  Created by Kirill Konovalov on 30.07.2018.
//  Copyright © 2018 Mobilunity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Private Constants
    private let numberOfItems = Int(arc4random_uniform(8) + 2)
    
    private var currentIndex: Int? {
        didSet {
            guard let currentIndex = currentIndex else { return }
            pageControl.currentPage = currentIndex
            mainLabel.text = "Hello, you are on page #\(currentIndex+1)"
        }
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var mainLabel: UILabel!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewLayout()
        setupPageControl()
    }

    //MARK: - Private Methods
    private func setupCollectionViewLayout() {
        let layout = self.collectionView.collectionViewLayout as! CardCollectionViewFlowLayout
        layout.spacingMode = CardCollectionViewFlowLayoutSpacingMode.overlap(visibleOffset: 30)
    }
    
    private func setupPageControl() {
        currentIndex = 0
        pageControl.numberOfPages = numberOfItems
    }

}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReusableCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.currentIndex = collectionView.centerCellIndexPath?.item
    }
}


