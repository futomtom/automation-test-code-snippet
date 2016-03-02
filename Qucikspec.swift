安裝樣板



要以下兩步驟
Set "defines module" in your .xcodeproj to YES.
        To do this in Xcode: Choose your project, then "Build Settings" header, then "Defines Modules" line, then select "Yes".

    @testable import YourAppModuleName in your unit tests. This will expose Any public and internal (the default) symbols to your tests. private symbols are still unavailable.



設 Test Target for a Command Line Tool Project

    Add a target to your project in the project pane.
    Select "OS X Unit Testing Bundle".
    Edit the scheme of your main target.
    Select the "Test" node, click the "+" under the "Info" heading, and select your testing bundle.


it函數
it("名稱") { 閉包
      expect(Dolphin().isFriendly).to(beTruthy())
    }
    
Example Groups Using describe and context
describe函數
describe("名稱") {閉包
    it函數
    it函數
}


讓某些測試不要執行   在前面加x
xdescribe("its click") {
  不執行
}

xcontext("when the dolphin is not near anything interesting") {
  不執行
}

xit("is only emitted once") {
  不執行
}

只執行某些  在前面加f focus
fit("is loud") {
  // ...only this focused example will be run.
}

it("has a high frequency") {
  // ...this example is not focused, and will not be run.
}

fcontext("when the dolphin is near something interesting") {
  // ...examples in this group are also focused, so they'll be run.
}

設定
beforeEach(^{ dolphin = [Dolphin new]; });

beforeSuite {
      OceanDatabase.createDatabase(name: "test.db")
      OceanDatabase.connectToDatabase(name: "test.db")
    }

    afterSuite {
      OceanDatabase.teardownDatabase(name: "test.db")
    }



var viewController: BananaViewController!
beforeEach {
  // 1. Instantiate the storyboard. By default, it's name is "Main.storyboard".
  //    You'll need to use a different string here if the name of your storyboard is different.
  let storyboard = UIStoryboard(name: "Main", bundle: nil)
  // 2. Use the storyboard to instantiate the view controller.
  viewController = 
    storyboard.instantiateViewControllerWithIdentifier(
      "BananaViewControllerID") as! BananaViewController
}


// Swift
按鈕
describe("the 'more bananas' button") {
  it("increments the banana count label when tapped") {
    viewController.moreButton.sendActionsForControlEvents(
      UIControlEvents.TouchUpInside)
    expect(viewController.bananaCountLabel.text).to(equal("1"))
  }
}


類似的測試 SharedExamples.md
itBehavesLike