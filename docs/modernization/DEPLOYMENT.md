# There4 Deployment Contract

## Confirmed configuration

- Host: DigitalOcean App Platform
- Component type: Static Site
- Build command: `bundle exec jekyll build -d ./public`
- Expected output directory: `public`
- Source repository: `craig-davis/craig-davis.github.io`
- Current working branch: `master`
- Ruby: 3.4.7, pinned in `.ruby-version` and `Gemfile`
- Jekyll: 4.4.1

## Still to verify in DigitalOcean

- Connected repository and deployment branch.
- Output/publish directory is explicitly `public`.
- Automatic deployment behavior.
- Any DigitalOcean environment variables that override repository runtime selection.
- Custom-domain configuration for `there4.io` and `www.there4.io`.
- Redirect and error-document settings supplied outside Jekyll.

## Local production-equivalent build

```sh
bundle exec jekyll build -d ./public
```

The `public` directory is generated output and must not be treated as source content. Modernization project documents under `docs/` must never appear in it.

DigitalOcean's Ruby buildpack detects the root `Gemfile` and installs the Ruby version declared there. The repository pins the same version in `.ruby-version` for local development and GitHub Actions.

## Continuous integration

GitHub Actions runs `bin/verify` for pull requests and pushes to `master` using Ubuntu 22.04 and the repository-pinned Ruby version. CI verifies the same build command and Phase 0 regression baseline used locally.

## Preserved standalone applications

- `/flat-trim/`
- `/running-calculator/`

These currently consist of standalone HTML files copied by Jekyll. They remain at their existing URLs until a separate subdomain migration and redirect plan is accepted.
