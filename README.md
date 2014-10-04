# Image in a scroll view with auto layout in iOS

This is a demo iOS app written in Swift that shows how to use image inside a scroll view with auto layout.

Image can be panned and zoomed. It is centered and zoomed out initially. Adapts to device orientation change with animation.

<img src='https://raw.githubusercontent.com/evgenyneu/ios-imagescroll-swift/master/graphics/image_scroll.png' width='556' alt='Using image inside a scroll view with autolayout in iOS 7'>

## Things to note

* The job is done with auto layout constraints only.
* On each zoom we update the `constant` values for the constraints to center the image if needed.
* Feel free to contact me if you are stuck (like I was).

## How to copy this control to your project

* In your storyboard 'Use Autolayout' setting must enabled.
* Copy files `ImageScrollViewController.m` and `ImageScrollViewController.h` into your project.
* Copy Image Scroll View Controller into your storyboard, like this:

<img src='https://raw.githubusercontent.com/evgenyneu/ios-imagescroll-swift/master/graphics/image_scroll.png' width='357' alt='Copy Image View Controller'>


## Troubleshooting

Please make sure:

* Your view controller's class is ImageScrollViewController (Identity Inspector).
* VC storybord has all the controlls: View, ScrollView and ImageView along with all their constraints.
* To anable zooming ScrollView's 'max zoom' should be greater than 1 (Attributes Inspector). I used 3 in this demo.
* ImageView, ScrollView, four layout constraints and 'change image' button should be linked to their outlets in `ImageScrollViewController.m`.

### Image constraint item order

For each of the four auto layout constraints between the image and the scroll view: **first item must be image** (and not superview).

<img src='https://raw.githubusercontent.com/evgenyneu/ios-imagescroll-swift/master/graphics/image_constraint.png' width='402' alt='image constraint item order'>


## Thanks

* [William Warby](https://www.flickr.com/photos/wwarby) for making the wallaby photo. http://www.flickr.com/photos/wwarby

* [cojoj](https://github.com/cojoj) for fixing [layout bug](https://github.com/evgenyneu/ios-imagescroll/issues/5) in iOS 8.

