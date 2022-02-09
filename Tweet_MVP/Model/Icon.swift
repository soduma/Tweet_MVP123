//
//  Icon.swift
//  Tweet_MVP
//
//  Created by 장기화 on 2022/02/07.
//

import UIKit

enum Icon {
    case like
    case message
    case share
    case write
    
    var image: UIImage? {
        let systemName: String
        
        switch self {
        case .like: systemName = "heart"
        case .message: systemName = "message"
        case .share: systemName = "square.and.arrow.up"
        case .write: systemName = "square.and.pencil"
        }
        
        return UIImage(systemName: systemName)
    }
}
