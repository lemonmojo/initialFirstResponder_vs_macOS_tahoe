import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet private var window: NSWindow!
    @IBOutlet private weak var checkBoxMainQueue: NSButton!
    
    private var invokeOnMainQueue: Bool {
        checkBoxMainQueue.state == .on
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.showAlert(onMainQueue: self.invokeOnMainQueue)
    }
    
    @IBAction private func showAlert_action(_ sender: Any) {
        showAlert(onMainQueue: self.invokeOnMainQueue)
    }
    
    private func showAlert(onMainQueue: Bool) {
        if onMainQueue {
            DispatchQueue.main.async(execute: show)
        } else {
            show()
        }
        
        func show() {
            let alert = NSAlert()
            
            alert.alertStyle = .informational
            alert.messageText = "NSAlert with initialFirstResponder"
            alert.informativeText = "The textfield should be focused."
            
            alert.addButton(withTitle: "OK")
            
            let box = NSView(frame: .init(x: 0, y: 0, width: 300, height: 20))
            
            let textField = NSTextField(string: "")
            textField.frame = box.bounds
            textField.placeholderString = "Should be focused"
            
            box.addSubview(textField)
            
            alert.accessoryView = box
            alert.window.initialFirstResponder = textField
            
            alert.runModal()
        }
    }
}
