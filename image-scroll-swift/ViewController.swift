//
//  ViewController.swift
//  image-scroll-swift
//
//  Created by Evgenii Neumerzhitckii on 4/10/2014.
//  Copyright (c) 2014 Evgenii Neumerzhitckii. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var imageView: UIImageView!

  @IBOutlet weak var imageConstraintTop: NSLayoutConstraint!
  @IBOutlet weak var imageConstraintRight: NSLayoutConstraint!
  @IBOutlet weak var imageConstraintLeft: NSLayoutConstraint!
  @IBOutlet weak var imageConstraintBottom: NSLayoutConstraint!

  var lastZoomScale: CGFloat = 0

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)

    imageView.image = UIImage(named: "wallabi.jpg")
    scrollView.delegate = self
    updateZoom()
  }

  // Zoom to show as much image as possible unless image is smaller than screen
  private func updateZoom() {
    if let image = imageView.image {
      var minZoom = min(view.bounds.size.width / image.size.width,
        view.bounds.size.height / image.size.height)

      if minZoom > 1 { minZoom = 1 }

      scrollView.minimumZoomScale = minZoom

      // Force scrollViewDidZoom fire if zoom did not change
      if minZoom == lastZoomScale { minZoom += 0.000001 }

      scrollView.zoomScale = minZoom
      lastZoomScale = minZoom
    }
  }

}

