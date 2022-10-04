//
//  TabBarController.swift
//  Instagram
//
//  Created by Natsuko Sakai on 2022/10/04.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {   // 初期化処理
        super.viewDidLoad()
        // タブアイコンの色
        self.tabBar.tintColor = UIColor(red: 1.0, green: 0.44, blue: 0.11, alpha: 1)
        // タブバーの背景色を設定
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor(red: 0.96, green: 0.91, blue: 0.87, alpha: 1)
        self.tabBar.standardAppearance = appearance
        self.tabBar.scrollEdgeAppearance = appearance
        // UITabBarControllerDelegateプロトコルのメソッドをこのクラスで処理
        self.delegate = self
    }
    
    // タブバーのアイコンがタップされたときに呼ばれるdelegateメソッドを処理
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is ImageSelectViewController {
            // ImageSelectViewControllerはタブ切り替えでなくモーダル画面遷移する
            let imageSelectViewController = storyboard!.instantiateViewController(withIdentifier: "ImageSelect")
            present(imageSelectViewController, animated: true)
            return false
        } else {
            // その他のViewControllerは通常のタブ切り替えを実施
            return true
        }
    }
    
}
