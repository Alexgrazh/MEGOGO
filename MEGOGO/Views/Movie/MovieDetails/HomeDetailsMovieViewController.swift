//
//  HomeDetailsMovieViewController.swift
//  MEGOGO
//
//  Created by Alex Grazhdan on 26.01.2023.
//

import UIKit
import Alamofire
import SDWebImage

class HomeDetailsMovieViewController: UIViewController {

//MARK: - IBOutlets
    @IBOutlet weak var posterVideo: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var infoMovie: UILabel!
    
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var hourse: UILabel!
    
    
    var imageView = ""
    var nameFilm = ""
    var override = ""
    var yearsMovie = 0
    var countryMoive = ""
    var hourseMovie = 0
    var id = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        loadData()
        configure()
        
        
    }
    
    func configure(){
        loadImage(path: imageView)
        movieName.text = nameFilm
        infoMovie.text = override
    }
    
    
    
    
    
    
    
    
    
    
    
//    func loadData(){
//
//        let url = "https://api.themoviedb.org/\(id)movie/3?api_key=3e6e13b4af65d55eed217ca311dfc41e&language=en-US"
//
//        AF.request(url).responseJSON {  response in
//
//            let decoder = JSONDecoder()
//            guard let resposneData = response.data else {return}
//            do{
//                let data = try decoder.decode(.self, from: resposneData)
//
//            }catch{
//                print("error")
//            }
//        }
//
//    }
    
    
    func loadImage(path: String){
        
        let imageURLString = "https://image.tmdb.org/t/p/w500" + path
        let imageURL = URL(string: imageURLString)
        posterVideo.sd_setImage(with: imageURL)
    }
    
//    func configure(with data: Results){
//        posterVideo.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(data.poster_path ?? "")"))
//        movieName.text = data.title
//    }
    
}
