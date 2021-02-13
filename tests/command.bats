#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

#
# To debug stubs...
#
#     docker-compose run -eDEBUG_STUBS=1 --rm tests
#
if [[ ! -z "${DEBUG_STUBS}" ]]
then
   export DOCKER_STUB_DEBUG=/dev/tty
fi


@test "Checks *.md files by default" {
  run "$PWD/hooks/command"

  assert_output --partial "checking Markdown files (*.md)"
}

@test "Checks the pattern in BUILDKITE_PLUGIN_MARKDOWN_LINT_PATTERN" {
  export BUILDKITE_PLUGIN_MARKDOWN_LINT_PATTERN="*.markdown"

  run "$PWD/hooks/command"

  assert_output --partial "checking Markdown files (*.markdown)"
}

@test "Uses the latest Docker image by default" {
  export BUILDKITE_PLUGIN_MARKDOWN_LINT_PATTERN="README.md"

  _DOCKER_ARGS='run --rm -v /plugin:/mnt --workdir /mnt markdownlint/markdownlint:latest ./README.md'

  stub docker "${_DOCKER_ARGS} : echo 'Success'"

  run "$PWD/hooks/command"

  assert_success
  assert_output --partial "Success"
}

@test "Uses the BUILDKITE_PLUGIN_MARKDOWN_LINT_VERSION of Docker image if supplied" {
  export BUILDKITE_PLUGIN_MARKDOWN_LINT_PATTERN="README.md"
  export BUILDKITE_PLUGIN_MARKDOWN_LINT_VERSION="3.14"

  _DOCKER_ARGS='run --rm -v /plugin:/mnt --workdir /mnt markdownlint/markdownlint:3.14 ./README.md'

  stub docker "${_DOCKER_ARGS} : echo 'Success'"

  run "$PWD/hooks/command"

  assert_success
  assert_output --partial "Success"
}