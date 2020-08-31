import UIKit

class ListViewController: UIViewController {
    lazy var detailsButton: UIButton = makeDetailsButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        title = "Downloads"
        
        view.addSubview(detailsButton)
        NSLayoutConstraint.activate([
            detailsButton.widthAnchor.constraint(equalToConstant: view.bounds.width),
            detailsButton.heightAnchor.constraint(equalToConstant: view.bounds.height),
            detailsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

private extension ListViewController {
    func makeDetailsButton() -> UIButton {
        let b = UIButton()
        
        // Appereance
        b.setTitle("Details", for: .normal)
        b.setTitleColor(.systemYellow, for: .normal)
        b.setTitleColor(.yellow, for: .highlighted)
        b.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 44.0)
        b.backgroundColor = .clear
        
        // Action
        b.addTarget(self,
                    action: #selector(ListViewController.detailsDidTap(_:)),
                    for: .touchUpInside)
        
        // Constraints
        b.translatesAutoresizingMaskIntoConstraints = false
        
        return b
    }
    
    @objc
    func detailsDidTap(_ sender: UIButton) {
        
//        navigationController?.popToRootViewController(animated: true)
        
        let details = DetailsViewController()
        details.presentingController = self
        navigationController?.pushViewController(details, animated: true)
    }
}



