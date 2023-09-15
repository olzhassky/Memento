//
//  ViewController.swift
//  PushLocalNotification
//
//  Created by Olzhas Zhakan on 11.09.2023.
//

import UIKit
import UserNotifications
import SnapKit

struct Memento {
    let title: String
    let date: Date
}


class ViewController: UIViewController {
    let table = UITableView()
    var memento: [Memento] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        view.addSubview(table)
        title = "Notification"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMemento))
    }
    @objc func addMemento() {
        let reminderVC = ReminderViewController()
        let sheetController = UISheetPresentationController(presentedViewController: reminderVC, presenting: self)
        sheetController.detents = [.medium(), .large()]
        self.present(reminderVC, animated: true, completion: nil)
    }

  
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memento.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let reminder = memento[indexPath.row]
        cell.textLabel?.text = reminder.title
        cell.detailTextLabel?.text = DateFormatter.localizedString(from: reminder.date, dateStyle: .medium, timeStyle: .short)
        return cell
    }

}
