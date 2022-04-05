//
//  MikanViewController.swift
//  TeamMiniApp-Delegate
//
//  Created by 近藤米功 on 2022/04/03.
//

import UIKit

class MikanViewController: UIViewController {
    @IBOutlet private weak var MikanCountLabel: UILabel!
    @IBAction private func tappedMikanEditButton(_ sender: Any) {
        // MikanListViewControllerへの画面遷移
        performSegue(withIdentifier: "MikanSegue2", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mikanListViewController = segue.destination as! MikanListViewController
        // MikanViewController→MikanListViewControllerに画面遷移しながらmikanCountを渡す
        let mikanCountTop = Int(MikanCountLabel.text ?? "") ?? 0
        mikanListViewController.mikanCount = mikanCountTop
        mikanListViewController.delegate = self
    }
}
extension MikanViewController: MikanListViewControllerDelegate{
    // SaveMikanCountDelegateのデリゲートメソッド
    func saveMikanCount(mikanCount: Int) {
        MikanCountLabel.text = String(mikanCount)
    }
}
