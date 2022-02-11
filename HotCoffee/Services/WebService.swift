//
//  WebService.swift
//  HotCoffee
//
//  Created by Carlos Cobian on 07/02/22.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case urlError
    case domainError
}

enum HttpMethod: String{
    case get = "GET"
    case post = "POST"
}

struct Resource<T: Codable>{
    let url: URL
    var httpMethod: HttpMethod = .get
    var body: Data? = nil
}

extension Resource{
    init(url: URL){
        self.url = url
    }
}

class WebService{
    // <T> es un parámetro genérico
    // La función load es de tipo genérico
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>)->Void){
        
        URLSession.shared.dataTask(with: resource.url){ data, response, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            let result = try? JSONDecoder().decode(T.self, from: data)
            if let result = result{
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            }else{
                completion(.failure(.decodingError))
            }
        }.resume()
        
    }
}
