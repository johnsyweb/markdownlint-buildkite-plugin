# Markdown Lint Buildkite Plugin

Checks Markdown files and flags style issues.

## Example

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

### `version` (optional string)

Default: `latest`

Version of
[markdownlint](https://hub.docker.com/r/markdownlint/markdownlint/tags) image to
use.

## Developing

To run the tests:

```shell
docker-compose run --rm tests
```

## Contributing

1. Fork the repo
2. Make the changes
3. Run the tests
4. Commit and push your changes
5. Send a pull request
