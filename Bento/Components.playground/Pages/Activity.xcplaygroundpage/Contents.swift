import UIKit
import Bento
import BentoPlaygroundSupport
import PlaygroundSupport

let component = Component.Activity(isLoading: true)

PlaygroundPage.current.liveView = renderInTableView(component: component)
