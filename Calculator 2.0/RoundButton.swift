//
//  RoundButton.swift
//  Calculator 2.0
//
//  Created by Дарья Бирюкова on 06.07.2022.
//

import UIKit
@IBDesignable

class RoundButton: UIButton {


    @IBInspectable var roundButton: Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }

}
