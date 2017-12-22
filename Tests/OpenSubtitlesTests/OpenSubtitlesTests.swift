/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import Test
@testable import OpenSubtitles

import struct Foundation.URL

class OpenSubtitlesTests: TestCase {
    func testHash() {
        do {
            let url = URL(fileURLWithPath: #file)
                .deletingLastPathComponent()
                .appendingPathComponent("test_hash")
            let hash = try OpenSubtitles.calculateHash(forFileAtPath: url.path)
            assertEqual(hash, "94fdc97bd46b7804")

            assertThrowsError(try OpenSubtitles.calculateHash(
                forFileAtPath: URL(fileURLWithPath: #file).path)) { error in
                    let error = error as? OpenSubtitles.Hash.Error
                    assertEqual(error, .fileIsToSmall)
            }
        } catch {
            fail(String(describing: error))
        }
    }


    static var allTests = [
        ("testHash", testHash),
    ]
}
