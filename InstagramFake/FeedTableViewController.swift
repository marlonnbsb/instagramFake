//
//  FeedTableViewController.swift
//  InstagramFake
//
//  Created by Marlon Machado on 18/05/21.
//

import UIKit

class FeedTableViewController: UITableViewController {

    private let kBaseURL = "https://jsonplaceholder.typicode.com"
    
    private var posts = [Post]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        PostTableViewCell.register(inside: self.tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let url = URL(string: "\(kBaseURL)/posts") {
            let session = URLSession.shared

            let request = URLRequest(url: url)
            
            let task = session.dataTask(with: request) { (data, resp, error) in
                if let response = resp as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 {
                    if let posts = try? JSONDecoder().decode([Post].self, from: data!) {
                        DispatchQueue.main.async {
                            self.posts = posts
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.kReuseIdentifier, for: indexPath) as! PostTableViewCell
        cell.setup(with: posts[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 460
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
