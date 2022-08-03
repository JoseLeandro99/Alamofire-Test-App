import Alamofire

protocol AFServiceProtocol {
    typealias completion = ((User) -> Void)
    func getUserData(completion: @escaping completion)
}

class AFService: AFServiceProtocol {
    func getUserData(completion: @escaping completion) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/1") else {return}
        
        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of:User.self) { response in
                switch response.result {
                case .success(let user):
                    completion(user)
                case .failure(let failure):
                    print(failure)
                }
            }
    }
}
