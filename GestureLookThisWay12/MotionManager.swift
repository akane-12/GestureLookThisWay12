//
//  MotionManager.swift
//  MotionAppSample12
//
//  Created by cmStudent on 2022/08/04.
//

import Foundation
import CoreMotion

final class MotionManager: NSObject {
    
    private override init(){}
    static let shared: MotionManager = .init()
    private let motion = CMMotionManager()
    private let queue = OperationQueue()
    
    
    func startQueueUpdates(handler: @escaping (Double, Double, Double) -> () ) {
        guard motion.isDeviceMotionAvailable else { return }
        
        // 更新間隔
        self.motion.deviceMotionUpdateInterval = 0.3
        // おまじな
        self.motion.showsDeviceMovementDisplay = true
        
        self.motion.startDeviceMotionUpdates(using: .xMagneticNorthZVertical, to: queue) { data, error in
            if let validData = data {
                            
                DispatchQueue.main.async {
                    handler(validData.rotationRate.x, validData.rotationRate.y, validData.rotationRate.z)
                    
                }
            }
        }
    }
}



