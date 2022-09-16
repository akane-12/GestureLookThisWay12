//
//  AudioManager.swift
//  GestureLookThisWay12
//
//  Created by cmStudent on 2022/09/10.
//

import Foundation
import AVFoundation
import UIKit

struct AudioManager {
    
    let systemSound = try! AVAudioPlayer(data: NSDataAsset(name: "maou_system_37")!.data)

    let backSound = try! AVAudioPlayer(data: NSDataAsset(name: "maou_system_25")!.data)
    
    let poyoSound = try! AVAudioPlayer(data: NSDataAsset(name: "maou_system_10")!.data)
    
    let winSound =  try! AVAudioPlayer(data: NSDataAsset(name: "maou_zinguru_6")!.data)
    
    let loseSound =  try! AVAudioPlayer(data: NSDataAsset(name: "maou_onepoint_31")!.data)
    
    let cymbalSaund = try! AVAudioPlayer(data: NSDataAsset(name: "maou_sinbaru")!.data)


}
