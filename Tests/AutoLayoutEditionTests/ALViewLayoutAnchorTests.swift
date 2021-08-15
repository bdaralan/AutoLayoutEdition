import XCTest
import AutoLayoutEdition


final class ALViewLayoutAnchorTests: XCTestCase {
    
    var view1: UIView!
    var view2: UIView!
    var view3: UIView!
    var view4: UIView!
    
    var label1: UILabel!
    var label2: UILabel!
    var label3: UILabel!
    var label4: UILabel!
    
    var canvas: UIView!
    
    override func setUp() {
        super.setUp()
        view1 = UIView()
        view2 = UIView()
        view3 = UIView()
        view4 = UIView()
        
        label1 = UILabel()
        label1.text = "LABEL 1: SHORT"
        
        label2 = UILabel()
        label2.text = "LABEL 2: MEDIUM WIDTH"
        
        label3 = UILabel()
        label3.text = "LABEL 3: LONG TEXT HORIZONTALLY"
        
        label4 = UILabel()
        label4.text = "LABEL 4: VERY LONG TEXT IN THE HORIZONTAL AXIS"
        
        canvas = UIView(frame: randomCanvasFrame())
        canvas.addSubview(view1)
        canvas.addSubview(view2)
        canvas.addSubview(view3)
        canvas.addSubview(view4)
        canvas.addSubview(label1)
        canvas.addSubview(label2)
        canvas.addSubview(label3)
        canvas.addSubview(label4)
    }
    
