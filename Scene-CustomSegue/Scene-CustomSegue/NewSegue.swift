import UIKit
class NewSegue: UIStoryboardSegue{
    
    // 세그웨이가 실행될 때 호출되는 함수.
    override func perform(){
        
        // 출발지 뷰 컨트롤러 인스턴스
        let srcUVC = self.source
        
        // 목적지 뷰 컨트롤러 인스턴스
        let desUVC = self.destination
        
        // 화면 전환 by UIView 클래스의 타입 메소드.
       UIView.transition(from: srcUVC.view, to: desUVC.view, duration: 2, options: .transitionCurlDown)
        
        // 화면 전환. UIViewController 클래스의 인스턴스 메소드.
        // 두 화면 전환은 동일한 역할 수행.
        srcUVC.present(desUVC, animated: true)
    }
    
}
