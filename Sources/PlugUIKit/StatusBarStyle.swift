//
//  StatusBarStyle.swift
//  
//
//  Created by Admin on 8/13/21.
//

import SwiftUI

public class LocalStatusBarStyle { // style proxy to be stored in Environment
    fileprivate var getter: () -> UIStatusBarStyle = { .darkContent }
    fileprivate var setter: (UIStatusBarStyle) -> Void = {_ in}

    public var currentStyle: UIStatusBarStyle {
        get { self.getter() }
        set { self.setter(newValue) }
    }
}

class PgUiHostingController<Content>: UIHostingController<Content> where Content:View {
    private var internalStyle = UIStatusBarStyle.darkContent

    @objc override dynamic open var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            internalStyle
        }
        set {
            internalStyle = newValue
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }

    override init(rootView: Content) {
        super.init(rootView:rootView)
        LocalStatusBarStyleKey.defaultValue.getter = { self.preferredStatusBarStyle }
        LocalStatusBarStyleKey.defaultValue.setter = { self.preferredStatusBarStyle = $0 }
    }

    @objc required dynamic init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

public struct PgUiRootView<Content: View>: View {
    public var content: Content
    
    public init(@ViewBuilder content: () -> (Content)) {
        self.content = content()
    }
    
    public var body: some View {
        EmptyView().onAppear{
            UIApplication.shared.setHostingController(rootView: AnyView(content))
        }
    }
}


extension UIApplication {
    static var hostingController: PgUiHostingController<AnyView>? = nil
    func setHostingController(rootView: AnyView) {
        let hostingController = PgUiHostingController(rootView: AnyView(rootView))
        windows.first?.rootViewController = hostingController
        UIApplication.hostingController = hostingController
    }
}

