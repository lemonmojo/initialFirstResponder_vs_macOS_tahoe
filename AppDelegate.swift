import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet private var window: NSWindow!
    @IBOutlet weak var popupButtonMode: NSPopUpButton!
    
    enum InvocationMode {
        case dispatchQueueMainAsync
        case performSelectorOnMainThread
        case functionCall
    }
    
    private var invocationMode: InvocationMode {
        switch popupButtonMode.indexOfSelectedItem {
        case 0:
            .dispatchQueueMainAsync
        case 1:
            .performSelectorOnMainThread
        case 2:
            .functionCall
        default:
            fatalError("Invalid Invocation Mode")
        }
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        self.showAlert(invocationMode: self.invocationMode)
    }
    
    @IBAction private func showAlert_action(_ sender: Any) {
        self.showAlert(invocationMode: self.invocationMode)
    }
    
    private func showAlert(invocationMode: InvocationMode) {
        switch invocationMode {
        case .dispatchQueueMainAsync:
            DispatchQueue.main.async(execute: _showAlert)
        case .performSelectorOnMainThread:
            performSelector(onMainThread: #selector(_showAlert),
                            with: nil,
                            waitUntilDone: false)
        case .functionCall:
            _showAlert()
        }
    }
    
    @objc
    func _showAlert() {
        let alert = NSAlert()
        
        alert.messageText = "NSAlert with initialFirstResponder"
        alert.informativeText = "The textfield should be focused."
        
        alert.addButton(withTitle: "OK")
        
        let textField = NSTextField(string: "")
        textField.frame = .init(x: 0, y: 0, width: 300, height: 20)
        textField.placeholderString = "Should be focused"
        
        alert.accessoryView = textField
        alert.window.initialFirstResponder = textField
        
        alert.runModal()
    }
}
