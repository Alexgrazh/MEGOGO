//
//  UIImageView +Extension.swift
//  MEGOGO
//
//  Created by Alex Grazhdan on 21.01.2023.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
}
