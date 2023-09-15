//
//  ReminderViewController.swift
//  PushLocalNotification
//
//  Created by Olzhas Zhakan on 15.09.2023.
//

import UIKit
import SnapKit


class ReminderViewController: UIViewController {
    let textView: UITextView = {
        let textView = UITextView()
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.cornerRadius = 5.0
        textView.font = UIFont.systemFont(ofSize: 16.0)
        return textView
    }()


    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        return datePicker
    }()

    let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(saveReminder), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(textView)
        view.addSubview(datePicker)
        view.addSubview(saveButton)

        textView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.left.right.equalToSuperview().inset(25)
            $0.height.equalTo(200)
        }
        datePicker.snp.makeConstraints {
            $0.top.equalToSuperview().offset(250)
            $0.centerX.equalToSuperview()
        }
        saveButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.left.right.equalToSuperview().inset(150)
        }
    }

    @objc func saveReminder() {
        guard let reminderText = textView.text, !reminderText.isEmpty else {
            return
        }
        let selectedDate = datePicker.date
        let newMemento = Memento(title: reminderText, date: selectedDate)
        dismiss(animated: true, completion: nil)
    }

}


