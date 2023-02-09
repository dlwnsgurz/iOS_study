//
//  MemoFormVC.swift
//  MyMemory
//
//  Created by LEE on 2023/02/09.
//

import UIKit

class MemoFormVC: UIViewController, UIImagePickerControllerDelegate,UITextViewDelegate, UINavigationControllerDelegate {

    // 이미지 뷰
    @IBOutlet var previews: UIImageView!
    // 텍스트
    @IBOutlet var contents: UITextView!
    var subject: String! // 제목 (내용의 첫줄)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contents.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pick(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        self.present(picker,animated: false)
    }
    
    @IBAction func save(_ sender: Any) {
        
        guard contents.text?.isEmpty == false else {
            let alert = UIAlertController(title: nil, message: "내용을 입력해주세요.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            present(alert,animated: false)
            return
        }
        
        let data = MemoData()
        data.title = self.subject
        data.contents = contents.text
        data.image = previews.image
        data.regdate = Date() // 작성 시각
        
        let ad = UIApplication.shared.delegate as! AppDelegate
        ad.memolist.append(data)
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        let contents = textView.text as NSString
        let length = (contents.length > 15) ? 15 : contents.length
        self.subject = contents.substring(with: NSRange(location: 0, length: length))
        
        
        self.navigationItem.title = subject
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.previews.image = info[.editedImage] as? UIImage
        
        picker.dismiss(animated: false)
    }
}
