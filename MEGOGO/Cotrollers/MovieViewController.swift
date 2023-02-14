//
//  MovieViewController.swift
//  MEGOGO
//
//  Created by Alex Grazhdan on 26.01.2023.
//

import UIKit
import Alamofire
import SDWebImage

class MovieViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    var arrayOfFilms: [Results] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPosterFilm()
        let nib = UINib(nibName: "MovieTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "MovieTableViewCell")
        
    }
    
    
}

//MARK: - TablenView dataSourse

extension MovieViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfFilms.count
    }
    
    
    func loadPosterFilm(){
        let url = URL(string:"https://api.themoviedb.org/3/trending/movie/week?api_key=3e6e13b4af65d55eed217ca311dfc41e")
        
        AF.request(url!).responseJSON { [weak self] responseJSON in
            guard let self = self else {return}
            let decoder = JSONDecoder()
            guard let responseData = responseJSON.data else {return}
            do{
                let data = try decoder.decode(PosterHome.self, from: responseData)
                DispatchQueue.main.async{
                    self.arrayOfFilms = data.results!
                    self.tableView.reloadData()
                }
                
            }catch{
                print("error ")
            }
        }
    }
    
    func loadDetails(){
        
        let url = ""
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell else {return UITableViewCell()}
        
        cell.setup(with: arrayOfFilms[indexPath.row])
        
        return cell
    }
}

extension MovieViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = arrayOfFilms[indexPath.row]
        let controller = HomeDetailsMovieViewController.instantiate()
        controller.imageView = data.poster_path ?? ""
        controller.nameFilm = data.title ?? ""
        controller.override = data.overview ?? ""
        //        controller.yearsMovie = data.release_date ?? ""
        //        controller.countryMoive = data.media_type ?? ""
        //        controller.hourseMovie = data.vote_count ?? 0
        controller.id = data.id ?? 0
        self.navigationController?.pushViewController( controller, animated: true)
    }
    
}
