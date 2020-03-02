//
//  CarTableViewCell.swift
//  Cars
//
//  Created by Mazen on 3/2/20.
//  Copyright © 2020 Mazen. All rights reserved.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    
    @IBOutlet var imgCar: UIImageView!
    @IBOutlet var lblCarDescription: UILabel!
    @IBOutlet var lblCarPrice: UILabel!
    @IBOutlet var viewCarContainer: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(car: CarModel) {
        viewCarContainer.layer.cornerRadius = 10
        lblCarDescription.text = car.carDescription
        lblCarPrice.text = "\(String(describing: car.carPriceUnit ?? "")) \(car.carPrice ?? 0)"
        imgCar.image = UIImage(named: car.carPhoto!)
    }

}
