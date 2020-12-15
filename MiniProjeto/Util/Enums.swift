//
//  Enum.swift
//  MiniProjeto
//
//  Created by Softbuilder Informatica on 14/12/20.
//

import Foundation

enum ConnectionSessionError: Error{
    case invalidUrl, notFound, pushNotificationtokenNotFound, invalidLogin, invalidJSON, userNotLogged, unzipFailed, authTokenNotFound, noResponse
    var localizedDescription: String{
        switch self {
        case .invalidUrl:
            return "URL Inválida"
        case .notFound:
            //return "Nenhuma Resposta Encontrada"
            return "Conexão com a internet com problema.\nVerifique sua conexão e tente novamente."
        case .pushNotificationtokenNotFound:
            return "Token da Notificação Push não encontrado."
        case .invalidLogin:
            return "Usuário e/ou Senha inválidos."
        case .invalidJSON:
            return "O objeto JSON não pôde ser lido."
        case .userNotLogged:
            return "Usuário deve estar logado."
        case .unzipFailed:
            return "Falha ao realizar o unzip."
        case .authTokenNotFound:
            return "Token de autenticação não encontrado."
        case .noResponse:
            return "Sem resposta do servidor."
        }
    }
    
    func description() -> String{
        switch self {
        case .invalidUrl:
            return "URL Inválida"
        case .notFound:
            //return "Nenhuma Resposta Encontrada"
            return "Conexão com a internet com problema.\nVerifique sua conexão e tente novamente."
        case .pushNotificationtokenNotFound:
            return "Token da Notificação Push não encontrado."
        case .invalidLogin:
            return "Usuário e/ou Senha inválidos."
        case .invalidJSON:
            return "O objeto JSON não pôde ser lido."
        case .userNotLogged:
            return "Usuário deve estar logado."
        case .unzipFailed:
            return "Falha ao realizar o unzip."
        case .authTokenNotFound:
            return "Token de autenticação não encontrado."
        case .noResponse:
            return "Sem resposta do servidor."
        }
    }
    
}

enum ConnectionSessionHttpMethod{
    case post, put, get, delete
    func description() -> String{
        switch self {
        case .post: return "POST"
        case .get: return "GET"
        case .delete : return "DELETE"
        case .put: return "PUT"
        }
    }
}
