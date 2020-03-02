//
//  GalleyPhotoViewController.swift
//  Cars
//
//  Created by Mazen on 3/3/20.
//  Copyright © 2020 Mazen. All rights reserved.
//

import UIKit

class GalleryPhotoViewController: UIViewController {
    
    //MARK: - iboutlet
    @IBOutlet var collectionPhoto: UICollectionView!
    @IBOutlet var btnRight: UIButton!
    @IBOutlet var btnLeft: UIButton!
    @IBOutlet var pagerControl: UIPageControl!

    
    //MARK: - variable
    var selectedIndex = 0

    //MARK; - view methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        pagerControl.currentPage = selectedIndex
        collectionPhoto.scrollToItem(at: IndexPath(item: selectedIndex, section: 0), at: .centeredHorizontally, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

    }
    
    //MARK: - ibaction
    @IBAction func rightBtnPressed() {
        if selectedIndex >= 5 {
            return
        }
        pagerControl.currentPage = selectedIndex + 1
        collectionPhoto.scrollToItem(at: IndexPath(item: selectedIndex + 1, section: 0), at: .left, animated: false)
        selectedIndex = selectedIndex + 1
    }
    
    @IBAction func leftBtnPressed() {
        
        if selectedIndex <= 0 {
            return
        }
        pagerControl.currentPage = selectedIndex - 1
        collectionPhoto.scrollToItem(at: IndexPath(item: selectedIndex - 1, section: 0), at: .left, animated: true)
        selectedIndex = selectedIndex - 1
        
//        guard let indexPath = collectionPhoto.indexPathsForVisibleItems.first.flatMap({
//            IndexPath(item: $0.row + 1, section: $0.section)
//        }), collectionPhoto.cellForItem(at: indexPath) != nil else {
//            return
//        }
//
//        collectionPhoto.scrollToItem(at: indexPath, at: .left, animated: true)
    }

    @IBAction func closeBtnPressed() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension GalleryPhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryPhotoCollectionViewCell", for: indexPath) as! GalleryPhotoCollectionViewCell
        if indexPath.row % 2 == 0 {
            cell.imgPhoto.image = UIImage(named: "Gallery_0")
        }
        else {
            cell.imgPhoto.image = UIImage(named: "Gallery_1")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pagerControl.currentPage = indexPath.row
        selectedIndex = indexPath.row
    }
    
}

extension GalleryPhotoViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionPhoto.frame.size.width, height: 450.0)
    }
}
