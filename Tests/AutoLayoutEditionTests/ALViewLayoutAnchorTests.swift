import XCTest
import AutoLayoutEdition


final class ALViewLayoutAnchorTests: XCTestCase {
    
    var canvas: UIView!
    var view1: UIView!
    var view2: UIView!
    
    override func setUp() {
        super.setUp()
        canvas = UIView(frame: randomCanvasFrame())
        view1 = UIView()
        view2 = UIView()
        
        canvas.addSubview(view1)
        canvas.addSubview(view2)
    }
    
    func randomCanvasFrame() -> CGRect {
        let x = randomEvenNumber(in: 0...100)
        let y = randomEvenNumber(in: 0...100)
        let width = randomEvenNumber(in: 900...1400)
        let height = randomEvenNumber(in: 400...700)
        return .init(x: x, y: y, width: width, height: height)
    }
    
    func randomEvenNumber(in range: ClosedRange<Int>) -> Int {
        let number = Int.random(in: range)
        return number.isMultiple(of: 2) ? number : number + 1
    }
    
    func testAxis() {
        view1.anchor { anchor in
            anchor.top.equalTo(canvas)
            anchor.bottom.equalTo(canvas)
            anchor.leading.equalTo(canvas)
            anchor.trailing.equalTo(canvas)
        }
        
        canvas.layoutIfNeeded()
        
        XCTAssertEqual(view1.bounds.size, canvas.bounds.size)
    }
    
    func testAxisPadding() {
        view1.anchor { anchor in
            anchor.top.equalTo(canvas).padding(10)
            anchor.bottom.equalTo(canvas).padding(10)
            anchor.leading.equalTo(canvas).padding(10)
            anchor.trailing.equalTo(canvas).padding(10)
        }
        
        view2.anchor { anchor in
            anchor.top.equalTo(canvas).padding(-10)
            anchor.bottom.equalTo(canvas).padding(-10)
            anchor.leading.equalTo(canvas).padding(-10)
            anchor.trailing.equalTo(canvas).padding(-10)
        }
        
        canvas.layoutIfNeeded()
        
        XCTAssertEqual(view1.bounds.width, canvas.bounds.width - 20)
        XCTAssertEqual(view1.bounds.height, canvas.bounds.height - 20)
        
        XCTAssertEqual(view2.bounds.width, canvas.bounds.width + 20)
        XCTAssertEqual(view2.bounds.height, canvas.bounds.height + 20)
    }
    
    func testDimension() {
        view1.anchor { anchor in
            anchor.width.equalTo(canvas)
            anchor.height.equalTo(canvas)
        }
        
        canvas.layoutIfNeeded()
        
        XCTAssertEqual(view1.bounds.size, canvas.bounds.size)
    }
    
    func testDimensionAdding() {
        view1.anchor { anchor in
            anchor.width.equalTo(canvas).adding(20)
            anchor.height.equalTo(canvas).adding(20)
        }
        
        canvas.layoutIfNeeded()
        
        XCTAssertEqual(view1.bounds.width, canvas.bounds.width + 20)
        XCTAssertEqual(view1.bounds.height, canvas.bounds.height + 20)
    }
    
    func testDimensionSubtracting() {
        view1.anchor { anchor in
            anchor.width.equalTo(canvas).subtracting(20)
            anchor.height.equalTo(canvas).subtracting(20)
        }
        
        canvas.layoutIfNeeded()
        
        XCTAssertEqual(view1.bounds.width, canvas.bounds.width - 20)
        XCTAssertEqual(view1.bounds.height, canvas.bounds.height - 20)
    }
    
