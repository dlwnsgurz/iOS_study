//
//  ViewController.swift
//  UITableView_DiffableDataSource
//
//  Created by LEE on 2023/02/20.
//

import UIKit

class ListViewController: UITableViewController {

    var stringList: [String] = {
        var str = [String]()
        for x in 0...8{
            str.append("\(x)번째 셀 입니다.")
        }
        return str
    }()
    
    enum Section: CaseIterable{
        case main
    }
    
    var dataSource: UITableViewDiffableDataSource<Section, String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(stringList)
        
        dataSource = UITableViewDiffableDataSource<Section, String>(tableView: tableView){(tableView, indexPath, itemIdentifier) in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
            cell.textLabel?.text = self.stringList[indexPath.row]
            cell.textLabel?.font = .systemFont(ofSize: 20)
            
            return cell
        }

        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.stringList.count
    }

    
    @IBAction func change(_ sender: Any) {
    
        var snapShot = NSDiffableDataSourceSnapshot<Section, String>()
        
        snapShot.appendSections([.main])
        
        var temp = [String]()
        temp = stringList.shuffled()

        
        snapShot.appendItems(temp)
        
        dataSource.apply(snapShot, animatingDifferences: true)
    }
    
    
    
}

