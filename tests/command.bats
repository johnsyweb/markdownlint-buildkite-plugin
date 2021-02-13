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
   export FIND_STUB_DEBUG=/dev/tty
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
  _FIND_ARGS='. -name "*.md" -print0'
  _DOCKER_ARGS='run --rm -v /plugin:/mnt --workdir /mnt markdownlint/markdownlint:latest ./README.md'

  stub find "${_FIND_ARGS} : echo './SOMETHING.md'"
  stub docker "${_DOCKER_ARGS} : echo 'Success'"

  run "$PWD/hooks/command"

  assert_success
  assert_output --partial "Beautiful"
}

@test "Uses the BUILDKITE_PLUGIN_MARKDOWN_LINT_VERSION of Docker image if supplied" {
  export BUILDKITE_PLUGIN_MARKDOWN_LINT_VERSION="3.14"

  _FIND_ARGS='. -name "*.md" -print0'
  _DOCKER_ARGS='run --rm -v /plugin:/mnt --workdir /mnt markdownlint/markdownlint:3.14 ./README.md'

  stub find "${_FIND_ARGS} : echo './SOMETHING.md'"
  stub docker "${_DOCKER_ARGS} : echo 'Success'"

  run "$PWD/hooks/command"

  assert_success
  assert_output --partial "Beautiful"
}