import UIKit

class UserViewController: UIViewController {
    private var screen: UserView?
    private var afService: AFServiceProtocol?
    
    override func loadView() {
        self.screen = UserView()
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.afService = AFService()
        self.screen?.configDelegate(delegate: self)
    }
}

extension UserViewController: UserViewProtocol {
    func requestUserData() {
        self.afService?.getUserData() { result in
            self.screen?.setupData(data: result)
        }
    }
}
