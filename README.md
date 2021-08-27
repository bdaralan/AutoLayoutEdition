# AutoLayoutEdition

An auto layout wrapper that makes using auto layout less verbose.

## Features

- Support chain call.
- Automatically activate, deactivate, and remove constraints.
- Store constraints for later modification if needed.
- Setup constraints using one-line or block.

## Implementation

No magic codes, just wrapping auto layout in some `protocol`, `struct`, and `enum`.

### Main Components

- `ALLayoutAnchor` is used to lay out constraints.
  - `ALViewLayoutAnchor`
  - `ALGuideLayoutAnchor`
- `ALLayoutStore` is used to activate, deactivate, remove, and store constraints.
  - `ALViewLayoutStore`
  - `ALGuideLayoutStore`
- `ALAnchor` is used to specify the anchor to be laid out.
  - `ALXAxisAnchor`
  - `ALYAxisAnchor`
  - `ALDimensionAnchor`
  - `ALEdgeAnchor`
  - `ALCenterAnchor`
  - `ALSizeAnchor`

## Example Code

### Create Constraints

``` Swift
--Canvas---------------------------------
|                   40                  |
|    -------------------------------    |
|    |                             |    |
|    |         ImageView          250   |
|    |                             |    |
|    -------------------------0.75--    |
|                   8                   |
|             -------------             |
|             |   Label   |             |
|             -------------             |
|                                       |
|                                       |
--BackgroundView-------------------------

let canvas = UIView()
let backgroundView = UIView()
let imageView = UIImageView()
let label = UILabel()

canvas.addSubview(backgroundView)
canvas.addSubview(imageView)
canvas.addSubview(label)

// one-line setup
backgroundView.anchor.edges.equalTo(canvas)

// block setup
imageView.anchor { anchor in
    anchor.top.equalTo(canvas).padding(40)
    anchor.width.equalTo(canvas).multiplier(0.75)
    anchor.height.equalTo(250)
}

label.anchor { anchor in
    anchor.top.equalTo(imageView.anchor.bottom).padding(8)
    anchor.centerX.equalTo(imageView)
    anchor.width.lessOrEqualTo(imageView)
}
```

### Update Constraints

``` Swift
let canvas = UIView()
let imageView = UIImageView()

canvas.addSubview(imageView)

// grab an anchor object form imageView and keep using that one
// store it somewhere if needed (see UIView.anchor documentation)
let imageAnchor = imageView.anchor

// initial constraints
imageAnchor.center.equalTo(canvas)
imageAnchor.width.equalTo(canvas).multiplier(0.5)
imageAnchor.height.equalTo(250)
```

``` Swift
// ----------
// EXAMPLE 1: Need to update width to 0.8 multiplier of canvas
// ----------

// apply the same constraint with 0.8 multiplier
imageAnchor.width.equalTo(canvas).multiplier(0.8)

// or omit the paramater since the inital setup is also width.equalTo(canvas)
// think of this as accessing the previous width.equalTo(...) constraint and update it
imageAnchor.width.equalTo.multiplier(0.8)
```

``` Swift
// ----------
// EXAMPLE 2: Need to update width to 0.5 multiplier of canvas's other subview (otherView)
// ----------

// width.equalTo(otherView) here will automatically remove the initial width.equalTo(canvas)
imageAnchor.width.equalTo(otherView).multiplier(0.5)
```

``` Swift
// ----------
// EXAMPLE 3: View controller example
// ----------

class SomeViewController: UIViewController {

    private let imageView = UIImageView()

    // hold on to imageView's anchor to update its size later
    //
    // accessing anchor property always return a new object (see UIView.anchor documentation)
    private lazy var imageAnchor = imageView.anchor

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(imageView)

        // initial constraints
        imageAnchor.width.equalTo(100)
        imageAnchor.height.equalTo(100)
        imageAnchor.center.equalTo(view)

        // setup event handler to call appropriated method...
    }

    private func setSmallSizeImage() {
        // set width and heigh equal to constant
        imageAnchor.width.equalTo(100)
        imageAnchor.height.equalTo(100)
    }

    private func setMediumSizeImage() {
        // set width and heigh equal to constant
        imageAnchor.width.equalTo(300)
        imageAnchor.height.equalTo(300)
    }

    private func setLargeSizeImage() {
        // size.equalTo(view) = width.equalTo(view) & heigh.equalTo(view)
        imageAnchor.size.equalTo(view).multiplier(0.8)
    }
}
```
