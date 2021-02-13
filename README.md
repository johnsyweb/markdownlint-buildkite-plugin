
# Markdown Lint Buildkite Plugin

Checks Markdown files and flags style issues.

## Introduction

Have you ever updated your README or other important documentation, to discover
later that it doesn't render the way you expected?

Has your team codified its Markdown style guide for a project using
[`.mdlrc`](https://github.com/markdownlint/markdownlint/blob/HEAD/docs/configuration.md)?

Does [Buildkite](https://buildkite.com/) already perform checks on your repository?

This plugin is for ***you***!

## Development status [![Build status](https://badge.buildkite.com/09b4204f57717fd8183caad453e80f925c71599f56682fb645.svg)](https://buildkite.com/johnsyweb/markdown-lint-buildkite-plugin)

This plugin was developed following Buildkite's [Writing
Plugins](https://buildkite.com/docs/plugins/writing) guide. It will be useful on
some projects at work but I wrote it in my own time and haven't had a chance to
try it at work yet. Perhaps check the
[pulse](https://github.com/johnsyweb/markdownlint-buildkite-plugin/pulse) to see
if it's used.

Meta: [This README is tested linted this plugin.](https://github.com/johnsyweb/markdownlint-buildkite-plugin/commit/909e7b097822d6a430c5b00f4c85346fc5f4b1af)

To run the tests locally:

```shell
./scripts/test
```

## Getting started

Add the following to your `pipeline.yml`:

```yml
steps:
  - label: ":markdown: Markdown Lint"
    plugins:
      - johnsyweb/markdownlint#v1.0.0:
          pattern: '*.md'
```

## Configuration

### `pattern` (optional, string)

Default: `*.md`

The file name pattern, for example `*.md` or `*.markdown`. Supports any pattern
supported by [find -name](http://man7.org/linux/man-pages/man1/find.1.html).

### `version` (optional, string)

Default: `latest`

Version of
[markdownlint](https://hub.docker.com/r/markdownlint/markdownlint/tags) image to
use.

## Requirements

- [Docker](https://www.docker.com/)

## Contact

- [GitHub project](https://github.com/johnsyweb/markdownlint-buildkite-plugin)
- Bug reports and feature requests are welcome via [GitHub Issues](https://github.com/johnsyweb/markdownlint-buildkite-plugin/issues)

## Maintainers

- [Pete Johns](https://github.com/johnsyweb)

## License [![license](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square)](https://github.com/johnsyweb/markdownlint-buildkite-plugin/blob/HEAD/LICENSE.txt)

`markdownlint-buildkite-plugin` uses MIT license. See
[`LICENSE.txt`](https://github.com/johnsyweb/markdownlint-buildkite-plugin/blob/HEAD/LICENSE.txt)
for details.

## Code of Conduct

We welcome contribution from everyone. Read more about it in
[`CODE_OF_CONDUCT.md`](https://github.com/johnsyweb/markdownlint-buildkite-plugin/blob/HEAD/CODE_OF_CONDUCT.md)

## Contributing [![PRs welcome](https://img.shields.io/badge/PRs-welcome-orange.svg?style=flat-square)](https://github.com/johnsyweb/markdownlint-buildkite-plugin/issues)

For bug fixes, documentation changes, and features:

1. [Fork it](./fork)
1. Create your feature branch (`git switch -c my-new-feature`)
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Run the tests (`./scripts/test`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create a new Pull Request

For larger new features: Do everything as above, but first also make contact
with the project maintainers to be sure your change fits with the project
direction and you won't be wasting effort going in the wrong direction.
