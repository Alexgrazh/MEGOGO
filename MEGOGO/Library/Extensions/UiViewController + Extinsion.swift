//
//  UiViewController + Extinsion.swift
//  MEGOGO
//
//  Created by Alex Grazhdan on 13.02.2023.
//

import UIKit

extension UIViewController {
    
    
    static func instantiate() -> Self{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        return storyboard.instantiateViewController(withIdentifier: "HomeDetailsMovieViewController") as! Self
    }
}
