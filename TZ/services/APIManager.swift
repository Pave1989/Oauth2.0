//
//  APIManager.swift
//  TZ
//
//  Created by Павел Галкин on 12.07.2022.
//

import Foundation

enum ApiType{

    case getAvatar
    case getUsername
    //
    var baseURL: String {
        return "https://sso.arbina.com/oauth/"
    }
    //путь запросов
    var path: String {
        switch self {
        case .getAvatar: return "token?grant_type=password&username=test-user&password=qlFUaO7N&client_id=arbina_infra_ios_test&client_secret=dmLJLq9TUFB7&redirect_url=oauth-swift://oauth-callback/arbina"
        case .getUsername: return "token?grant_type=password&username=test-user&password=qlFUaO7N&client_id=arbina_infra_ios_test&client_secret=dmLJLq9TUFB7&redirect_url=oauth-swift://oauth-callback/arbina"
        }
    }
    //запрос типа
    var request: URLRequest{
        //конструктор url
        let url = URL(string: path, relativeTo: URL(string: baseURL)!)!
        //заполнение запроса
                      var request = URLRequest(url: url)
        request.httpMethod = "POST"
        return request
    }
}

//класс реализовывающий запросы
class ApiManager {
    static let shared = ApiManager()//singleton
    func getAvatar(completion: @escaping (User) -> Void){
        let request = ApiType.getAvatar.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let avatar = try? JSONDecoder().decode(User.self, from: data){
                completion(avatar)
            } else {
                print("Ошибка получения аватарки: \(error)")
            }
    }
        //запуск задачи
        task.resume()
    }
    func getUsername(completion: @escaping (User) -> Void) {
        let request = ApiType.getUsername.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let username = try? JSONDecoder().decode(User.self, from: data){
                DispatchQueue.main.async {
                    completion(username)
                }
            } else {
                print("Ошибка получения имя пользователя: \(error)")
            }
    }
        //запуск задачи
        task.resume()
    }
}
