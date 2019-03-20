# Instructions

## Numbering of versions

For the versioning scheme, see [formats/VERSIONING.md](formats/VERSIONING.md).

## Development

A branch, creating draft versions (e.g., `9.8.7-draft1`) or release candidates (e.g., `9.8.7-rc1`) will be created. The branch should 
The branch should have the name of the draft or release version. A new directory with the ultimate release number (e.g. `9.8.7`) should be created.
Subsequently, a pull request should be initiated.

## Automated builds
We have Travis-CI set up to compile the web pages. See [TRAVIS.md](TRAVIS.md] for more details.

## Releases
Each commit to master will be built into web pages, which are viewable at http://labordynamicsinstitute.github.io/qwi_schemas/. These are **draft** releases.

When ready to release a specific version for deployment at the Census Bureau, 
- delete any existing branch `lehd-deploy`
- select the `master` branch
- branch to `lehd-deploy`
- (if not working in the web interface) push to the main repository
- the automated build process will pick up the `lehd-deploy` version, and build the LEHD-specific pages. These will be available in the `lehd` branch.

