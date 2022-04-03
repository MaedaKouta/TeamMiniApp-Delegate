//
//  TamagoTopViewController.swift
//  TeamMiniApp-Delegate
//
//  Created by 前田航汰 on 2022/04/01.
//

import UIKit

struct FoodItem {
    let food: String
    var number: Int
}

class TamagoTopViewController: UIViewController, TamagoDeletionViewControllerDelegate {

    private(set) var foodItem: FoodItem = .init(food: "みかん", number: 100)
    @IBOutlet private weak var countLabel: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        countLabel.text = String(foodItem.number)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextVC" {
            let nextVC = segue.destination as! TamagoDeletionViewController
            nextVC.delegate = self
            nextVC.congigure(item: foodItem)
        }
    }

    func set(number: Int) {
        foodItem.number = number
        self.navigationController?.popViewController(animated: true)
    }

}
