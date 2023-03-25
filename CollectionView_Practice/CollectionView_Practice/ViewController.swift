//
//  ViewController.swift
//  CollectionView_Practice
//
//  Created by LEE on 2023/03/20.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDragDelegate{
    
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        
        return session.items
    }
    

    // MARK: - Properties
    var arr: [String]{
        
        var temp = [String]()
        for i in 1...30{
            temp.append(String(i))
        }
        return temp
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dragDelegate = self

    }

    
    // MARK: - UICollectionView관련 메소드 구현
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.label.text = arr[indexPath.item] + "번째 아이템"
        cell.contentView.backgroundColor = .yellow
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, dragSessionWillBegin session: UIDragSession) {
        print("dd")
    }
    
    
}
