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

  private func drawCheckerboard() {
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

  private func drawRotatedSquares() {
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
    let image = renderer.image { context in
      context.cgContext.translateBy(x: 256, y: 256)
      let rotations = 16
      let amount = Double.pi / Double(rotations)
      for _ in 0 ..< rotations {
        context.cgContext.rotate(by: CGFloat(amount))
        context.cgContext.addRect(CGRect(x: -128, y: -128, width: 256, height: 256))
      }
      context.cgContext.setStrokeColor(UIColor.black.cgColor)
      context.cgContext.strokePath()
    }
    imageView.image = image
  }

  private func drawLines() {
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
    let image = renderer.image { context in
      context.cgContext.translateBy(x: 256, y: 256)
      var first = true
      var lenght: CGFloat = 256
      for _ in 0 ..< 256 {
        context.cgContext.rotate(by: .pi / 2)
        if first {
          context.cgContext.move(to: CGPoint(x: lenght, y: 50))
          first = false
        } else {
          context.cgContext.addLine(to: CGPoint(x: lenght, y: 50))
        }
        lenght *= 0.99
      }
      context.cgContext.setStrokeColor(UIColor.cyan.cgColor)
      context.cgContext.strokePath()
    }
    imageView.image = image
  }

  private func drawImagesAndText() {
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
    let image = renderer.image { context in
      let paragraphStyle = NSMutableParagraphStyle()
      paragraphStyle.alignment = .center
      let attributesOfString: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 36),
        .paragraphStyle: paragraphStyle
      ]
      let string = "The best-laid schemes o'\nmice an' men gang aft agley"
      let attributedString = NSAttributedString(string: string, attributes: attributesOfString)
      attributedString.draw(with: CGRect(x: 32, y: 32, width: 448, height: 448), options: .usesLineFragmentOrigin, context: nil)
      let mouse = UIImage(named: "mouse")
      mouse?.draw(at: CGPoint(x: 300, y: 150))
    }
    imageView.image = image
  }

  private func  drawEmoji() {
    //⭐️
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
    func getPath() -> UIBezierPath {
      let path = UIBezierPath()
      path.move(to: CGPoint(x: 256, y: 112))
      path.addLine(to: CGPoint(x: 290, y: 184))
      path.addLine(to: CGPoint(x: 366, y: 184))
      path.addLine(to: CGPoint(x: 311, y: 252))
      path.addLine(to: CGPoint(x: 324, y: 332))
      path.addLine(to: CGPoint(x: 256, y: 294))
      path.addLine(to: CGPoint(x: 188, y: 332))
      path.addLine(to: CGPoint(x: 201, y: 252))
      path.addLine(to: CGPoint(x: 146, y: 184))
      path.addLine(to: CGPoint(x: 222, y: 184))
      path.close()
      return path
    }
    let image = renderer.image { context in
      context.cgContext.setFillColor(UIColor.yellow.cgColor)
      context.cgContext.addPath(getPath().cgPath)
      context.cgContext.drawPath(using: .fill)
    }
    imageView.image = image
  }

  private func drawTwin() {
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
    let image = renderer.image { context in
      context.cgContext.setStrokeColor(UIColor.cyan.cgColor)
      context.cgContext.setLineWidth(5)
      // Letter T
      context.cgContext.move(to: CGPoint(x: 70, y: 210))
      context.cgContext.addLine(to: CGPoint(x: 146, y: 210))
      context.cgContext.move(to: CGPoint(x: 110, y: 210))
      context.cgContext.addLine(to: CGPoint(x: 110, y: 290))
      //Letter W
      context.cgContext.move(to: CGPoint(x: 161, y: 210))
      context.cgContext.addLine(to: CGPoint(x: 186, y: 290))
      context.cgContext.move(to: CGPoint(x: 186, y: 290))
      context.cgContext.addLine(to: CGPoint(x: 214, y: 210))
      context.cgContext.move(to: CGPoint(x: 214, y: 210))
      context.cgContext.addLine(to: CGPoint(x: 239, y: 290))
      context.cgContext.move(to: CGPoint(x: 239, y: 290))
      context.cgContext.addLine(to: CGPoint(x: 267, y: 210))
      //Letter I
      context.cgContext.move(to: CGPoint(x: 291, y: 210))
      context.cgContext.addLine(to: CGPoint(x: 291, y: 290))
      //Letter N
      context.cgContext.move(to: CGPoint(x: 326, y: 210))
      context.cgContext.addLine(to: CGPoint(x: 326, y: 290))
      context.cgContext.move(to: CGPoint(x: 326, y: 210))
      context.cgContext.addLine(to: CGPoint(x: 387, y: 290))
      context.cgContext.move(to: CGPoint(x: 387, y: 210))
      context.cgContext.addLine(to: CGPoint(x: 387, y: 290))
      //End
      context.cgContext.drawPath(using: .fillStroke)
    }
    imageView.image = image
  }

  //MARK: - Actions
  @IBAction func redrawTapped(_ sender: UIButton) {
    currentDrawType += 1
    if currentDrawType > 7 {
      currentDrawType = 0
    }
    switch currentDrawType {
    case 0:
      drawRectangle()
    case 1:
      drawCircle()
    case 2:
      drawCheckerboard()
    case 3:
      drawRotatedSquares()
    case 4:
      drawLines()
    case 5:
      drawImagesAndText()
    case 6:
      drawEmoji()
    case 7:
      drawTwin()
    default:
      break
    }
  }

}

