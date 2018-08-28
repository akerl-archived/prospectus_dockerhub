prospectus_dockerhub
=========

[![Gem Version](https://img.shields.io/gem/v/prospectus_dockerhub.svg)](https://rubygems.org/gems/prospectus_dockerhub)
[![Build Status](https://img.shields.io/travis/com/akerl/prospectus_dockerhub.svg)](https://travis-ci.com/akerl/prospectus_dockerhub)
[![Coverage Status](https://img.shields.io/codecov/c/github/akerl/prospectus_dockerhub.svg)](https://codecov.io/github/akerl/prospectus_dockerhub)
[![Code Quality](https://img.shields.io/codacy/1ca88a296d274ee69deb247d67ac06f9.svg)](https://www.codacy.com/app/akerl/prospectus_dockerhub)
[![MIT Licensed](https://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

[Prospectus](https://github.com/akerl/prospectus) helpers for checking docker hub build status

## Usage

Add the following 2 lines to the .prospectus:

```
## Add this at the top
Prospectus.extra_dep('file', 'prospectus_dockerhub')

## Add this inside your item that has a build
extend Prospectusdockerhub.build('ORG/REPO')
```

## Installation

    gem install prospectus_dockerhub

## License

prospectus_dockerhub is released under the MIT License. See the bundled LICENSE file for details.

