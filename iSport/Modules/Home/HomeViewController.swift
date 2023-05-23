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
        cell.homeCellImg.image = UIImage(named: "pngegg")
        cell.homeCellLabel.text = names[indexPath.row]
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let leaguesVC = storyboard?.instantiateViewController(withIdentifier: "AllLeaguesViewController") as! AllLeaguesViewController
        leaguesVC.game = names[indexPath.row].lowercased()
        //getData(game: names[indexPath.row].lowercased())
//        NetworkService.loadData(game: names[indexPath.row].lowercased()) {[weak self] (result) in
//                    self?.result = result?.result
//                    DispatchQueue.main.async {
//                        print(result?.result?.first?.country_name ?? "no data")
//                        leaguesVC.gameLeagues = self?.result ?? Array<League>()
//                        leaguesVC.allLeaguesTable.reloadData()
//                        
//                  }
//                }
        
        navigationController?.pushViewController(leaguesVC, animated: true)
    }
   
    


}

