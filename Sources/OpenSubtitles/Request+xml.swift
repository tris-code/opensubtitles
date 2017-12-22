/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

import HTTP

extension ContentType {
    static let xml = ContentType(mediaType: .text(.xml))!
}

extension Request {
    init(url: URL, xml: String) {
        var request = Request(method: .post, url: url)
        request.contentType = .xml
        request.rawBody = [UInt8](xml.utf8)
        self = request
    }
}
