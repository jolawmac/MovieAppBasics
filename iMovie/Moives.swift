//
//  Moives.swift
//  iMovie
//
//  Created by DANIEL CORNWELL on 7/10/17.
//  Copyright © 2017 DANIEL CORNWELL. All rights reserved.
//

import UIKit

class MoviesStore
{
    // MARK: - Public API
    
    var numberOfMoives: Int {
        return movies.count
    }
    
    var numberOfSections: Int {
        return sections.count
    }
    
    init() {
        movies = createMovies()
        sections = ["My Favorites", "Politics", "Travel", "Technology"]
    }
    
    func numberOfMovies(inSection section: Int) -> Int {
        let publishers = self.movies(forSection: section)
        return publishers.count
    }
    
    func movieForItem(atIndexPath indexPath: IndexPath) -> Movie?
    {
        if indexPath.section > 0 {
            let publishers = self.movies(forSection: indexPath.section)
            return publishers[indexPath.item]
        } else {
            return movies[indexPath.item]
        }
    }
    
    func titleForSection(atIndexPath indexPath: IndexPath) -> String?
    {
        if indexPath.section < sections.count {
            return sections[indexPath.section]
        }
        
        return nil
    }
    
    // MARK: - Private
    // Collection View / Table View - section & cells
    private var movies = [Movie]()
    private var sections = [String]()
    
    private func createMovies() -> [Movie]
    {
        var newMovies = [Movie]()
        
//        newMovies += MyFavorites.movies()
//        newMovies += Politics.movies()
//        newMovies += Travel.movies()
//        newMovies += Technology.movies()
        
        return newMovies
    }
    
    private func movies(forSection section: Int) -> [Movie]
    {
        let section = sections[section]
        let moviesInSection = movies.filter { (movie: Movie) -> Bool in
            return movie.section == section
        }
        
        return moviesInSection
    }
}

//class MyFavorites
//{
//    class func movies() -> [Movie]
//    {
//        var movies = [Movie]()
//        movies.append(Movie(title: "The New York Times", url: "http://www.nytimes.com", image: UIImage(named: "The New York Times")!, section: "My Favorites"))
//        movies.append(Movie(title: "TED", url: "https://www.ted.com", image: UIImage(named: "TED")!, section: "My Favorites"))
//        movies.append(Movie(title: "Re/code", url: "http://recode.net", image: UIImage(named: "Recode")!, section: "My Favorites"))
//        movies.append(Movie(title: "WIRED", url: "http://www.wired.com", image: UIImage(named: "WIRED")!, section: "My Favorites"))
//        return movies
//    }
//}
//
//class Politics
//{
//    class func movies() -> [Movie]
//    {
//        var movies = [Movie]()
//        movies.append(Movie(title: "The Atlantic", url: "http://www.theatlantic.com", image: UIImage(named: "The Atlantic")!, section: "Politics"))
//        movies.append(Movie(title: "The Hill", url: "http://thehill.com", image: UIImage(named: "The Hill")!, section: "Politics"))
//        movies.append(Movie(title: "Daily Intelligencer", url: "http://nymag.com/daily/intelligencer/", image: UIImage(named: "Daily Intelligencer")!, section: "Politics"))
//        movies.append(Movie(title: "Vanity Fair", url: "http://recode.net", image: UIImage(named: "Vanity Fair")!, section: "Politics"))
//        movies.append(Movie(title: "TIME", url: "http://time.com", image: UIImage(named: "TIME")!, section: "Politics"))
//        movies.append(Movie(title: "The Huffington Post", url: "http://www.huffingtonpost.com", image: UIImage(named: "The Huffington Post")!, section: "Politics"))
//        return movies
//    }
//}
//
//class Travel
//{
//    class func movies() -> [Movie]
//    {
//        var movies = [Movie]()
//        movies.append(Movie(title: "AFAR", url: "http://www.afar.com", image: UIImage(named: "AFAR")!, section: "Travel"))
//        movies.append(Movie(title: "The New York Times", url: "http://www.nytimes.com", image: UIImage(named: "The New York Times")!, section: "Travel"))
//        movies.append(Movie(title: "Men’s Journal", url: "http://www.mensjournal.com", image: UIImage(named: "Men’s Journal")!, section: "Travel"))
//        movies.append(Movie(title: "Smithsonian", url: "http://www.smithsonianmag.com/?no-ist", image: UIImage(named: "Smithsonian")!, section: "Travel"))
//        movies.append(Movie(title: "Wallpaper", url: "http://www.wallpaper.com", image: UIImage(named: "Wallpaper")!, section: "Travel"))
//        movies.append(Movie(title: "Sunset", url: "http://www.sunset.com", image: UIImage(named: "Sunset")!, section: "Travel"))
//        return movies
//    }
//}
//
//class Technology
//{
//    class func movies() -> [Movie]
//    {
//        var movies = [Movie]()
//        movies.append(Movie(title: "WIRED", url: "http://www.wired.com", image: UIImage(named: "WIRED")!, section: "Technology"))
//        movies.append(Movie(title: "Re/code", url: "http://recode.net", image: UIImage(named: "Recode")!, section: "Technology"))
//        movies.append(Movie(title: "Quartz", url: "http://qz.com", image: UIImage(named: "Quartz")!, section: "Technology"))
//        movies.append(Movie(title: "Daring Fireball", url: "http://daringfireball.net", image: UIImage(named: "Daring Fireball")!, section: "Technology"))
//        movies.append(Movie(title: "MIT Technology Review", url: "http://www.technologyreview.com", image: UIImage(named: "MIT Technology Review")!, section: "Technology"))
//        return movies
//    }
//}















