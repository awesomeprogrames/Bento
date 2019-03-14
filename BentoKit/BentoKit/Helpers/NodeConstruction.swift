import Bento

precedencegroup NodeConstruction {
    associativity: left
    higherThan: NodeConcatenationPrecedence
}

infix operator ++ : NodeConstruction

public func ++ <RowId, R: Renderable>(id: RowId, component: R) -> Node<RowId> {
    return Node(id: id, component: component)
}
