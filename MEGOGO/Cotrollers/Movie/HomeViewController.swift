//
//  ViewController.swift
//  MEGOGO
//
//  Created by Alex Grazhdan on 19.01.2023.
//

import UIKit
import Alamofire
import SDWebImage
class HomeViewController: UIViewController {

    
    //MARK: - IBOutlets
    
    @IBOutlet weak var collectionViewOne: UICollectionView!
    @IBOutlet weak var CollectionViewTwo: UICollectionView!
    
    @IBOutlet weak var buttonGenres: UIButton!
    @IBOutlet weak var buttonSorted: UIButton!
    
    var arrayOfImage : [Results] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - CollectionView
        collectionViewOne.delegate = self
        collectionViewOne.dataSource = self
        CollectionViewTwo.delegate = self
        CollectionViewTwo.dataSource = self
        CollectionViewTwo.collectionViewLayout = UICollectionViewFlowLayout()
        loadPosterImage()
        configure()
    }

    func configure(){
        buttonGenres.layer.cornerRadius = 10
        buttonSorted.layer.cornerRadius = 10
    }

}


//MARK: - CollctionView delegate

extension HomeViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(arrayOfImage[indexPath.row])

    }

}

//MARK: - CollctionView dataSourse

extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewOne{
            return arrayOfImage.count
        }
        
        return arrayOfImage.count
    }
    
    func loadPosterImage(){
        let url = URL(string:"https://api.themoviedb.org/3/trending/movie/week?api_key=3e6e13b4af65d55eed217ca311dfc41e")
        
        AF.request(url!).responseJSON { responseJSON in
            
            let decoder = JSONDecoder()
            guard let responseData = responseJSON.data else {return}
            
            do{
                let data = try decoder.decode(PosterHome.self, from: responseData)
                self.arrayOfImage = data.results!
                print(self.arrayOfImage = data.results!)
                self.collectionViewOne.reloadData()
                self.CollectionViewTwo.reloadData()
            }catch{
                print("error ")
            }
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView{
            
        case collectionViewOne
            : let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
            cell.setup(with: arrayOfImage[indexPath.row])
            return cell
            
            
        case CollectionViewTwo :  let cell = CollectionViewTwo.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
            cell.setup(with: arrayOfImage[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
}
    extension HomeViewController : UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 120, height: 200)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 25
        }
    }
    
    

