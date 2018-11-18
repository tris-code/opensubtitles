/******************************************************************************
 *                                                                            *
 * Tris Foundation disclaims copyright to this source code.                   *
 * In place of a legal notice, here is a blessing:                            *
 *                                                                            *
 *     May you do good and not evil.                                          *
 *     May you find forgiveness for yourself and forgive others.              *
 *     May you share freely, never taking more than you give.                 *
 *                                                                            *
 ******************************************************************************/

import File

extension OpenSubtitles {
    public struct Hash {
        public enum Error: Swift.Error {
            case fileIsToSmall
            case cantOpenHandle
            case invalidFileLength
        }

        static let chunkSize: Int = 65_536

        static func calculate(path: String) throws -> UInt64 {
            var hash: UInt64 = 0

            let file = try File(at: path)
            let length = file.size
            guard length > 0 else {
                throw Error.invalidFileLength
            }
            guard length >= chunkSize else {
                throw Error.fileIsToSmall
            }
            
            hash = UInt64(length)

            func update(_ bytes: UnsafeRawBufferPointer) {
                hash = bytes.bindMemory(to: UInt64.self).reduce(hash, &+)
            }

            let stream = try file.open()

            try stream.read(count: chunkSize) { update($0) }
            try stream.seek(to: -chunkSize, from: .end)
            try stream.read(count: chunkSize) { update($0) }

            return hash
        }
    }
}
