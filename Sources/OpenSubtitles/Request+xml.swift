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

extension Request {
    convenience init(url: URL, xml: String) {
        self.init(method: .post, url: url)
        self.contentType = .xml
        self.bytes = [UInt8](xml.utf8)
    }
}
