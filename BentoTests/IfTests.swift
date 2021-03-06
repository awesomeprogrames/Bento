import Nimble
import XCTest
import UIKit
@testable import Bento

class IfTests: XCTestCase {

    func testSectionConditionalTrueConcatentation() {
        let section = Section<TestSectionId, TestRowId>(id: .first)

        let box = Box<TestSectionId, TestRowId>.empty
            |-? .iff(true, section)

        expect(box.sections.count) == 1
    }

    func testSectionConditionalTrueClosureConcatentation() {
        let section = Section<TestSectionId, TestRowId>(id: .first)

        let box = Box<TestSectionId, TestRowId>.empty
            |-? .iff(true) {
                section
            }

        expect(box.sections.count) == 1
    }

    func testSectionConditionalFalseConcatentation() {
        let section = Section<TestSectionId, TestRowId>(id: .first)

        let box = Box<TestSectionId, TestRowId>.empty
            |-? .iff(false, section)

        expect(box.sections.count) == 0
    }

    func testSectionConditionalFalseClosureConcatentation() {
        let section = Section<TestSectionId, TestRowId>(id: .first)

        let box = Box<TestSectionId, TestRowId>.empty
            |-? .iff(false) {
                section
            }

        expect(box.sections.count) == 0
    }

    func testNodeConditionalTrueConcatenation() {
        let section = Section<TestSectionId, TestRowId>(id: .first)
        let node = Node(id: TestRowId.first,
                        component: TestCustomEqualityRenderable(value: 0))

        let result = section
            |---? .iff(true, node)

        expect(result.items.count) == 1
    }

    func testNodeConditionalTrueClosureConcatenation() {
        let section = Section<TestSectionId, TestRowId>(id: .first)
        let node = Node(id: TestRowId.first,
                        component: TestCustomEqualityRenderable(value: 0))

        let result = section
            |---? .iff(true) {
                node
            }

        expect(result.items.count) == 1
    }

    func testNodeConditionalFalseConcatenation() {
        let section = Section<TestSectionId, TestRowId>(id: .first)
        let node = Node(id: TestRowId.first,
                        component: TestCustomEqualityRenderable(value: 0))

        let result = section
            |---? .iff(false, node)

        expect(result.items.count) == 0
    }

    func testNodeConditionalFalseClosureConcatenation() {
        let section = Section<TestSectionId, TestRowId>(id: .first)
        let node = Node(id: TestRowId.first,
                        component: TestCustomEqualityRenderable(value: 0))

        let result = section
            |---? .iff(false) {
                node
            }

        expect(result.items.count) == 0
    }
}
