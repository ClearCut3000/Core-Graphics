//
//  ViewController.swift
//  Core Graphics
//
//  Created by Николай Никитин on 09.02.2022.
//

import UIKit

class ViewController: UIViewController {

  //MARK: - Properties
  private var currentDrawType = 0

  //MARK: - Outlets
  @IBOutlet var imageView: UIImageView!

  //MARK: - ViewLifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    drawRectangle()
  }

  //MARK: - Methods
  private func drawRectangle() {
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
    let image = renderer.image { context in
      let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512)
      context.cgContext.setFillColor(UIColor.red.cgColor)
      context.cgContext.setStrokeColor(UIColor.black.cgColor)
      context.cgContext.setLineWidth(10)
      context.cgContext.addRect(rectangle)
      context.cgContext.drawPath(using: .fillStroke)
    }
    imageView.image = image
  }

  private func drawCircle() {
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
    let image = renderer.image { context in
      let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512).insetBy(dx: 5, dy: 5)
      context.cgContext.setFillColor(UIColor.red.cgColor)
      context.cgContext.setStrokeColor(UIColor.black.cgColor)
      context.cgContext.setLineWidth(10)
      context.cgContext.addEllipse(in: rectangle)
      context.cgContext.drawPath(using: .fillStroke)
    }
    imageView.image = image
  }

  private func   drawCheckerboard() {
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
    let image = renderer.image { context in
      context.cgContext.setFillColor(UIColor.black.cgColor)
      for row in 0 ..< 8 {
        for column in 0 ..< 8 {
          if (row+column) % 2 == 0 {
            context.cgContext.fill(CGRect(x: column * 64, y: row * 64, width: 64, height: 64))
          }
        }
      }
    }
    imageView.image = image
  }

  //MARK: - Actions
  @IBAction func redrawTapped(_ sender: UIButton) {
    currentDrawType += 1
    if currentDrawType > 5 {
      currentDrawType = 0
    }
    switch currentDrawType {
    case 0:
      drawRectangle()
    case 1:
      drawCircle()
    case 3:
      drawCheckerboard()
    default:
      break
    }
  }

}

