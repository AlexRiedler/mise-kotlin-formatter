# mise tool plugin for kotlin-formatter

A [mise](https://mise.jdx.dev) tool plugin for [kotlin-formatter](https://github.com/block/kotlin-formatter).

## Features

- Provides the `kotlin-format` CLI for formatting Kotlin code
- Based on [ktfmt](https://github.com/facebook/ktfmt/tree/main)
- Supports max-width configuration
- Git hooks integration (pre-commit, pre-push)
- Daemon mode for faster repeated formatting

## Usage

```bash
# Install kotlin-formatter
mise install kotlin-formatter@latest

# Format files
kotlin-format file1.kt file2.kt

# Format with options
kotlin-format --set-exit-if-changed src/

# Check formatting (exit code if not formatted)
kotlin-format --set-exit-if-changed --dry-run src/
```

## Configuration

The kotlin-formatter supports a `.kotlin-formatter.yaml` config file in your project root. See the [upstream documentation](https://github.com/block/kotlin-formatter) for configuration options.

## Git Integration

```bash
# Format staged files on commit
kotlin-format --pre-commit

# Check committed files before push
kotlin-format --pre-push
```

## Plugin Development

```bash
# Link for development
mise plugin link --force kotlin-formatter .

# Run tests
mise run test

# Run linting
mise run lint

# Run CI
mise run ci
```