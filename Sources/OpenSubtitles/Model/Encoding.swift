/******************************************************************************
 *                                                                            *
 * Tris Foundation disclaims copyright to this source code.                   *
 * In place of a legal notice, here is a blessing:                            *
 *                                                                            *
 *     May you do good and not evil.                                          *
 *     May you find forgiveness for yourself and forgive others.              *
 *     May you share freely, never taking more than you give.                 *
 *                                                                            *
 ******************************************************************************
 *  This file contains code that has not yet been described                   *
 ******************************************************************************/

public enum Encoding {
    case ascii
    case utf8
    case cp1252
    case other(String)

    public init(rawValue: String) {
        switch rawValue.lowercased() {
        case "ascii": self = .ascii
        case "utf-8": self = .utf8
        case "cp1252": self = .cp1252
        default: self = .other(rawValue)
        }
    }
}

extension Encoding: Equatable {
    public static func ==(lhs: Encoding, rhs: Encoding) -> Bool {
        switch (lhs, rhs) {
        case (.ascii, .ascii): return true
        case (.utf8, .utf8): return true
        case (.cp1252, .cp1252): return true
        case let (.other(lhs), .other(rhs)): return lhs == rhs
        default: return false
        }
    }
}
