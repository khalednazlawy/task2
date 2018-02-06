//
//  RepClass.swift
//  task
//
//  Created by khaled nazlawy on 2/6/18.
//  Copyright © 2018 khaled nazlawy. All rights reserved.
//

import Foundation
class Repository {

    var nameOfRep:String?
    var descrption:String?
    var programmingLang:String?
    var last_update:String?
    var numberOfForks:Int?
    var stragersCount:Int?
    var html_url:String?
    var stargazers_url:String?
    init(nameOfRep:String,descrption:String,programmingLang:String,last_update:String,numberOfForks:Int,stragersCount:Int,html_url:String,stargazers_url:String){
        self.descrption = descrption
        self.last_update = last_update
        self.numberOfForks = numberOfForks
        self.nameOfRep = nameOfRep
        self.programmingLang = programmingLang
        self.stragersCount = stragersCount
        self.html_url = html_url
        self.stargazers_url=stargazers_url
    }
         
}
