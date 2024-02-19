//
//  PageModel.swift
//  Pinch
//
//  Created by Dhruvin Mulani on 2024-02-19.
//

import Foundation

struct Page: Identifiable{
    let id : Int
    let imageName: String     
}

extension Page {
    var thumbnailName : String{
        return "thumb-"+imageName
    }
}
