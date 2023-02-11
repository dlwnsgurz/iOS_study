//
//  ControlViewController.swift
//  Chapter03-Alert
//
//  Created by LEE on 2023/02/11.
//

import UIKit

class ControlViewController: UIViewController {

    var slider = UISlider()
    
    var sliderValue: Float{
        return slider.value
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        slider.maximumValue = 10
        slider.minimumValue = 0
        slider.value = 5
        
        
        slider.frame = CGRect(x: 0, y: 0, width: 250, height: 30)
        
        self.preferredContentSize = CGSize(width: slider.frame.width, height: slider.frame.height + 10)
        view.addSubview(slider)
        
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
