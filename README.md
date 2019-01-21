
# ImgurProject
This is a DEMO iOS app that connect to the Imgur Api https://api.imgur.com/


## Description

Search image's post on Imgur Api and check the description and details about it.

Features:
* Search images list
* Post detail view
* Unit Testing with XCTest


## Installation
Install Carthage

https://github.com/Carthage/Carthage

## Run Carthage
carthage bootstrap --platform iOS --no-use-binaries


## Protocol Oriented Programming

POP is implemented in this DEMO, the protocols define the business logic:

```swift
// Protocol sample
protocol PostListPresenterType: PresenterType {
    var interactor: PostListInteractorType { get set }
    var router: PostListRouterType { get set }

    func startFetchingPost(query: String, page: String)
}

protocol PostListInteractorType: InteractorType {
    func fetchPosts(query: String, page: String)
}

protocol PostListRouterType: RouterType {
    func open(model: PostModelType, segue: UIStoryboardSegue)
}
```
