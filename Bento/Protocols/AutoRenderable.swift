
public protocol AutoRenderable: Renderable {
    associatedtype StyleSheet: StyleSheetProtocol

    var configurator: (View) -> Void { get }
    var styleSheet: StyleSheet { get }
}

extension AutoRenderable where StyleSheet.Element == View {
    public func render(in view: View) {
        styleSheet.apply(to: view)
        configurator(view)
    }
}
