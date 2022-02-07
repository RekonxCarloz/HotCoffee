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

struct Resource<T: Codable>{
    let url: URL
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
            if let result = try? JSONDecoder().decode(T.self, from: data){
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            }else{
                completion(.failure(.decodingError))
            } 
        }.resume()
        
    }
}
