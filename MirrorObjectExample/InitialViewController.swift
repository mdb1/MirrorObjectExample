//
//  InitialViewController.swift
//  MirrorObjectExample
//
//  Created by Manu on 28/05/2022.
//

import UIKit

final class InitialViewController: UIViewController {
    @IBOutlet private weak var incrementButton: UIButton!
    @IBOutlet private weak var valueLabel: UILabel!
    private var storedValue = 0

    @IBAction private func didTapIncrementButton(_ sender: Any) {
        storedValue += 1
        valueLabel.text = storedValue.description
    }
}
