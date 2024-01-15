//
//  ViewController.swift
//  Msg-Notification
//
//  Created by LEE on 2023/02/02.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet var msg: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // UI에 대한 부분은 메인 쓰레드에서 처리를 해야한다.
    // 비동기 클로저는 대부분 백그라운드에서 실행되기 때문에, 클로저에서 UI에 대한 작업은
    // 메인 쓰레드에서 처리할 수 있도록 디스패치 큐를 이용.
    @IBAction func save(_ sender: Any) {
        UNUserNotificationCenter.current().getNotificationSettings(completionHandler: {(settings) in
            if settings.authorizationStatus == .authorized{
                DispatchQueue.main.async{
                    let nContent = UNMutableNotificationContent()
                    nContent.body = self.msg.text!
                    nContent.title = "미리 알림"
                    nContent.sound = .default
                    
                    let time = self.datePicker.date.timeIntervalSinceNow
                    
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                    let request = UNNotificationRequest(identifier: "alarm", content: nContent, trigger: trigger)
                    
                    UNUserNotificationCenter.current().add(request){
                        (_) in
                        DispatchQueue.main.async{
                            let date = self.datePicker.date.addingTimeInterval(9*60*60)
                            
                            let message = "알림이 등록되었습니다. 등록된 알림은 \(date)에 발송됩니다."
                        
                            let alert = UIAlertController(title: "알림등록", message: message, preferredStyle: .alert)
                            
                            let action = UIAlertAction(title: "확인", style: .default)
                            
                            alert.addAction(action)
                            self.present(alert, animated: true)
                            
                        }
                    }
                }
                
            }else{
                let alert = UIAlertController(title: "알림", message: "알림 권한을 설정해주세요", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "확인", style: .default)
                alert.addAction(action)
                self.present(alert, animated: true)
                return
            }
        })
    }
}

 

