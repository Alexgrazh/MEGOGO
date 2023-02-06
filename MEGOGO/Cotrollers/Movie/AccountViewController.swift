//
//  AccountViewController.swift
//  MEGOGO
//
//  Created by Alex Grazhdan on 28.01.2023.
//

import UIKit

class AccountViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    private let cellsName = Account.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
        cellsName.withtestdatas()
    }

}








//MARK: -  extension UITableViewDelegate

extension AccountViewController : UITableViewDelegate {
    
}

//MARK: -  extension UITableViewDataSource

extension AccountViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsName.data.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AccountTableViewCell
        cell.lableText.text = cellsName.data[indexPath.row]

        
        return cell
    }
    
    
}
