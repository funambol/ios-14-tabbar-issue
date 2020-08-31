import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func setupTabBar() {
        
        let bookmarkViewController = BookmarksViewController()
        bookmarkViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        
        let downloadViewController = DownloadsViewController()
        downloadViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        
        let favoritesViewControllers = FavoritesViewController()
        favoritesViewControllers.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        
        let viewControllerList = [
            bookmarkViewController,
            downloadViewController,
            favoritesViewControllers
        ]
        
        viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0) }
    }
}

