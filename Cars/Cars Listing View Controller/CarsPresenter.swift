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
