//
//  File.swift
//  PreviewerDocument
//
//  Created by HuyVuong on 05/12/2022.
//

import Foundation

class File: NSObject {
  let url: URL

  init(url: URL) {
    self.url = url
  }

  var name: String {
    url.deletingPathExtension().lastPathComponent
  }
}

extension File {
  static func loadFiles() -> [File] {
    let fileManager = FileManager.default
    guard let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return [] }

    let urls: [URL]
    do {
      urls = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil)
    } catch {
      fatalError("Couldn't load files from documents directory")
    }

    return urls.map { File(url: $0) }
  }

  static func copyResourcesToDocumentsIfNeeded() {
    guard UserDefaults.standard.bool(forKey: "didCopyResources") else {
      let files = [
        Bundle.main.url(forResource: "test-xml", withExtension: "xml"),
        Bundle.main.url(forResource: "Water Spell.html", withExtension: "html"),
        Bundle.main.url(forResource: "sampleDOCX", withExtension: "docx"),
        Bundle.main.url(forResource: "sampleIMG", withExtension: "heic"),
        Bundle.main.url(forResource: "samplePDF", withExtension: "pdf"),
        Bundle.main.url(forResource: "samplePPT", withExtension: "ppt"),
        Bundle.main.url(forResource: "sampleTXT", withExtension: "txt"),
        Bundle.main.url(forResource: "sampleXLSX", withExtension: "xlsx")
      ]
        
      files.forEach {
        guard let url = $0 else { return }
        do {
          let newURL = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(url.lastPathComponent)
          try FileManager.default.copyItem(at: url, to: newURL)
        } catch {
          print(error.localizedDescription)
        }
      }

      UserDefaults.standard.set(true, forKey: "didCopyResources")
      return
    }
  }
}
