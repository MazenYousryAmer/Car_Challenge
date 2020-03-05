//
//  SpecsViewController.swift
//  Cars
//
//  Created by Mazen on 3/5/20.
//  Copyright © 2020 Mazen. All rights reserved.
//

import UIKit

class SpecsViewController: UIViewController {

    //MARK: - iboutlet
    @IBOutlet var lblSpecficationsTitle: UILabel!
    
    @IBOutlet var lblPowerTitle: UILabel!
    @IBOutlet var lblPower: UILabel!
    @IBOutlet var lblEngineTitle: UILabel!
    @IBOutlet var lblEngine: UILabel!
    
    @IBOutlet var lblCityTitle: UILabel!
    @IBOutlet var lblCity: UILabel!
    @IBOutlet var lblhighwayTitle: UILabel!
    @IBOutlet var lblhighway: UILabel!
    
    @IBOutlet var lblDriveTypeTitle: UILabel!
    @IBOutlet var lblDriveType: UILabel!
    
    @IBOutlet var lblSpecsDetailsTitle: UILabel!
    @IBOutlet var btnSpecsDetails: UIButton!
    
    @IBOutlet var lblGearBoxTitle: UILabel!
    @IBOutlet var lblGearBox: UILabel!
    
    @IBOutlet var lblGearTypeTitle: UILabel!
    @IBOutlet var lblGearType: UILabel!
    
    @IBOutlet var lblCapacityTitle: UILabel!
    @IBOutlet var lblCapacity: UILabel!
    @IBOutlet var btnQuotation: UIButton!
    
    //MARK: - vairable
    var presenter = SpecsPresenter()
    var delegate: DetailsProtocol!
    
    //MARK:- view methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    //MARK: - setup
    func setupView() {
        setupSpecs()
        setupData()
    }
    
    
    func setupSpecs() {
        
        lblSpecficationsTitle.text = "Specifications"
        lblPowerTitle.text = "Power"
        lblPower.text = "\(presenter.car.carPower ?? 0)"
        
        lblEngineTitle.text = "Engine"
        lblEngine.text = "\(presenter.car.carEngine ?? 0)"
        
        lblCityTitle.text = "City MPG"
        lblCity.text = "\(presenter.car.carCity ?? 0)"
        
        lblhighwayTitle.text = "Highway MPG"
        lblhighway.text = "\(presenter.car.carhighway ?? 0)"
        
        lblDriveTypeTitle.text = "Drive type"
        lblDriveType.text = presenter.car.carDriveType
        
        lblSpecsDetailsTitle.text = "Technical specs"
        btnSpecsDetails.setTitle("Details", for: .normal)
        btnSpecsDetails.layer.cornerRadius = btnSpecsDetails.frame.height / 2
    }
    
    func setupData() {
        lblGearBoxTitle.text = "Gear box"
        lblGearBox.text =  "\(presenter.car.carGearBox ?? 0)"
        
        lblGearTypeTitle.text = "Drive type"
        lblGearType.text = presenter.car.carDriveType
        
        lblCapacityTitle.text = "Seat Capacity"
        lblCapacity.text = "\(presenter.car.carCapacity ?? 0)"
        
        btnQuotation.setTitle("Request a Quotation", for: .normal)
        btnQuotation.layer.cornerRadius = 5.0
    }
    
    //MARK: - ibaction
    @IBAction func detailsBtnPressed() {
        let alert = UIAlertController(title: nil, message: presenter.car.carDescription, preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        alert.addAction(actionCancel)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func quotationBtnPressed() {
        let alert = UIAlertController(title: nil, message: "request a quotation button pressed", preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        alert.addAction(actionCancel)
        present(alert, animated: true, completion: nil)
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
