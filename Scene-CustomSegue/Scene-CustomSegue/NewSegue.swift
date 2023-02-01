import UIKit
class NewSegue: UIStoryboardSegue{
    override func perform(){
        
        let srcUVC = self.source
        
        
        let desUVC = self.destination
        
        UIView.transition(from: srcUVC.view, to: desUVC.view, duration: 2, options: .transitionCurlDown)
        
    }
    
}
