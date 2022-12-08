# PreviewerDocument
QuickLook is a framework that helps solve a common challenge many developers face: showing files to the user.

When it comes to previewing files, QuickLook is a great first choice. It comes with several common features every user expects, like pinch-to-zoom, audio playback and PDF pages. You can even let users add markups on images and PDFs, as well as simple video edits.

	- Here are some of the supported file types:
	- Images
	- Audio and video files
	- PDFs
	- HTML documents
	- iWork and Microsoft Office documents
	- ZIP files
	- Augmented reality objects that use the USDZ file format, iOS and iPadOS only

Example:

![](screenshots/example.gif)

## Usage

 ```swift
let screen = UIStoryboard(name: StoryboardName.DocumentPreviewer, bundle: nil).instantiateViewController(viewControllerType: DocumentPreviewer.self)
screen.attactView(url: url, fileName: name)
screen.modalPresentationStyle = .fullScreen
navigationController?.present(screen, animated: true)
 ```
## License
CustomSlider is available under the MIT license. See the LICENSE file for more info.
