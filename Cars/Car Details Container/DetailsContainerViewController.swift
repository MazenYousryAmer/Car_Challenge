//
//  DetailsContainerViewController.swift
//  Cars
//
//  Created by Mazen on 3/2/20.
//  Copyright © 2020 Mazen. All rights reserved.
//

import UIKit

protocol DetailsProtocol {
    func showGalleryWithSelectedIndex(_ selectedIndex: Int)
}

class DetailsContainerViewController: UIViewController {
    
    //MARK: - iboutlet
    @IBOutlet var tabsView: UIStackView!
    @IBOutlet var tabsViewSelection: UIView!
    @IBOutlet var containView: UIView!
    @IBOutlet var btnTabs: [UIButton]!
    
    //MARK: - variable
    var presenter = DetailsPresenter()
    
    //MARK: - view methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    //MARK: - setup
    func setupView() {
        setupLocalization()
    }
    
    func setupLocalization() {
        btnTabs[0].setTitle("overview", for: .normal)
        btnTabs[1].setTitle("specs & features", for: .normal)
        btnTabs[2].setTitle("gallery", for: .normal)
    }
    
    //MARK: - ibaction
    @IBAction func tabBtnPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            print("0")
        case 1:
            print("1")
        case 2:
            print("2")
//            containView
            
            let galleryVC = storyboard!.instantiateViewController(withIdentifier: "GalleryViewController") as! GalleryViewController
            galleryVC.delegate = self
            addChild(galleryVC)
            galleryVC.view.frame = containView.bounds
            containView.addSubview(galleryVC.view)
            galleryVC.didMove(toParent: self)
        default:
            print("unavailable tag error")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailsContainerViewController : DetailsProtocol {
    func showGalleryWithSelectedIndex(_ selectedIndex: Int) {
        let singlePhotoGalleryVC = storyboard!.instantiateViewController(withIdentifier: "GalleryPhotoViewController") as! GalleryPhotoViewController
        singlePhotoGalleryVC.selectedIndex = selectedIndex
        singlePhotoGalleryVC.modalPresentationStyle = .overCurrentContext
        present(singlePhotoGalleryVC, animated: true, completion: nil)
    }
    
    
}