    func testPriority() {
        let anchor1 = view1.anchor
        anchor1.top.equalTo(canvas).priority(.high)
        anchor1.bottom.equalTo(canvas).priority(.high)
        anchor1.leading.equalTo(canvas).priority(.high)
        anchor1.trailing.equalTo(canvas).priority(.high)
        
        XCTAssertEqual(anchor1.top.constraint?.priority, .defaultHigh)
        XCTAssertEqual(anchor1.bottom.constraint?.priority, .defaultHigh)
        XCTAssertEqual(anchor1.leading.constraint?.priority, .defaultHigh)
        XCTAssertEqual(anchor1.trailing.constraint?.priority, .defaultHigh)
        
        let anchor2 = view2.anchor
        anchor2.width.equalTo(100).priority(.low)
        anchor2.height.equalTo(100).priority(.low)
        anchor2.firstBaseline.equalTo(canvas).priority(.low)
        anchor2.lastBaseline.equalTo(canvas).priority(.low)
        
        XCTAssertEqual(anchor2.width.constraint?.priority, .defaultLow)
        XCTAssertEqual(anchor2.width.constraint?.priority, .defaultLow)
        XCTAssertEqual(anchor2.width.constraint?.priority, .defaultLow)
        XCTAssertEqual(anchor2.width.constraint?.priority, .defaultLow)
    }
    
    func testHugging() {
        view1.anchor { anchor in
            anchor.width.equalTo(canvas).hugging(.high)
            anchor.height.equalTo(100).hugging(.low)
        }
        
        XCTAssertEqual(view1.contentHuggingPriority(for: .horizontal), .defaultHigh)
        XCTAssertEqual(view1.contentHuggingPriority(for: .vertical), .defaultLow)
    }
    
    func testUncompressed() {
        view1.anchor { anchor in
            anchor.width.equalTo(canvas).uncompressing(.high)
            anchor.height.equalTo(100).uncompressing(.low)
        }
        
        XCTAssertEqual(view1.contentCompressionResistancePriority(for: .horizontal), .defaultHigh)
        XCTAssertEqual(view1.contentCompressionResistancePriority(for: .vertical), .defaultLow)
    }
    
    func testPinTo() {
        view1.anchor.pinTo(canvas)
        
        canvas.layoutIfNeeded()
        
        XCTAssertEqual(view1.bounds, canvas.bounds)
    }
    
    func testPinToPadding() {
        view1.anchor.pinTo(canvas).padding(top: 10, leading: 20, bottom: 10, trailing: 20)
        
        canvas.layoutIfNeeded()
        
        XCTAssertEqual(view1.bounds.width, canvas.bounds.width - 40)
        XCTAssertEqual(view1.bounds.height, canvas.bounds.height - 20)
    }
    
    func testCenterTo() {
        view1.anchor.width.equalTo(100)
        view1.anchor.height.equalTo(100)
        view1.anchor.centerTo(canvas)
        
        canvas.layoutIfNeeded()
        
        XCTAssertEqual(view1.center.x, canvas.bounds.width / 2)
        XCTAssertEqual(view1.center.y, canvas.bounds.height / 2)
    }
    
    func testCenterToPadding() {
        view1.anchor.width.equalTo(100)
        view1.anchor.height.equalTo(100)
        view1.anchor.centerTo(canvas).padding(centerX: 10, centerY: 20)
        
        view2.anchor.width.equalTo(100)
        view2.anchor.height.equalTo(100)
        view2.anchor.centerTo(canvas).padding(centerX: -10, centerY: -20)
        
        canvas.layoutIfNeeded()
        
        XCTAssertEqual(view1.center.x, canvas.bounds.width / 2 + 10)
        XCTAssertEqual(view1.center.y, canvas.bounds.height / 2 + 20)
        
        XCTAssertEqual(view2.center.x, canvas.bounds.width / 2 - 10)
        XCTAssertEqual(view2.center.y, canvas.bounds.height / 2 - 20)
    }
    
    func testSizeTo() {
        view1.anchor.sizeTo(canvas)
        
        canvas.layoutIfNeeded()
        
        XCTAssertEqual(view1.bounds.size, canvas.bounds.size)
    }
    
    func testSizeToAdding() {
        view1.anchor.sizeTo(canvas).adding(width: 20, height: 40)
        
        canvas.layoutIfNeeded()
        
        XCTAssertEqual(view1.bounds.width, canvas.bounds.width + 20)
        XCTAssertEqual(view1.bounds.height, canvas.bounds.height + 40)
    }
    
    func testSizeToSubtracting() {
        view1.anchor.sizeTo(canvas).subtracting(width: 20, height: 40)
        
        canvas.layoutIfNeeded()
        
        XCTAssertEqual(view1.bounds.width, canvas.bounds.width - 20)
        XCTAssertEqual(view1.bounds.height, canvas.bounds.height - 40)
    }
}
