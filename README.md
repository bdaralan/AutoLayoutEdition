# AutoLayoutEdition

An auto layout wrapper that makes using auto layout less verbose.

## Features

- Support chain call.
- Store constraints for easy activation and deactivation.
- Setup constraints using one-line or block.

## Implementation

No fancy codes, just wrapping auto layout in some `protocol`, `struct`, and `enum`.

### Main Components

- `ALLayoutAnchor` for laying out constraints.
  - `ALViewLayoutAnchor`
  - `ALGuideLayoutAnchor`
- `ALLayoutStore` for activating and storing constraints.
  - `ALViewLayoutStore`
  - `ALGuideLayoutStore`
- `ALAnchor` for specifying constraint's type
  - `ALXAxisAnchor`
  - `ALYAxisAnchor`
  - `ALDimensionAnchor`
  - `ALEdgeAnchor`
  - `ALCenterAnchor`
  - `ALSizeAnchor`

## Example Code

### Set Constraints

Setting up constraints in general.

``` Swift
--Canvas--------------------------------
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
--BackgroundView------------------------

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

Modifying the same constraint will automatically deactivate the old constraint.

``` Swift
class SomeViewController: UIViewController {

    let imageView = UIImageView()

    // use the same value of imageView's anchor to update its size later.
    lazy var imageAnchor = imageView.anchor

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(imageView)

        imageAnchor.width.equalTo(100)
        imageAnchor.height.equalTo(100)
        imageAnchor.center.equalTo(view)

        // setup condition handlers...
    }

    func handleSmallSizeConditionTriggered() {
        imageAnchor.width.equalTo(100)
        imageAnchor.height.equalTo(100)
    }

    func handleMediumSizeConditionTriggered() {
        imageAnchor.width.equalTo(300)
        imageAnchor.height.equalTo(300)
    }

    func handleLargeSizeConditionTriggered() {
        imageAnchor.size.equalTo(view).multiplier(0.9)
    }
}
```

### What is considered the same constraint?

``` Swift
// the same constraint: 'width.equalTo`
create: anchor.width.equalTo(100)
update: anchor.width.equalTo(300)

// the same constraints: 'size.equalTo' is 'width.equalTo' and 'height.equalTo'
create: anchor.width.equalTo(100)
        anchor.height.equalTo(200)
update: anchor.size.equalTo(superview).multiplier(0.5)
```
