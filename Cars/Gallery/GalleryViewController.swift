//
//  GalleryViewController.swift
//  Cars
//
//  Created by Mazen on 3/3/20.
//  Copyright © 2020 Mazen. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {

    //MARK: - iboutlets
    @IBOutlet var tableGallery: UITableView!
    
    //MARK: - variable
    var delegate: DetailsProtocol!
    
    //MARK: - view methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        tableGallery.reloadData()
    }
    
}

extension GalleryViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GalleryTableViewCell") as! GalleryTableViewCell
        if indexPath.row % 2 == 0 {
            cell.imgGallery.image = UIImage(named: "Gallery_0")
        }
        else {
            cell.imgGallery.image = UIImage(named: "Gallery_1")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.showGalleryWithSelectedIndex(indexPath.row)
    }
}
