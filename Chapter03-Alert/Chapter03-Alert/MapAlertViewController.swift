//
//  MapAlertViewController.swift
//  Chapter03-Alert
//
//  Created by LEE on 2023/02/11.
//

import UIKit
import MapKit

class MapAlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let defaultAlertBtn = UIButton(type: .system)
        defaultAlertBtn.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        
        defaultAlertBtn.center.x = view.frame.width / 2
        defaultAlertBtn.setTitle("기본 알림창", for: .normal)
        defaultAlertBtn.addTarget(self, action: #selector(mapAlert(_:)), for: .touchUpInside)
        
        view.addSubview(defaultAlertBtn)
        
        
        let imageBtn = UIButton(type: .system)
        imageBtn.frame = CGRect(x: 0, y: 200, width: 100, height: 30)
        imageBtn.center.x = view.frame.width / 2
        imageBtn.setTitle("이미지 알림창", for: .normal)
        imageBtn.addTarget(self, action: #selector(imageAlert(_:)), for: .touchUpInside)
        
        view.addSubview(imageBtn)
        // Do any additional setup after loading the view.
        
        
        let sliderBtn = UIButton(type: .system)
        sliderBtn.frame = CGRect(x: 0, y: 300, width: 100, height: 30)
        sliderBtn.center.x = view.frame.width / 2
        sliderBtn.setTitle("슬라이더 알림창", for: .normal)
        sliderBtn.addTarget(self, action: #selector(sliderAlert(_:)), for: .touchUpInside)
        
        view.addSubview(sliderBtn)
        
        let tableBtn = UIButton(type: .system)
        tableBtn.frame = CGRect(x: 0, y: 400, width: 100, height: 30)
        tableBtn.center.x = view.frame.width / 2
        tableBtn.setTitle("테이블 알림창", for: .normal)
        tableBtn.addTarget(self, action: #selector(listAlert(_:)), for: .touchUpInside)
        
        view.addSubview(tableBtn)
    }
    

    @objc func mapAlert(_ sender: Any){
        let alert = UIAlertController(title: nil, message: "여기가 맞습니까?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "아니오.", style: .cancel)
        let okAction = UIAlertAction(title: "네. 맞습니다.", style: .default)

        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        let contentVC = MapKitViewController()

        alert.setValue(contentVC, forKey: "contentViewController")
        
        
        present(alert, animated: false)
        
        
    }
    
    @objc func imageAlert(_ sender: Any){
        let alert = UIAlertController(title: nil, message: "이 앱의 평점입니다.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "네", style: .default)
        
        let imageVC = ImageViewController()
        
        alert.addAction(okAction)
        alert.setValue(imageVC, forKey: "contentViewController")
        
        present(alert, animated: false)
    }
    
    
    @objc func sliderAlert(_ sender: Any){
        let alert = UIAlertController(title: nil, message: "움직여라.", preferredStyle: .alert)
    
        let controlVC = ControlViewController()
        
        let okAction = UIAlertAction(title: "네", style: .default){
            (_) in
            NSLog("\(controlVC.sliderValue)")
        }
        alert.addAction(okAction)
        alert.setValue(controlVC, forKey: "contentViewController")
        
        present(alert, animated: false)
    }
    
    @objc func listAlert(_ sender: Any){
        let alert = UIAlertController(title: nil, message: "테이블 뷰", preferredStyle: .alert)
    
        let listVC = ListTableViewController()
        listVC.delegate = self
        let okAction = UIAlertAction(title: "네", style: .default){
            (_) in
            NSLog("\(listVC.row)")
        }
        alert.addAction(okAction)
        alert.setValue(listVC, forKey: "contentViewController")
        
        present(alert, animated: false)
    }
    
    func didSelectedRowAt(indexPath: IndexPath){
        NSLog("\(indexPath.row)")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
