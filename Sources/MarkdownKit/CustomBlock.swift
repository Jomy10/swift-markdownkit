//
//  CustomBlock.swift
//  MarkdownKit
//
//  Created by Matthias Zenger on 12/05/2021.
//  Copyright © 2021 Google LLC.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation

///
/// Protocol `CustomBlock` defines the interface of custom Markdown elements that are implemented
/// externally (i.e. not by the MarkdownKit framework).
///
public protocol CustomBlock: CustomStringConvertible, CustomDebugStringConvertible {
  func equals(to other: CustomBlock) -> Bool
  func parse(via parser: InlineParser) -> Block
  func generateHtml(via htmlGen: HtmlGenerator, tight: Bool) -> String
  #if !os(Linux)
  func generateHtml(via htmlGen: HtmlGenerator,
                    and attGen: AttributedStringGenerator?,
                    tight: Bool) -> String
  #endif
}
