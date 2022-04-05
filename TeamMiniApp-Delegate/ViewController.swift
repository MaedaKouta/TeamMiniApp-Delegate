//
//  ViewController.swift
//  TeamMiniApp-Delegate
//
//  Created by 前田航汰 on 2022/04/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
    @IBAction func tappedMikanEditButton(_ sender: Any) {
        performSegue(withIdentifier: "MikanSegue", sender: nil)
    }
  
}

