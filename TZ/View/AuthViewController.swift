//
//  AuthViewController.swift
//  TZ
//
//  Created by Павел Галкин on 01.07.2022.
//

import UIKit
import SnapKit

class AuthViewController: UIViewController {
    //кнопка авторизации
   private let buttonAuth = UIButton(type: .custom)
   private var backgroundImageView = UIImageView()
   private let backgroundImage = UIImage(named: "img")
   private let buttonImageView = UIImageView()
   private let buttonImage = UIImage(named: "arbinaButton")
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     authentication()
        
            }
    //кнопка авторизации
    private func authentication(){
        backgroundImageView = UIImageView(frame: self.view.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.center = view.center
        view.addSubview(backgroundImageView)

        
        buttonImageView.image = buttonImage
        buttonAuth.setImage(buttonImage, for: .normal)
        view.addSubview(buttonAuth)
        buttonAuth.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.width.equalTo(120)
            maker.bottom.equalToSuperview().inset(350)
            maker.height.equalTo(120)
        }
        buttonAuth.addTarget(self, action: #selector(getToken), for: .touchUpInside)
    }
   
     @objc private func getToken(){
    //        let webToken = "accessToken"//ключ для Token
            var request = URLRequest(url: URL(string: "https://sso.arbina.com/oauth/token?grant_type=password&username=test-user&password=qlFUaO7N&client_id=arbina_infra_ios_test&client_secret=dmLJLq9TUFB7&redirect_url=oauth-swift://oauth-callback/arbina")!)
            request.httpMethod = "POST"
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data, let _ = try? JSONDecoder().decode(User.self, from: data){
    //                if let token = UserDefaults.standard.string(forKey: webToken){
    //                    self.accessTok = token
                DispatchQueue.main.async {
                    self.transition()
                }
                //print(token.accessToken)
                }else{
                    DispatchQueue.main.async {
               //Аллерт на аторизацию 
            let alert = UIAlertController(title: "Вы не автаризованы", message: "Авторизуйтесь пожалуйста нажав кнопку", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Авторизация", style: .default, handler: { (actionURL) in
                        //действие при нажатии кнопки
                    }))
                    self.present(alert, animated: true, completion: nil)
                    print("Ошибка получение токена: \(error)")
                }
            }
        }
            //запуск задачи
            task.resume()
        }
  private func transition(){
        let profilVC = ProfilViewController()
        let navVC = UINavigationController(rootViewController: profilVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
   
}
                                 


