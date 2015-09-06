//
//  ViewController.swift
//  image-scroll-swift
//
//  Created by Evgenii Neumerzhitckii on 4/10/2014.
//  Copyright (c) 2014 Evgenii Neumerzhitckii. All rights reserved.
//

import UIKit

let imageScrollLargeImageName = "wallabi.jpg"
let imageScrollSmallImageName = "wallabi_small.jpg"


class ViewController: UIViewController, UIScrollViewDelegate {

  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var imageSizeToggleButton: UIButton!

  @IBOutlet weak var imageConstraintTop: NSLayoutConstraint!
  @IBOutlet weak var imageConstraintRight: NSLayoutConstraint!
  @IBOutlet weak var imageConstraintLeft: NSLayoutConstraint!
  @IBOutlet weak var imageConstraintBottom: NSLayoutConstraint!

  var lastZoomScale: CGFloat = -1

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)

    imageView.image = UIImage(named: imageScrollLargeImageName)
    scrollView.delegate = self
    updateZoom()
  }
  
  // Update zoom scale and constraints with animation.
  @available(iOS 8.0, *)
  override func viewWillTransitionToSize(size: CGSize,
    withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
      
    super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
      
    coordinator.animateAlongsideTransition({ [weak self] _ in
      self?.updateZoom()
    }, completion: nil)
  }

  //
  // Update zoom scale and constraints with animation on iOS 7.
  //
  // DEPRECATION NOTICE:
  //
  // This method is deprecated in iOS 8.0 and it is here just for iOS 7.
  // You can safely remove this method if you are not supporting iOS 7.
  // Or if you do support iOS 7 you can leave it here as it will be ignored by the newer iOS versions.
  //
  override func willAnimateRotationToInterfaceOrientation(
    toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {

    super.willAnimateRotationToInterfaceOrientation(toInterfaceOrientation, duration: duration)
    updateZoom()
  }

  func updateConstraints() {
    if let image = imageView.image {
      let imageWidth = image.size.width
      let imageHeight = image.size.height

      let viewWidth = view.bounds.size.width
      let viewHeight = view.bounds.size.height

      // center image if it is smaller than screen
      var hPadding = (viewWidth - scrollView.zoomScale * imageWidth) / 2
      if hPadding < 0 { hPadding = 0 }

      var vPadding = (viewHeight - scrollView.zoomScale * imageHeight) / 2
      if vPadding < 0 { vPadding = 0 }

      imageConstraintLeft.constant = hPadding
      imageConstraintRight.constant = hPadding

      imageConstraintTop.constant = vPadding
      imageConstraintBottom.constant = vPadding

      // Makes zoom out animation smooth and starting from the right point not from (0, 0)
      view.layoutIfNeeded()
    }
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

  @IBAction func onImageSizeToggleButtonTapped(sender: AnyObject) {
    imageSizeToggleButton.selected = !imageSizeToggleButton.selected
    imageSizeToggleButton.invalidateIntrinsicContentSize()

    let fileName = imageSizeToggleButton.selected ?
      imageScrollSmallImageName : imageScrollLargeImageName

    imageView.image = UIImage(named: fileName)
    updateZoom()
  }
  
  // UIScrollViewDelegate
  // -----------------------

  func scrollViewDidZoom(scrollView: UIScrollView) {
    updateConstraints()
  }

  func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
    return imageView
  }

}

