//
//  UiExtension.swift
//  swiftui_mvvm
//
//  Created by MGunes on 15.09.2022.
//

import SwiftUI

extension View {
  @available(iOS, deprecated: 15.0, message: "No longer needed, use the default background modifier instead")
  func backgroundColor(_ color: Color) -> some View {
    modifier(BackgroundColorModifier(color: color))
  }
}

struct BackgroundColorModifier: ViewModifier {
  var color: Color

  func body(content: Content) -> some View {
    if #available(iOS 15.0, *) {
      content
        .background(color)
    } else {
      ZStack {
        color // background
        content
      }
    }
  }
}



