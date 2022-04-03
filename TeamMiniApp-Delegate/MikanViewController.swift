//
//  MikanViewController.swift
//  TeamMiniApp-Delegate
//
//  Created by 近藤米功 on 2022/04/03.
//

import UIKit

class MikanViewController: UIViewController,SaveMikanCountDelegate{
    @IBOutlet weak var MikanCountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func saveMikanCount(mikanCount: Int) {
        MikanCountLabel.text = String(mikanCount)
    }

    @IBAction func tappedMikanEditButton(_ sender: Any) {
        performSegue(withIdentifier: "MikanSegue2", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mikanListViewController = segue.destination as! MikanListViewController
        let mikanCountTop = Int(MikanCountLabel.text ?? "") ?? 0
        mikanListViewController.mikanCount = mikanCountTop
        mikanListViewController.delegate = self
    }
}
