//
//  ImageProfile.swift
//  Atv2Apps
//
//  Created by Marcelo Simim on 20/09/21.
//

import Foundation
import UIKit

struct ImageProfile {
    let images = [ #imageLiteral(resourceName: "teacherwomanavatar_maestro_muje_2834"), #imageLiteral(resourceName: "head_medical_man_avatar_person_2837"), #imageLiteral(resourceName: "supermanavatar_superhombr_2825"), #imageLiteral(resourceName: "teacher_man_avatar_person_2836")]
    var imageIndex = 0
    
    mutating func nextImage(){
        if imageIndex+1 < (images.count) {
            imageIndex += 1
        }else{
            imageIndex = 0
        }
    }
    
    mutating func previousImage(){
        if imageIndex-1 >= 0{
            imageIndex -= 1
        }else{
            imageIndex = images.count-1
        }
    }
}
