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
        setupSelectionView()
//        showSelectedTab(btn: btnTabs[0])
    }
    
    func setupLocalization() {
        navigationItem.title = "\(presenter.car.carTitle ?? "") details"
        btnTabs[0].setTitle("Overview", for: .normal)
        btnTabs[1].setTitle("Specs & Features", for: .normal)
        btnTabs[2].setTitle("Gallery", for: .normal)
    }
    
    func setupSelectionView() {
        tabsViewSelection.frame = CGRect(x: tabsView.frame.origin.x + 10, y: tabsView.frame.height + tabsView.frame.origin.y , width: btnTabs[0].frame.width , height: 1)
    }
    
    //MARK: - animation
    func showSelectedTab(btn: UIButton) {
        UIView.animate(withDuration: 0.3, animations: {
            self.tabsViewSelection.center.x = btn.center.x + 10
//            self.tabsViewSelection.frame = btn.frame
        })
    }
    
    //MARK: - ibaction
    @IBAction func tabBtnPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            showSelectedTab(btn: btnTabs[0])
            let overviewVC = storyboard!.instantiateViewController(withIdentifier: "OverviewViewController") as! OverviewViewController
            overviewVC.presenter = OverviewPresenter()
            overviewVC.presenter.car = presenter.car
            overviewVC.delegate = self
            addChild(overviewVC)
            overviewVC.view.frame = containView.bounds
            containView.addSubview(overviewVC.view)
            overviewVC.didMove(toParent: self)
        case 1:
            showSelectedTab(btn: btnTabs[1])
//            SpecsViewController
            let specsVC = storyboard!.instantiateViewController(withIdentifier: "SpecsViewController") as! SpecsViewController
            specsVC.presenter = SpecsPresenter()
            specsVC.presenter.car = presenter.car
            specsVC.delegate = self
            addChild(specsVC)
            specsVC.view.frame = containView.bounds
            containView.addSubview(specsVC.view)
            specsVC.didMove(toParent: self)
        case 2:
            showSelectedTab(btn: btnTabs[2])
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
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "OverviewViewController" {
            if let vc = segue.destination as? OverviewViewController {
                let overviewPresenter = OverviewPresenter()
                overviewPresenter.car = self.presenter.car
                vc.presenter = overviewPresenter
            }
        }
    }
 

}

extension DetailsContainerViewController : DetailsProtocol {
    func showGalleryWithSelectedIndex(_ selectedIndex: Int) {
        let singlePhotoGalleryVC = storyboard!.instantiateViewController(withIdentifier: "GalleryPhotoViewController") as! GalleryPhotoViewController
        singlePhotoGalleryVC.selectedIndex = selectedIndex
        singlePhotoGalleryVC.modalPresentationStyle = .overCurrentContext
        singlePhotoGalleryVC.modalTransitionStyle = .crossDissolve
        present(singlePhotoGalleryVC, animated: true, completion: nil)
    }
    
    
}
