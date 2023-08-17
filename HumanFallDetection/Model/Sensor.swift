//
//  Sensor.swift
//  HumanFallDetection Watch App
//
//  Created by Hsunwen Fang on 2023/8/16.
//

import Foundation
import CoreMotion

class Sensor: Identifiable{
    var id: UUID
    let manager = CMMotionManager()
    
    init(id: UUID, interval: Double) {
        self.id = id
        self.manager.accelerometerUpdateInterval = interval
        self.manager.startAccelerometerUpdates()
    }
    
    func getAcceleration() -> [Double?]{
        return [manager.accelerometerData?.acceleration.x, manager.accelerometerData?.acceleration.y]
    }
}
