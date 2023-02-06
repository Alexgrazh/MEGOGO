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

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell else {return UITableViewCell()}
        
//        cell.setup(with: arrayOfFilms[indexPath.row])
//        cell.nameMove.text = arrayOfFilms[indexPath.row].title ?? ""
//        cell.overviewMove.text = arrayOfFilms[indexPath.row].overview ?? ""
        cell.setup(with: arrayOfFilms[indexPath.row])
        
        return cell
    }
    
    
}

extension MovieViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(arrayOfFilms[indexPath.row])
        let data = arrayOfFilms[indexPath.row]
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let vc = main.instantiateViewController(withIdentifier: "cell") as? HomeDetailsMovieViewController {
            navigationController?.pushViewController(vc, animated: true)

            vc.imageView = data.poster_path ?? ""
            vc.nameFilm = data.title ?? ""
            vc.override = data.overview ?? ""
            vc.id = data.id ?? 0

        }
    }
    
}
