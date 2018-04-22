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

public struct SubtitlesInfo {
    public var id: String
    public var movieName: String
    public var language: Language

    public var seriesSeason: Int
    public var seriesEpisode: Int

    public var format: Format
    public var userRank: UserRank

    public var isFromTrusted: Bool
    public var isHearingImpaired: Bool

    public var size: Int
    public var encoding: Encoding
    public var downloadsCount: Int
    public var downloadLink: String
}

extension SubtitlesInfo: CustomStringConvertible {
    public var description: String {
        return """
        {
          subHearingImpaired: \(isHearingImpaired)
          subEncoding: \(encoding)
          userRank: \(userRank.rawValue)
          idSubtitleFile: \(id)
          subLanguageID: \(language)
          movieName: \(movieName)
          subSize: \(size)
          subDownloadsCount: \(downloadsCount)
          seriesSeason: \(seriesSeason)
          seriesEpisode: \(seriesEpisode)
          subFormat: \(format)
          subDownloadLink: \(downloadLink)
          subFromTrusted: \(isFromTrusted)
        }
        """
    }
}
