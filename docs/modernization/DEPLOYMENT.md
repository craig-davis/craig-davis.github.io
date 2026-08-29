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

## Confirmed DigitalOcean behavior

- The app deploys `master` automatically from `craig-davis/craig-davis.github.io`.
- The static-site build publishes `public` and the production response reports the DigitalOcean app origin behind Cloudflare.
- The production stack is Ubuntu 22.04 with the current Ruby buildpack.
- `http://there4.io/` redirects to `https://there4.io/` and the apex HTTPS domain serves the generated site.
- Unknown routes return the custom 404 response.
- Historical Jekyll redirect pages and both preserved calculators remain reachable at their durable paths.

## Remaining DigitalOcean launch work

- Decide whether `www.there4.io` should resolve and redirect to the canonical apex domain. It has no DNS record as of the Phase 9 review.
- Add response headers at the platform or CDN layer: `Strict-Transport-Security`, `X-Content-Type-Options: nosniff`, a conservative `Referrer-Policy`, and an appropriate `Permissions-Policy`.
- Repeat the production smoke test after the Phase 9 release deploys.

## Completed DigitalOcean stack upgrade

The first Phase 1 deployment revealed that the app still uses DigitalOcean's legacy Ubuntu 18.04 stack with `heroku/ruby` buildpack v1.244.3 and Bundler 2.3.10. The immediate Gemfile parser failure was caused by an unnecessary Windows-only dependency and has been removed.

Ruby 3.4.7 now deploys on DigitalOcean's Ubuntu-22 Ruby buildpack, aligning production with local development and GitHub Actions.

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
