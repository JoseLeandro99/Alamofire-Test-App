import UIKit

class AppLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text: String, color: UIColor, font: UIFont, alignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.privateDefaults(text: text, color: color, font: font, alignment: alignment)
    }
    
    private func privateDefaults(text: String, color: UIColor, font: UIFont, alignment: NSTextAlignment) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.textColor = color
        self.font = font
        self.textAlignment = alignment
    }
}
