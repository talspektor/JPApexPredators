//
//  Episode.swift
//  BBQuotes17
//
//  Created by Tal talspektor on 10/25/24.
//

import Foundation

struct Episode: Decodable {
    let episode: Int
    let title: String
    let image: String
    let synopsis: String
    let writtenBy: String
    let directedBy: String
    let airDate: String
    
    var seasonEpisode: String { // "Season 1 Episode 1"
        var episodeString = String(episode)
        let season = episodeString.removeFirst()
        
        if episodeString.first! == "0" {
            episodeString = String(episodeString.removeLast())
        }
        
        return "Season \(season) Episode \(episodeString)"
    }
    
    var imageUrl: URL {
        URL(string: image)!
    }
}
