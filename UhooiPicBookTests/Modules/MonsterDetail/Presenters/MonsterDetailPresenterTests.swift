//
//  MonsterDetailPresenterTests.swift
//  UhooiPicBookTests
//
//  Created by uhooi on 04/03/2020.
//  Copyright © 2020 THE Uhooi. All rights reserved.
//

import XCTest
@testable import UhooiPicBook

final class MonsterDetailPresenterTests: XCTestCase {

    // MARK: Stored Instance Properties

    private var viewMock: MonsterDetailUserInterfaceMock!
    private var interactorMock: MonsterDetailInteractorInputMock!
    private var routerMock: MonsterDetailRouterInputMock!
    private var presenter: MonsterDetailPresenter!

    // MARK: TestCase Life-Cycle Methods

    @MainActor
    override func setUpWithError() throws {
        reset()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Test Methods

    // MARK: MonsterDetailEventHandler

    // MARK: viewDidLoad()

    @MainActor
    func test_viewDidLoad() async {
        presenter.viewDidLoad()
    }
    
    // MARK: didTapDancingImageView()
    
    @MainActor
    func test_didTapDancingImageView_notNil() async {
        presenter.didTapDancingImageView(dancingImage: UIImage())
        
        XCTAssertEqual(routerMock.popupDancingImageCallCount, 1)
    }
    
    @MainActor
    func test_didTapDancingImageView_nil() async {
        presenter.didTapDancingImageView(dancingImage: nil)
        
        XCTAssertEqual(routerMock.popupDancingImageCallCount, 0)
    }
    
    // MARK: didTapShareButton()
    
    @MainActor
    func test_didTapShareButton_one_nil() async {
        typealias TestCase = (senderView: UIView?, name: String?, description: String?, icon: UIImage?, line: UInt)
        let testCases: [TestCase] = [
            (nil, "name", "description", UIImage(), #line),
            (UIView(), nil, "description", UIImage(), #line),
            (UIView(), "name", nil, UIImage(), #line),
            (UIView(), "name", "description", nil, #line)
        ]
        
        for (senderView, name, description, icon, line) in testCases {
            presenter.didTapShareButton(senderView, name: name, description: description, icon: icon)
            XCTAssertEqual(routerMock.showActivityCallCount, 0, line: line)
        }
    }
    
    @MainActor
    func test_didTapShareButton_all_notNil() async {
        let senderView = UIView()
        let name = "name"
        let description = "description"
        let icon = UIImage()
        routerMock.showActivityHandler = { sourceView, text, image in
            XCTAssertEqual(text, "\(name)\n\(description)\n#UhooiPicBook")
            XCTAssertEqual(sourceView, senderView)
            XCTAssertEqual(image, icon)
        }
        
        presenter.didTapShareButton(senderView, name: name, description: description, icon: icon)

        XCTAssertEqual(routerMock.showActivityCallCount, 1)
    }

    // MARK: MonsterDetailInteractorOutput

    // MARK: - Other Private Methods

    @MainActor
    private func reset() {
        self.viewMock = MonsterDetailUserInterfaceMock()
        self.interactorMock = MonsterDetailInteractorInputMock()
        self.routerMock = MonsterDetailRouterInputMock()
        self.presenter = MonsterDetailPresenter(
            view: self.viewMock,
            interactor: self.interactorMock,
            router: self.routerMock
        )
    }

}
