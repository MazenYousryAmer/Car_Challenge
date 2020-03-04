//
//  OverviewViewController.swift
//  Cars
//
//  Created by Mazen on 3/4/20.
//  Copyright © 2020 Mazen. All rights reserved.
//

import UIKit

class OverviewViewController: UIViewController {
    
    //MARK: - iboutler
    @IBOutlet var imgCar: UIImageView!
    
    @IBOutlet var lblModelTitle: UILabel!
    @IBOutlet var lblModel: UILabel!
    @IBOutlet var imgBrand: UIImageView!
    
    @IBOutlet var lblPriceTitle: UILabel!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var lblAvailable: UILabel!
    
    @IBOutlet var lblColorTitle: UILabel!
    @IBOutlet var btnsColor: [UIButton]!
    @IBOutlet var viewColors: UIView!
    
    @IBOutlet var btnDriveTest: UIButton!
    @IBOutlet var btnInterested: UIButton!
    @IBOutlet var btnAppointment: UIButton!
    @IBOutlet var btnQuotation: UIButton!
    
    //MARK: - variable
    var presenter = OverviewPresenter()
    var selectionView: UIView!
    var delegate: DetailsProtocol!

    //MARK: - view methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    
    //MARK: - setup
    func setupView() {
        setupCarImage(photoName: "Gallery_0")
        setupNameView()
        setupPriceView()
        setupColorView()
        setupButtons()
    }
    
    func setupCarImage(photoName: String) {
        imgCar.image = UIImage(named: photoName)
    }
    
    func setupNameView() {
        lblModelTitle.text = "name"
        lblModel.text = presenter.car.carTitle
        imgBrand.image = UIImage(named: presenter.car.carBrand ?? "")
    }
    
    func setupPriceView() {
        lblPriceTitle.text = "price"
        lblPrice.text = "\(String(describing: presenter.car.carPriceUnit ?? "")) \(presenter.car.carPrice ?? 0)"
        if presenter.car.isAvailable ?? true {
            lblAvailable.text = " available "
        }
    }
    
    func setupColorView() {
        lblColorTitle.text = "colors"
        selectionView = UIView(frame: CGRect(x: btnsColor[0].frame.origin.x - 3, y: btnsColor[0].frame.origin.y - 3, width: btnsColor[0].frame.width + 6, height: btnsColor[0].frame.height + 6))
        selectionView.backgroundColor = .clear
        selectionView.layer.borderWidth = 1.0
        selectionView.layer.borderColor = UIColor.white.cgColor
        selectionView.layer.cornerRadius = selectionView.frame.width / 2
        viewColors.addSubview(selectionView)
        viewColors.bringSubviewToFront(selectionView)
        
        for btn in btnsColor {
            btn.layer.cornerRadius = btn.frame.width / 2
        }
    }
    
    func setupButtons() {
        btnDriveTest.setTitle("Test Drive", for: .normal)
        btnDriveTest.layer.borderColor = UIColor.white.cgColor
        btnDriveTest.layer.borderWidth = 1.0
        
        btnInterested.setTitle("Interested", for: .normal)
        btnInterested.layer.borderColor = UIColor.white.cgColor
        btnInterested.layer.borderWidth = 1.0
        
        btnAppointment.setTitle("Sales Appointment", for: .normal)
        btnAppointment.layer.borderColor = UIColor.white.cgColor
        btnAppointment.layer.borderWidth = 1.0
        
        btnQuotation.setTitle("Request a Quotation", for: .normal)
        btnQuotation.layer.cornerRadius = 5.0
    }
    
    //MARK: - animation
    func setSelection(btn: UIButton) {
        UIView.animateKeyframes(withDuration: 0.4, delay: 0, options: .beginFromCurrentState, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.4) {
                self.selectionView.alpha = 0.0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.0) {
                self.selectionView.center.x = btn.center.x
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 1.0) {
                self.selectionView.alpha = 1.0
            }
        })
    }
    
    //MARK: - ibaction
    @IBAction func colorBtnPressed(_ sender : UIButton) {
        setSelection(btn: btnsColor[sender.tag])
        if sender.tag % 2 == 0 {
            setupCarImage(photoName: "Gallery_0")
        }
        else {
            setupCarImage(photoName: "Gallery_1")
        }
    }
    
    @IBAction func testDriveBtnPressed() {
        let alert = UIAlertController(title: nil, message: "test drive button pressed", preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        alert.addAction(actionCancel)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func interestedBtnPressed() {
        let alert = UIAlertController(title: nil, message: "interested button pressed", preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        alert.addAction(actionCancel)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func appointmentBtnPressed() {
        let alert = UIAlertController(title: nil, message: "sales appointment button pressed", preferredStyle: .alert)
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
