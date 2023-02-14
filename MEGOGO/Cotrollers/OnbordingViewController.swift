//
//  OnbordingViewController.swift
//  MEGOGO
//
//  Created by Alex Grazhdan on 06.02.2023.
//

import UIKit

class OnbordingViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    
    
    var slidesArray : [OnbordingSlide] = [OnbordingSlide(title: "Дивись звідки завгодно", discription: "Без обмежень. Зі смартфонів та планшетів,підключених до стільникового зв'язку та Wi-Fi", image: UIImage(named: "мегого5") ?? UIImage()),OnbordingSlide(title: "Тільки самі свіжі новинки", discription: "І про боротьбу зі злом, і про супергероїв, містичні загадки, давні артефакти вже чекають на вас", image: UIImage(named: "мегого4") ?? UIImage())]
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage ==  slidesArray.count - 1 {
                nextButton.setTitle("Get started", for: .normal)
            }else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       configure()
   
    }
 
    //MARK: - IBAction
  
    @IBAction func buttonPrassed(_ sender: Any) {
        
        if currentPage == slidesArray.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "TabBarHome") as!  UITabBarController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    //MARK: - Method
    func configure(){
      nextButton.layer.cornerRadius = 10
    }
    
}

//MARK: - UICollectionViewDelegate

extension OnbordingViewController: UICollectionViewDelegate {
    
}

//MARK: - UICollectionViewDataSource

extension OnbordingViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slidesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnbordingCollectionViewCell.Identifier, for: indexPath) as! OnbordingCollectionViewCell
        
        cell.setup(with: slidesArray[indexPath.row])
        
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension OnbordingViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}

