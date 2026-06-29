# `initialFirstResponder` vs macOS Tahoe

This demo project illustrates a bug in macOS Tahoe that prevents `NSWindow.initialFirstResponder` from taking effect when used via `NSAlert.runModal` and invoked through a `DispatchQueue.main.async` or `DispatchQueue.main.sync` call. 

When running the demo app, switching the `Mode` to either `performSelectorOnMainThread` or `Function Call` makes the issue go away. So the issue only manifests when the `NSAlert` is called through `DispatchQueue.main`.

## Update June 27 2026

This is now partially fixed in macOS 27 Beta 2.

The text field does indeed receive focus now in macOS 27 Beta 2 even if called through DispatchQueue.main.async/sync.
However, the cursor inside the textfield is not initially visible and it doesn't blink. That still only works when the alert is shown through `performSelectorOnMainThread` or a direct function call.
