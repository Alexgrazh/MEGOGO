//
//  File.swift
//  MEGOGO
//
//  Created by Alex Grazhdan on 03.02.2023.
//

import Foundation


class Account : NSObject {
    var nameCell : String = ""
    
    static var shared = Account()
    var data = [String]()
    
    func withtestdatas(){
            
        data = ["Передплати","Подарунки","Батьківський контроль","Мої пристрої","Ваша підтрімка"]
    }
    
}



