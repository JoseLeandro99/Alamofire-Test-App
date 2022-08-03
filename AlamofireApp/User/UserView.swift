import UIKit

protocol UserViewProtocol {
    func requestUserData()
}

class UserView: UIView {
    private var delegate: UserViewProtocol?
    
    lazy var idLabel = AppLabel(
        text: "",
        color: .darkGray,
        font: .systemFont(ofSize: 22, weight: .regular),
        alignment: .natural)
    
    lazy var usernameLabel = AppLabel(
        text: "",
        color: .darkGray,
        font: .systemFont(ofSize: 22, weight: .regular),
        alignment: .natural)
    
    lazy var emailLabel = AppLabel(
        text: "",
        color: .darkGray,
        font: .systemFont(ofSize: 22, weight: .regular),
        alignment: .natural)
    
    lazy var appButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGreen
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Request User", for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(handleRequestButtonClick), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configDelegate(delegate: UserViewProtocol) {
        self.delegate = delegate
    }
    
    func setupData(data: User) {
        self.idLabel.text = "Identifier: \(data.id)"
        self.usernameLabel.text = "Name: \(data.name)"
        self.emailLabel.text = "Email: \(data.email)"
    }
    
    private func setupUI() {
        self.addSubview(self.idLabel)
        self.addSubview(self.usernameLabel)
        self.addSubview(self.emailLabel)
        self.addSubview(self.appButton)
        
        NSLayoutConstraint.activate([
            self.idLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.idLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20),
            
            self.usernameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.usernameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10),
            
            self.emailLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.emailLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 40),
            
            self.appButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 150),
            self.appButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.appButton.widthAnchor.constraint(equalToConstant: 140),
            self.appButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
    @objc
    private func handleRequestButtonClick() {
        self.delegate?.requestUserData()
    }
}
