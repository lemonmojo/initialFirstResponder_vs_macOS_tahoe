# `initialFirstResponder` vs macOS Tahoe

This demo project illustrates a bug in macOS Tahoe that prevents `NSWindow.initialFirstResponder` from taking effect when used via `NSAlert.runModal` and invoked through a `DispatchQueue.main.async` or `DispatchQueue.main.sync` call. 

When running the demo app, switching the `Mode` to either `performSelectorOnMainThread` or `Function Call` makes the issue go away. So the issue only manifests when the `NSAlert` is called through `DispatchQueue.main`.
