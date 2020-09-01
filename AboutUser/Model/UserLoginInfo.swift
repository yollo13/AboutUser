//
//  UserLoginInfo.swift
//  AboutUser
//
//  Created by YolloArts on 30.08.2020.
//  Copyright © 2020 YolloArts. All rights reserved.
//
import Foundation

struct DataUserLogin {
    let login: String
    let password: String
    let userInfo: UserInfo
    
    static func getUserData() -> DataUserLogin {
        DataUserLogin(
            login: "Alex",
            password: "1234",
            userInfo: UserInfo(description: """
            Александр. 36 лет.
            Любимые хобби: активные виды спорта
            (бег, скалолазание и др.) и
            рисование (DigitalArt и Аэрография)
            """
            )
        )
    }
}

struct UserInfo {
    let description: String
}

