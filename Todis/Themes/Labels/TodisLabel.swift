//
//  TodisLabel.swift
//  Todis
//
//  Created by c.pabon.cuellar on 20/04/2020.
//  Copyright © 2020 cristhia.pabon. All rights reserved.
//

import UIKit

public class TodisLabel: UILabel {
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.fontSizeInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.fontSizeInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.fontSizeInit()
    }
    
    func fontSizeInit(){
        self.font = UIFont.defaultRegular.withSize(17)
    }
}

public class GoldLabel: TodisLabel {
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit(){
        self.textColor = UIColor(rgb: 0xFFD700)
    }
}
