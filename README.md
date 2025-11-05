# `initialFirstResponder` vs macOS Tahoe

This demo project illustrates a bug in macOS Tahoe that prevents `NSWindow.initialFirstResponder` from taking effect when used via `NSAlert.runModal` and invoked through a `DispatchQueue.main.async` or `DispatchQueue.main.sync` call. 

When running the demo app, unchecking the `Main Queue` checkbox makes the issue go away. The only difference then is that the `NSAlert.runModal` is not invoked through a `DispatchQueue.main` call.
