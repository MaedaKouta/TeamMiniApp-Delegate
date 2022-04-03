//
//  MikanViewController.swift
//  TeamMiniApp-Delegate
//
//  Created by 近藤米功 on 2022/04/03.
//

// TODO: viewDidLoadにmikanListViewController.delegate = selfと書いてデリゲートメソッドを発動させたいが、それができない。。

import UIKit

class MikanViewController: UIViewController {
    @IBOutlet private weak var MikanCountLabel: UILabel!
    // var mikanListViewController = MikanListViewController() // 1:これだと値の受け渡しができない。なぜ。。
    override func viewDidLoad() {
        super.viewDidLoad()
        // mikanListViewController.delegate = self
    }

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
extension MikanViewController: SaveMikanCountDelegate{
    // SaveMikanCountDelegateのデリゲートメソッド
    func saveMikanCount(mikanCount: Int) {
        MikanCountLabel.text = String(mikanCount) // 2:これだと値の受け渡しができない。なぜ。。
    }
}
