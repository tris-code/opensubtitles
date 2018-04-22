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

public enum Language {
    case eng
    case other(String)
}

extension Language {
    var rawValue: String {
        switch self {
        case .eng: return "eng"
        case .other(let language): return language
        }
    }

    init(rawValue: String) {
        switch rawValue {
        case "eng": self = .eng
        default: self = .other(rawValue)
        }
    }
}
