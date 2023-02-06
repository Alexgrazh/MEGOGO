//
//  UIView + Extention.swift
//  MEGOGO
//
//  Created by Alex Grazhdan on 06.02.2023.
//

import UIKit

extension UIView {
@IBInspectable var cornerRadius : CGFloat{
        get{ return cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
