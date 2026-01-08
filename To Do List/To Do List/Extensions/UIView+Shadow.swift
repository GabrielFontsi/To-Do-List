//
//  UIView+Shadow.swift
//  To Do List
//
//  Created by Gabriel Fontenele on 06/01/26.
//

import UIKit

extension UIView {
    
    func setCardShadow() {
            layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
            layer.shadowOpacity = 0.5
            layer.shadowOffset = CGSize(width: 0, height: 3)
            layer.shadowRadius = 4
            layer.shouldRasterize = true
            layer.masksToBounds = false
            layer.rasterizationScale = UIScreen.main.scale
        }
}
