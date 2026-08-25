# There4 Deployment Contract

## Confirmed configuration

- Host: DigitalOcean App Platform
- Component type: Static Site
- Build command: `bundle exec jekyll build -d ./public`
- Expected output directory: `public`
- Source repository: `craig-davis/craig-davis.github.io`
- Current working branch: `master`

## Still to verify in DigitalOcean

- Connected repository and deployment branch.
- Output/publish directory is explicitly `public`.
- Automatic deployment behavior.
- Ruby runtime selection and environment variables.
- Custom-domain configuration for `there4.io` and `www.there4.io`.
- Redirect and error-document settings supplied outside Jekyll.

## Local production-equivalent build

```sh
bundle exec jekyll build -d ./public
```

The `public` directory is generated output and must not be treated as source content. Modernization project documents under `docs/` must never appear in it.

## Preserved standalone applications

- `/flat-trim/`
- `/running-calculator/`

These currently consist of standalone HTML files copied by Jekyll. They remain at their existing URLs until a separate subdomain migration and redirect plan is accepted.
