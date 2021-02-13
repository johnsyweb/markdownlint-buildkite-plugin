# Markdown Lint Buildkite Plugin

Checks Markdown files and flags style issues.

## Introduction

Have you ever updated your README or other important documentation, to discover
later that it doesn't render the way you expected?

Has your team codified its Markdown style guide for a project using [`.mdlrc`](https://github.com/markdownlint/markdownlint/blob/HEAD/docs/configuration.md)?

Does [Buildkite](https://buildkite.com/) already perform checks on your repository?

This plugin is for ***you***!

## Usage

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

## Developing

To run the tests locally:

```shell
docker-compose run --rm tests
```

## Contributing

1. Fork the repo
1. Make the changes
1. Run the tests
1. Commit and push your changes
1. Send a pull request
