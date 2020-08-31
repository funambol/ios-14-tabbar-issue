import UIKit

class DownloadsViewController: UIViewController {
    lazy var listButton: UIButton = makeListButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        title = "Downloads"
        
        view.addSubview(listButton)
        NSLayoutConstraint.activate([
            listButton.widthAnchor.constraint(equalToConstant: view.bounds.width),
            listButton.heightAnchor.constraint(equalToConstant: view.bounds.height),
            listButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            listButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

private extension DownloadsViewController {
    func makeListButton() -> UIButton {
        let b = UIButton()
        
        // Appereance
        b.setTitle("List", for: .normal)
        b.setTitleColor(.systemYellow, for: .normal)
        b.setTitleColor(.yellow, for: .highlighted)
        b.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 44.0)
        b.backgroundColor = .clear
        
        // Action
        b.addTarget(self,
                    action: #selector(DownloadsViewController.listDidTap(_:)),
                    for: .touchUpInside)
        
        // Constraints
        b.translatesAutoresizingMaskIntoConstraints = false
        
        return b
    }
    
    @objc
    func listDidTap(_ sender: UIButton) {
        let list = ListViewController()
        list.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(list, animated: true)
    }
}


