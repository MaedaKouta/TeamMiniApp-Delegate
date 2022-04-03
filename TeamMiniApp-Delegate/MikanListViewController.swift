//
//  MikanListViewController.swift
//  TeamMiniApp-Delegate
//
//  Created by 近藤米功 on 2022/04/03.
//

import UIKit
protocol SaveMikanCountDelegate{
    func saveMikanCount(mikanCount: Int)
}

class MikanListViewController: UIViewController {
    
    public var mikanCount: Int = 0
    public var delegate: SaveMikanCountDelegate?
    private var mikanList: [String] = []
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        for _ in 0..<mikanCount{
            mikanList.append("みかん")
        }
    }
    
    @IBAction private func tappedMikanCountSaveButton(_ sender: Any) {
        delegate?.saveMikanCount(mikanCount: mikanList.count)
        // dismiss(animated: true, completion: nil) // なぜか一つ前の画面に戻れない。下記のpopView~で対処
        navigationController?.popViewController(animated: true)
    }
    
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MikanTableViewCell", bundle: nil), forCellReuseIdentifier: "MikanCell")
    }
}
extension MikanListViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mikanList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MikanCell", for: indexPath) as! MikanTableViewCell
        cell.mikanLabel.text = "みかん"
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                mikanList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
