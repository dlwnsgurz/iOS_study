//
//  DetailViewController.swift
//  MyMovieChart
//
//  Created by LEE on 2023/02/05.
//

import UIKit
import WebKit

class DetailViewController: UIViewController{

    @IBOutlet var wv: WKWebView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    var mvo: MovieVO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wv.navigationDelegate = self
        
        let naviBar = self.navigationItem
        naviBar.title = mvo.title
        
        
        let url = URL(string: mvo.detail!)!
        let urlRequest = URLRequest(url: url)
        
        wv.load(urlRequest)
        
        // Do any additional setup after loading the view.
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

extension DetailViewController: WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        spinner.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinner.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {

        spinner.stopAnimating()
        self.alert("상세페이지를 불러오지 못했습니다."){
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        spinner.stopAnimating()
        self.alert("상세페이지를 불러오지 못했습니다."){
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension UIViewController{
    
    func alert(_ message: String, onClick: (() -> Void)? = nil){
        let controller = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .cancel){ (_) in
            onClick?()
        })
        DispatchQueue.main.async {
            self.present(controller, animated: false)
        }
    }
}

