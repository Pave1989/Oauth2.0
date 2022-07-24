//
//  ProfilViewController.swift
//  TZ
//
//  Created by Павел Галкин on 07.07.2022.
//

import UIKit
import SnapKit


class ProfilViewController: UIViewController {
//Аватарка
    private var avatarImageView = UIImageView()
//Имя
    private  var nickNameLable = UILabel()
//Заголовок
    private let titleLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
      
    initialize()
    }
    //работа с ограничениями
    private func initialize(){
        titleLabel.text = "Профиль"
        titleLabel.font = UIFont(name: "abosanova", size: 30)
        navigationItem.titleView = titleLabel
        
        ApiManager.shared.getAvatar { avatar in
            DispatchQueue.main.async {
                    let urlApi = avatar.avatar?.thumb
                //взятие адреса User.Avatar картинки по модели
                let url = URL(string: urlApi!)
                if let data = try? Data(contentsOf: url!){
                    self.avatarImageView.image = UIImage(data: data)
                    }else{ //если нет url full
                        self.avatarImageView.image = UIImage(systemName: "person.fill")
                  }
            }
        }
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = 150
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.borderWidth = 5
        avatarImageView.layer.borderColor = UIColor.black.cgColor

    view.addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints { make in
                        make.centerX.equalToSuperview()
                        make.top.equalToSuperview().inset(150)
                        make.width.equalTo(300)
                        make.height.equalTo(300)
        }
        
        ApiManager.shared.getUsername { username in
            self.nickNameLable.text = "\(username.username)"
        }
        nickNameLable.font = UIFont(name: "Pacifico-Regular", size: 40)
    view.addSubview(nickNameLable)
        nickNameLable.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(avatarImageView.snp.bottom).offset(20)
    }

  }

}