    func randomCanvasFrame(_ random: Bool = true) -> CGRect {
        guard random else { return .init(x: 0, y: 0, width: 900, height: 400) }
        let x = randomEvenNumber(in: 0...100)
        let y = randomEvenNumber(in: 0...200)
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
        
        view2.anchor { anchor in
            anchor.top.greaterOrEqualTo(canvas)
            anchor.bottom.greaterOrEqualTo(canvas)
            anchor.leading.greaterOrEqualTo(canvas)
            anchor.trailing.greaterOrEqualTo(canvas)
        }
        
        label1.anchor { anchor in
            anchor.top.greaterOrEqualTo(canvas)
            anchor.bottom.greaterOrEqualTo(canvas)
            anchor.leading.greaterOrEqualTo(canvas)
            anchor.trailing.greaterOrEqualTo(canvas)
        }
        
        label2.anchor { anchor in
            anchor.top.equalTo(canvas)
            anchor.bottom.equalTo(canvas)
            anchor.leading.equalTo(canvas)
            anchor.trailing.equalTo(canvas)
        }
        
        canvas.layoutIfNeeded()
        
        XCTAssertEqual(view1.bounds, canvas.bounds)
        
        XCTAssertLessThan(view2.bounds.width, canvas.bounds.width)
        XCTAssertLessThan(view2.bounds.height, canvas.bounds.height)
        
        XCTAssertLessThan(label1.bounds.width, canvas.bounds.width)
        XCTAssertLessThan(label1.bounds.height, canvas.bounds.height)
        
        XCTAssertEqual(label2.bounds, canvas.bounds)
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
        
        view3.anchor { anchor in
            anchor.top.lessOrEqualTo(canvas).padding(-10)
            anchor.bottom.lessOrEqualTo(canvas).padding(-10)
            anchor.leading.lessOrEqualTo(canvas).padding(-10)
            anchor.trailing.lessOrEqualTo(canvas).padding(-10)
        }
        
        canvas.layoutIfNeeded()
        
        XCTAssertEqual(view1.bounds.width, canvas.bounds.width - 20)
        XCTAssertEqual(view1.bounds.height, canvas.bounds.height - 20)
        
        XCTAssertEqual(view2.bounds.width, canvas.bounds.width + 20)
        XCTAssertEqual(view2.bounds.height, canvas.bounds.height + 20)
        
        XCTAssertGreaterThan(view3.bounds.width, canvas.bounds.width)
        XCTAssertGreaterThan(view3.bounds.height, canvas.bounds.height)
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

        let store1 = anchor1.store
        XCTAssertEqual(store1.constraint(for: .top, relation: .equalTo)?.priority, .defaultHigh)
        XCTAssertEqual(store1.constraint(for: .bottom, relation: .equalTo)?.priority, .defaultHigh)
        XCTAssertEqual(store1.constraint(for: .leading, relation: .equalTo)?.priority, .defaultHigh)
        XCTAssertEqual(store1.constraint(for: .trailing, relation: .equalTo)?.priority, .defaultHigh)

        let anchor2 = view2.anchor
        anchor2.width.equalTo(100).priority(.low)
        anchor2.height.equalTo(100).priority(.low)
        anchor2.firstBaseline.equalTo(canvas).priority(.low)
        anchor2.lastBaseline.equalTo(canvas).priority(.low)

        let store2 = anchor2.store
        XCTAssertEqual(store2.constraint(for: .width, relation: .equalToConstant)?.priority, .defaultLow)
        XCTAssertEqual(store2.constraint(for: .height, relation: .equalToConstant)?.priority, .defaultLow)
        XCTAssertEqual(store2.constraint(for: .firstBaseline, relation: .equalTo)?.priority, .defaultLow)
        XCTAssertEqual(store2.constraint(for: .lastBaseline, relation: .equalTo)?.priority, .defaultLow)
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
    
    func testEdges() {
        view1.anchor.edges.equalTo(canvas)
        
        canvas.layoutIfNeeded()
        
        XCTAssertEqual(view1.bounds, canvas.bounds)
    }
    
    func testEdgesPadding() {
        view1.anchor.edges.equalTo(canvas).padding(top: 10, leading: 20, bottom: 10, trailing: 20)
        
        canvas.layoutIfNeeded()
        
        XCTAssertEqual(view1.bounds.width, canvas.bounds.width - 40)
        XCTAssertEqual(view1.bounds.height, canvas.bounds.height - 20)
    }
    
    func testCenter() {
        view1.anchor.center.equalTo(canvas)
        view1.anchor.width.equalTo(100)
        view1.anchor.height.equalTo(100)
        
        canvas.layoutIfNeeded()
        
        XCTAssertEqual(view1.center.x, canvas.bounds.width / 2)
        XCTAssertEqual(view1.center.y, canvas.bounds.height / 2)
    }
    
    func testCenterPadding() {
        view1.anchor.center.equalTo(canvas).padding(x: 10, y: 20)
        view1.anchor.width.equalTo(100)
        view1.anchor.height.equalTo(100)
        
        view2.anchor.center.equalTo(canvas).padding(x: -10, y: -20)
        view2.anchor.width.equalTo(100)
        view2.anchor.height.equalTo(100)
        
        canvas.layoutIfNeeded()
        
        XCTAssertEqual(view1.center.x, canvas.bounds.width / 2 + 10)
        XCTAssertEqual(view1.center.y, canvas.bounds.height / 2 + 20)
        
        XCTAssertEqual(view2.center.x, canvas.bounds.width / 2 - 10)
        XCTAssertEqual(view2.center.y, canvas.bounds.height / 2 - 20)
    }
    
    func testSize() {
        view1.anchor.size.equalTo(canvas)
        
        canvas.layoutIfNeeded()
        
        XCTAssertEqual(view1.bounds.size, canvas.bounds.size)
    }
    
    func testSizeAdding() {
        view1.anchor.size.equalTo(canvas).adding(width: 20, height: 40)
        
        canvas.layoutIfNeeded()
        
        XCTAssertEqual(view1.bounds.width, canvas.bounds.width + 20)
        XCTAssertEqual(view1.bounds.height, canvas.bounds.height + 40)
    }
    
    func testSizeSubtracting() {
        view1.anchor.size.equalTo(canvas).subtracting(width: 20, height: 40)
        
        canvas.layoutIfNeeded()
        
        XCTAssertEqual(view1.bounds.width, canvas.bounds.width - 20)
        XCTAssertEqual(view1.bounds.height, canvas.bounds.height - 40)
    }
}
