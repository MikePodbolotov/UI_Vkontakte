//
//  GradientView.swift
//  UI_Vkontakte
//
//  Created by Михаил Подболотов on 17.01.2021.
//

import UIKit

@IBDesignable
class GradientView: UIView {

    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.3375923038, green: 0.7577283978, blue: 0.9999999404, alpha: 1) {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1) {
        didSet {
            setNeedsLayout()
        }
    }
    
    override func draw(_ rect: CGRect) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }

}
