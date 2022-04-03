//
//  TamagoDeletionViewController.swift
//  TeamMiniApp-Delegate
//
//  Created by 前田航汰 on 2022/04/01.
//

import UIKit

protocol TamagoDeletionViewControllerDelegate: AnyObject {
    func set(number: Int)
}

class TamagoDeletionViewController: UIViewController{

    @IBOutlet private weak var tableView: UITableView!
    private var foodItem: FoodItem?
    weak var delegate: TamagoDeletionViewControllerDelegate?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    @IBAction func didTapSaveButton(_ sender: Any){
        delegate?.set(number: foodItem?.number ?? 0)
    }

    // カプセル化したrowsNumeberの操作
    func congigure(item: FoodItem) {
        foodItem = .init(food: item.food, number: item.number)
    }

}

extension TamagoDeletionViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        foodItem?.number ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTamago", for: indexPath)
        cell.textLabel?.text = foodItem?.food
        return cell
    }

    // 横スクロール削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            foodItem?.number -= 1
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

}
