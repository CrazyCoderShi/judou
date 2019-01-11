import Cocoa


class SignInView: NSView {
    
    override init(frame frameRect: NSRect) {
        super.init(frame:frameRect);
//        Bundle.main.loadNibNamed(NSNib.Name(rawValue: "SignInView"), owner: self, topLevelObjects: nil);
//        self.view.frame = NSMakeRect(0, 0, frame.size.width, frame.size.height);
//        self.addSubview(view);
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder);
    }
}
