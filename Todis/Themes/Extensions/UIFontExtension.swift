//
//  UIFontExtension.swift
//  Todis
//
//  Created by c.pabon.cuellar on 20/04/2020.
//  Copyright © 2020 cristhia.pabon. All rights reserved.
//

import UIKit

public extension UIFont {

    @nonobjc class var defaultRegular: UIFont {
        return UIFont.systemFont(ofSize: 17.0, weight: .regular)
    }

    @nonobjc class var defaultBold: UIFont {
        return UIFont.systemFont(ofSize: 17.0, weight: .bold)
    }

    @nonobjc class var defaultMedium: UIFont {
        return UIFont.systemFont(ofSize: 17.0, weight: .medium)
    }

    @nonobjc class var defaultSemiBold: UIFont {
        return UIFont.systemFont(ofSize: 17.0, weight: .semibold)
    }
//    
//    @nonobjc class var geometricBold: UIFont {
//        return UIFont(name: "URWGeometric-Bold", size: 17.0) ?? UIFont.defaultBold
//    }
//    @nonobjc class var geometricSemiBold: UIFont {
//        return UIFont(name: "URWGeometric-SemiBold", size: 17.0) ?? UIFont.defaultSemiBold
//    }
//    @nonobjc class var geometricRegular: UIFont {
//        return UIFont(name: "URWGeometric-Regular", size: 17.0) ?? UIFont.defaultRegular
//    }
//    
//    // load framework font in application
//    static let loadAllFonts: () = {
//        registerFontWith(filenameString: "URWGeometric-Regular", bundleIdentifierString: "Fonts")
//        registerFontWith(filenameString: "URWGeometric-SemiBold", bundleIdentifierString: "Fonts")
//        registerFontWith(filenameString: "URWGeometric-Bold", bundleIdentifierString: "Fonts")
//        registerFontWith(filenameString: "URWGeometric-Medium", bundleIdentifierString: "Fonts")
//    }()
    
}
