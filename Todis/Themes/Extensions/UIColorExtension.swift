//
//  UIColorExtension.swift
//  Todis
//
//  Created by c.pabon.cuellar on 20/04/2020.
//  Copyright © 2020 cristhia.pabon. All rights reserved.
//

import UIKit

public extension UIColor {
    
    //------------------------------------
    //MARK: Method to use HEX color values
    //------------------------------------
    //MARK: 1. Without Alpha
    convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
    }
    
    //MARK: Usage
    //let color = UIColor(red: 0xFF, green: 0xFF, blue: 0xFF)
    //let color2 = UIColor(rgb: 0xFFFFFF)
    
    //MARK: 2. With Alpha
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }

    convenience init(rgb: Int, a: CGFloat = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            a: a
        )
    }
    
    //MARK: Usage
    //let color = UIColor(red: 0xFF, green: 0xFF, blue: 0xFF, a: 0xFF)
    //let color2 = UIColor(argb: 0xFFFFFFFF)
    
    //------------------------------------
    //MARK: End of Methods
    //------------------------------------
}
