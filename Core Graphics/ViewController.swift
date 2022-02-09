//
//  ViewController.swift
//  Core Graphics
//
//  Created by Николай Никитин on 09.02.2022.
//

import UIKit

class ViewController: UIViewController {

  //MARK: - Properties
  var currentDrawType = 0

  //MARK: - Outlets
  @IBOutlet var imageView: UIImageView!

  //MARK: - ViewLifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    drawRectangle()
  }

  //MARK: - Methods
  private func drawRectangle() {
    currentDrawType += 1
    if currentDrawType > 5 {
      currentDrawType = 0
    }
    switch currentDrawType {
    case 0:
      drawRectangle()
    default:
      break
    }
  }

  //MARK: - Actions
  @IBAction func redrawTapped(_ sender: UIButton) {
  }

}

