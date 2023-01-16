//
//  QuickLookPreview.swift
//  QuickLookPreview
//
//  Created by HuyVuong on 05/12/2022.
//

import Foundation
import QuickLook

class QuickLookPreview: QLPreviewController, QLPreviewControllerDataSource, QLPreviewControllerDelegate {
    
    private var fileURL = NSURL()

    init(screen: UIViewController, url: NSURL) {
        super.init(nibName: nil, bundle: nil)
        self.fileURL = url
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if QLPreviewController.canPreview(fileURL as QLPreviewItem) {
            self.currentPreviewItemIndex = 0
            self.dataSource = self
            self.delegate = self
            self.reloadData()
        } else {
            print("Item not supported by QLPreviewController")
        }
    }

    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
       1
    }

    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        fileURL
    }
}
