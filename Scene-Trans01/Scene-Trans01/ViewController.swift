//
//  ViewController.swift
//  Scene-Trans01
//
//  Created by LEE on 2023/01/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var uiTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func moveNxt(_ sender: Any) {
        
        // 이동할 뷰 컨트롤러 객체를 StoryBoardID 정보를 이용하여 참조.
        guard let uvc = self.storyboard!.instantiateViewController(withIdentifier: "secondVC") else { return }
        
        // 화면 전환시 애니메이션 타입.
        uvc.modalTransitionStyle = .coverVertical
        
        // 인자값으로 뷰 컨트롤러의 인스턴스를 넣고, 프레젠트 메소드 호출
        present(uvc, animated: true)
    }
    
}

