//
//  CustomLabel.swift
//  Bartender
//
//  Created by Guillermo Alonso on 10/10/16.
//  Copyright © 2016 cep.UNAMMemosCorp. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        self.font = UIFont(name: "WaltDisneyScript", size: 25.0)
        super.drawRect(rect)
    }


}
