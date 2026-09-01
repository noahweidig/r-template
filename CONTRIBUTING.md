# Contributing to mtbs-treemap

Thanks for taking the time to contribute!

## Ground rules

- Be respectful — this project follows the
  [Contributor Covenant](CODE_OF_CONDUCT.md).
- Open an issue before large changes so we can discuss the approach.

## Getting set up

```r
renv::restore()   # install the pinned package versions
```

## Workflow

Scripts live in `02_scripts/` and run in numbered order — keep that order intact.
Raw data is never edited by hand; regenerate cleaned data from the scripts.

Run `make style` and `make lint` before opening a pull request.

## Pull requests

1. Fork & branch from `main`.
2. Make focused commits with clear messages.
3. Open a pull request describing **what** changed and **why**.
