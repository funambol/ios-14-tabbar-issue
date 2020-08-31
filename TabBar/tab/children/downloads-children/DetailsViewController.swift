import UIKit

class DetailsViewController: UIViewController {
    lazy var moreDetailsButton: UIButton = makeMoreDetailsButton()
    lazy var popToRootButton: UIButton = makePopToRootButton()
    
    weak var presentingController: UIViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        title = "Downloads"
        
        view.addSubview(moreDetailsButton)
        view.addSubview(popToRootButton)
        NSLayoutConstraint.activate([
            moreDetailsButton.widthAnchor.constraint(equalToConstant: view.bounds.width),
            moreDetailsButton.heightAnchor.constraint(equalToConstant: view.bounds.height/2),
            moreDetailsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moreDetailsButton.topAnchor.constraint(equalTo: view.topAnchor),
            
            popToRootButton.widthAnchor.constraint(equalToConstant: view.bounds.width),
            popToRootButton.heightAnchor.constraint(equalToConstant: view.bounds.height/2),
            popToRootButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popToRootButton.topAnchor.constraint(equalTo: moreDetailsButton.bottomAnchor)
        ])
    }
}

private extension DetailsViewController {
    func makeMoreDetailsButton() -> UIButton {
        let b = UIButton()
        
        // Appereance
        b.setTitle("More", for: .normal)
        b.setTitleColor(.systemYellow, for: .normal)
        b.setTitleColor(.yellow, for: .highlighted)
        b.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 44.0)
        b.backgroundColor = .clear
        
        // Action
        b.addTarget(self,
                    action: #selector(DetailsViewController.moreDetailsDidTap(_:)),
                    for: .touchUpInside)
        
        // Constraints
        b.translatesAutoresizingMaskIntoConstraints = false
        
        return b
    }
    
    func makePopToRootButton() -> UIButton {
        let b = UIButton()
        
        // Appereance
        b.setTitle("Pop", for: .normal)
        b.setTitleColor(.systemRed, for: .normal)
        b.setTitleColor(.red, for: .highlighted)
        b.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 44.0)
        b.backgroundColor = .clear
        
        // Action
        b.addTarget(self,
                    action: #selector(DetailsViewController.popToRootButtonDidTap(_:)),
                    for: .touchUpInside)
        
        // Constraints
        b.translatesAutoresizingMaskIntoConstraints = false
        
        return b
    }
    
    @objc
    func moreDetailsDidTap(_ sender: UIButton) {
        let alert = UIAlertController(title: "Seriously?", message: "😅", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        navigationController?.present(alert, animated: true, completion: nil)
    }
    
    @objc
    func popToRootButtonDidTap(_ sender: UIButton) {
        
        presentingController?.navigationController?.popToRootViewController(animated: true)
        
//        navigationController?.popToRootViewController(animated: true)

 
        // Workaround
//        let home = TabBarController()
//        home.selectedIndex = 1
//
//        let keyWindow = UIApplication.shared.connectedScenes
//                .filter({$0.activationState == .foregroundActive})
//                .map({$0 as? UIWindowScene})
//                .compactMap({$0})
//                .first?.windows
//                .filter({$0.isKeyWindow}).first
//        keyWindow?.rootViewController = home
    }
}

