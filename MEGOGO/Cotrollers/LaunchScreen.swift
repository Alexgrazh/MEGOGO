//
//  LaunchScreen.swift
//  MEGOGO
//
//  Created by Alex Grazhdan on 13.02.2023.
//

import UIKit


class LaunchScreen: UIViewController {
    
    var  imageView : UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 240, height: 168))
        imageView.image = UIImage(named: "Megogo_Logo")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+20) {
            self.animation()
        }
        
    }
    
    func animation(){
        UIView.animate(withDuration: 1) {
            let size = self.view.frame.size.width * 2
            let xposition = size - self.view.frame.width
            let yposition = self.view.frame.height - size
            
            self.imageView.frame = CGRect(x: -(xposition/2), y: yposition/2, width: size, height: size)
            self.imageView.alpha = 0
        }
    }
    
}
