//
//  ViewController.swift
//  iSport
//
//  Created by Hadia Yehia on 21/05/2023.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var homeCollectionView: UICollectionView!
    var result : [League]!
    var names = ["Football","Basketball","Tennis","Cricket"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        // Do any additional setup after loading the view.

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width*0.45), height: collectionView.bounds.width*0.7)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    

   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        cell.homeCellImg.image = UIImage(named: names[indexPath.row].lowercased())
        cell.homeCellLabel.text = names[indexPath.row]
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        if NetworkReachability.sharedInstance.check(){
            let leaguesVC = self.storyboard?.instantiateViewController(withIdentifier: "AllLeaguesViewController") as! AllLeaguesViewController
                        leaguesVC.game = self.names[indexPath.row].lowercased()
                     self.navigationController?.pushViewController(leaguesVC, animated: true)
        }else{
            let alert = UIAlertController(title: "Network issue", message: "No connection", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
    
        }
    }
   
    


}

