//
//  UsersScreenViewController.swift
//  ios-test-sda
//
//  Created by Tenti Atika Putri on 16/10/22.
//

import UIKit

class UsersScreenViewController: UIViewController {

    @IBOutlet weak var usersTableView: UITableView!

    var users: [userData] = []
    var refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        downloadJSON {
            self.usersTableView.reloadData()
            print("success downloadJSON")
        }

        usersTableView.dataSource = self
        usersTableView.delegate = self

        usersTableView.register(
            UINib(nibName: "UsersTableViewCell", bundle: nil),
            forCellReuseIdentifier: "UsersCell"
        )

        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        usersTableView.addSubview(refreshControl)
    }

    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://reqres.in/api/users?page=1&per_page=10")

        URLSession.shared.dataTask(with: url!) { data, response, error in

            if error == nil {
                do {
                    let jsonDataModel = try JSONDecoder().decode(DataModel.self, from: data!)
                    self.users = jsonDataModel.data
                    DispatchQueue.main.async {
                        completed()
                        print("completed()")

                    }
                    print("Error == nil")
                }
                catch {
                    print("The Error is: \(error)")
                }
            }
        }.resume()
    }

    @objc func refresh(sender: UIRefreshControl) {
        DispatchQueue.main.async {
            self.usersTableView.reloadData()
            print("success pull to refresh")
            self.refreshControl.endRefreshing()
        }
    }

    @IBAction func showMapView(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let mapViewController = storyBoard.instantiateViewController(withIdentifier: "MapViewID") as? MapViewController
        mapViewController?.modalTransitionStyle = .crossDissolve
        self.navigationController?.pushViewController(mapViewController!, animated: true)
        
    }
}

extension UsersScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: "UsersCell",
            for: indexPath
        ) as? UsersTableViewCell {
            let user = users[indexPath.row]
            cell.nameLabel.text = "\(user.firstName) \(user.lastName)"
            cell.emailLabel.text = user.email

            let avatarUrl = user.avatar
            cell.usersImageView.downloaded(from: avatarUrl)
            cell.usersImageView.layer.cornerRadius = cell.usersImageView.frame.size.width / 2
            cell.usersImageView.clipsToBounds = true

            return cell
            
        } else {
            return UITableViewCell()
        }
    }
}

extension UsersScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToDetail", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToDetail" {
            if let homeScreenSelectedViewController = segue.destination as? HomeScreenSelectedViewController {
                homeScreenSelectedViewController.user = users[usersTableView.indexPathForSelectedRow!.row]
            }
        }
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
