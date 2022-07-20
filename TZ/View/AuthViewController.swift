//
//  AuthViewController.swift
//  TZ
//
//  Created by Павел Галкин on 01.07.2022.
//

import UIKit
import SnapKit

class AuthViewController: UIViewController {
    
    let buttonLogin = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        authentication()
        
            }
    //кнопка авторизации
    private func authentication(){
        view.backgroundColor = .white
        buttonLogin.backgroundColor = .blue
        buttonLogin.setTitleColor(.white, for: .normal)
        buttonLogin.layer.cornerRadius = 35
        buttonLogin.setTitle("Authorization", for: .normal)
        view.addSubview(buttonLogin)
        buttonLogin.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.width.equalTo(250)
            maker.bottom.equalToSuperview().inset(350)
            maker.height.equalTo(70)
        }
        buttonLogin.addTarget(self, action: #selector(login), for: .touchUpInside)
        
    }
    @objc func login(){
        
        transition()

    }
    func transition(){
        let profilVC = ProfilViewController()
        let navVC = UINavigationController(rootViewController: profilVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
}
                                 


