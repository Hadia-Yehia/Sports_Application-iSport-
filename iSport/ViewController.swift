//
//  ViewController.swift
//  iSport
//
//  Created by Hadia Yehia on 21/05/2023.
//

import UIKit

class ViewController: UIViewController {
    var result : [League]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkService.loadData {[weak self] (result) in
            self?.result = result?.result
            DispatchQueue.main.async {
                print(result?.result?.first?.country_name ?? "no data")
          }
        }
    }


}

