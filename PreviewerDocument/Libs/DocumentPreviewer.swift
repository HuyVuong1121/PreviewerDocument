//
//  DocumentPreviewer.swift
//  PreviewerDocument
//
//  Created by HuyVuong on 05/12/2022.
//

import QuickLook

struct StoryboardName {
    static let DocumentPreviewer: String = "DocumentPreviewer"
}

protocol DocumentPreviewerViewProtocal: AnyObject {
    func attactView(url: URL?, fileName: String)
}

class DocumentPreviewer: UIViewController {
    @IBOutlet private weak var previewerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    private var dataUrl: URL?
    private var fileName: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        if let fileURL = dataUrl {
            titleLabel.text = fileName
            addSubView(url: fileURL)
        }
    }
    
    func addSubView(url: URL?) {
        guard let newURL = url as? NSURL else {
            return
        }
        let docpreview = QuickLookPreview(screen: self, url: newURL)
        self.addChild(docpreview)
        
        let width = self.previewerView.frame.size.width
        let height = self.previewerView.frame.size.height
        docpreview.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        docpreview.didMove(toParent: self)
        self.previewerView.addSubview(docpreview.view)
    }
    
    @IBAction func didTappedClosePreview(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

extension DocumentPreviewer: DocumentPreviewerViewProtocal {
    func attactView(url: URL?, fileName: String) {
        self.fileName = fileName
        dataUrl = url
    }
}
