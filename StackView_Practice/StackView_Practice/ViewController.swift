//
//  ViewController.swift
//  StackView_Practice
//
//  Created by LEE on 2023/04/12.
//

import UIKit

class ViewController: UIViewController {

    typealias Item = (title: String, des: String, isDesHidden: Bool)
    
    var items: [Item] = (0...100)
        .map{
            Item(title: String($0), des: "description by \($0)", isDesHidden: true)
        }
        
    
    let tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .white
        view.separatorStyle = .none
        view.translatesAutoresizingMaskIntoConstraints = false
        view.rowHeight = 50
        view.bounces = true
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.register(Cell.self, forCellReuseIdentifier: Cell.identifier)
        tableView.delegate = self
        tableView.dataSource = self

        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifier) as! Cell
        
        cell.titleLabel.text = items[indexPath.row].title
        cell.desLabel.text = items[indexPath.row].des
        cell.desLabel.isHidden = items[indexPath.row].isDesHidden
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        items[indexPath.row].isDesHidden.toggle()
//        tableView.reconfigureRows(at: [IndexPath(row: indexPath.row, section: 0)])
        tableView.reloadRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .automatic)
    }
    
    
}
