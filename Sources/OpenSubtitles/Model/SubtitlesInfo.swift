/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

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
