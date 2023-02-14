//
//  HomeGenresViewController.swift
//  MEGOGO
//
//  Created by Alex Grazhdan on 24.01.2023.
//

import UIKit
import Alamofire

class HomeGenresViewController: UIViewController {

    //MARK: - IBOutlet
  
  
    @IBOutlet weak var tableView: UITableView!
    
    var arrayGenres : [Genres] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        //tableView.register(HomeGenresTableViewCell.self, forCellReuseIdentifier: "cell")
        setupDataGenres()
    }
    

}



//MARK: - Extention UITablViewDelegate

extension HomeGenresViewController : UITableViewDelegate {
    
    
}

//MARK: - Extention UITablViewDataSource

extension HomeGenresViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayGenres.count
    }
    
    func setupDataGenres(){
        
        let  url = "https://api.themoviedb.org/3/genre/movie/list?api_key=3e6e13b4af65d55eed217ca311dfc41e&language=en-US"
        
        AF.request(url).responseJSON { response in
            print(response)
            
            let decoder = JSONDecoder()
            guard let responseData = response.data else{return}
            
            do{
                let data = try decoder.decode(GenresResults.self, from: responseData)
                
                DispatchQueue.main.async {
                    self.arrayGenres = data.genres ?? []
                    self.tableView.reloadData()
                }
            }catch{
                print("error : \(error)")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeGenresTableViewCell

        cell.genreText.text = arrayGenres[indexPath.row].name
        
        
        return cell
    }
    
    
    
}

//MARK: - Extention UITablViewDataSource
