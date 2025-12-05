# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.1.2] 2025-12-04

### Added

- `Get-PSubCoverArt` for retrieving cover art. Use `Get-PSubNowPlaying` and get
  the covertArt ID from the output, or pipe the output to `Get-PSubCoverArt`.
  If you don't provide a path for where to save the image, it will be saved to
  the temp folder, and a random file name will be used. The path to the image
  will be returned.

## [0.1.1] 2025-09-04

### Changed

- Set the minimum PowerShell version to 7.0.

## [0.1.0] 2025-09-04

Initial release
