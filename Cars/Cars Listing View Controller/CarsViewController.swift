//
//  ViewController.swift
//  Cars
//
//  Created by Mazen on 3/2/20.
//  Copyright © 2020 Mazen. All rights reserved.
//

import UIKit

class CarsViewController: UIViewController {

    //MARK: - iboutlet
    @IBOutlet var tableCar: UITableView!
    
    //MARK: - variable
    var presenter = CarsPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.populateCars()
        // Do any additional setup after loading the view.
    }
}

extension CarsViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.arrCars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarTableViewCell") as! CarTableViewCell
        cell.configureCell(car: presenter.arrCars[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = presenter.arrCars[indexPath.row]
        self.performSegue(withIdentifier: "DetailsContainerViewController", sender: model)
    }
    
    //MARK: - navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsContainerViewController" {
            if let vc = segue.destination as? DetailsContainerViewController {
                let detailsPresenter = DetailsPresenter()
                detailsPresenter.car = sender as! CarModel
                vc.presenter = detailsPresenter
            }
        }
    }
    
    
}



