//
//  ViewController.swift
//  UITableView_DiffableDataSource
//
//  Created by LEE on 2023/02/20.
//

import UIKit

class ListViewController: UITableViewController {

    // 셀에 담길 문자열
    struct Str: Hashable{
        var string: String
        
        var sdsd = UUID()
        func hash(into hasher: inout Hasher) {
            hasher.combine(sdsd)
        }
    }
    
    var stringList = [UUID]()
    
    // 섹션을 열거형으로 정의
    enum Section: CaseIterable{
        case main
    }
    
    
    var dataSource: UITableViewDiffableDataSource<Section, UUID>!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...9{
            stringList.append(UUID())
        }
        
        dataSource = UITableViewDiffableDataSource<Section, UUID>(tableView: tableView)
        {(tableView, indexPath, itemIdentifier) in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
            cell.textLabel?.text = self.stringList[indexPath.row].description
            cell.textLabel?.font = .systemFont(ofSize: 20)
            
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.stringList.count
    }

    
    @IBAction func change(_ sender: Any) {
    
        // 빈 스냅샷 인스턴스 생성
        var snapShot = NSDiffableDataSourceSnapshot<Section, UUID>()
        
        // 스냅샷에 들어갈 테이뷰 뷰 섹션 추가.
        snapShot.appendSections([.main])

        var temp = [UUID]()
        temp = stringList.shuffled()
        
        for str in temp{
            print(str)
        }
        
        print("-------------------------------------------")
        
        // 스냅샷에 들어갈 셀 배열 추가.
        snapShot.appendItems(temp)

        // 스냅샷을 적용. UI 업데이트 시작
        dataSource.apply(snapShot, animatingDifferences: true)
    }
    
    
}

