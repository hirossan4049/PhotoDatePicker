Cocoapodsとかspmに登録はめんどくさいのでPR送ってください。


https://user-images.githubusercontent.com/50548952/121134210-1b9a8000-c86e-11eb-8611-8a4ab72b165a.mov

## Usage

TextHighlightMenu.swiftを適当にコピペして
下のように使う。


```swift
let view = TextHighlightMenu(frame: CGRect(origin: .zero, size: CGSize(width: 350, height: 54)))
view.center = self.view.center

view.lists = ["6/15", "7/15", "8/15", "9/15", "10/15", "11/15", "12/15"]
view.delegate = self

self.view.addSubview(view)
        
view.selected(index: 2)

extension ViewController: TextHighlightMenuDelegate {
    func textHighlightMenuDelegate(_ textHighlightMenu: TextHighlightMenu, didSelectItemAt index: Int) {
        print("tapped", index)
    }
}
```
