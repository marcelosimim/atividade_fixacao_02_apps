//
//  User.swift
//  Atv2Apps
//
//  Created by Marcelo Simim on 20/09/21.
//

import Foundation
import UIKit

struct User{
    let name: String
    let email: String
    let imageIndex: Int
    
    func getImage()->UIImage{
        let imageProfile = ImageProfile()
        return imageProfile.images[imageIndex]
    }
}
