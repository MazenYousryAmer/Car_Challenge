//
//  CarsPresenter.swift
//  Cars
//
//  Created by Mazen on 3/2/20.
//  Copyright © 2020 Mazen. All rights reserved.
//

import UIKit

class CarsPresenter: NSObject {
    
    var arrCars: [CarModel] = []
    
    func populateCars() {
        arrCars = []
        var car = CarModel()
        for index in 1..<10 {
            car.carTitle = "car \(index)"
            car.carDescription = "this is only a test for the description of car \(index) this is only a test for the description of car \(index)"
            car.carPrice = 100000
            car.carPriceUnit = "SAR"
            car.carBrand = "brand"
            car.carGearBox = 15
            car.carDriveType = "Auto"
            car.carCapacity = 1
            car.carPower = 30
            car.carEngine = 2000
            car.carCity = 40
            car.carhighway = 30
            car.isAvailable = true
            if index % 2 == 0 {
                car.carPhoto = "Gallery_0"
            }
            else {
                car.carPhoto = "Gallery_1"
            }
            arrCars.append(car)
            car = CarModel()
        }
    }

}
