//
//  ContactDetailsController.swift
//  ContactList
//
//  Created by abuzeid on 01.10.20.
//  Copyright © 2020 abuzeid. All rights reserved.
//

import UIKit

final class ContactDetailsController: UIViewController {
    @IBOutlet private var avatarView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var phoneNumberLabel: UILabel!
    @IBOutlet private var emailLabel: UILabel!
    @IBOutlet private var jobLabel: UILabel!

    private var imageLoader: Disposable?
    var contact: Contact? {
        didSet {
            if self.isViewLoaded {
                updateUIWithData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIWithData()
        setTranslucentNaivigationBar()
    }

    private func updateUIWithData() {
        imageLoader = avatarView.setImage(with: contact?.avatar ?? "")
        nameLabel.text = contact?.name
        phoneNumberLabel.text = contact?.phoneNumber
        emailLabel.text = contact?.email
        jobLabel.text = contact?.jobTitle
    }

    private func setTranslucentNaivigationBar() {
        guard splitViewController != nil else { return }
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }

    deinit {
        imageLoader?.dispose()
    }
}
