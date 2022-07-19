---
order: 0
summary: How to configure the Denoflare docs static site
title: Site Configuration
type: overview
---

# Site Configuration
How to configure your static site

Metadata for the site should be saved to a config.jsonc or config.json file in the root of your content repo.

## Example config.jsonc file
```jsonc
{
	// This jsonc file supports comments and trailing commas!

    // optional schema to get auto-completions when editing this file in vscode, etc
    "$schema": "https://raw.githubusercontent.com/skymethod/denoflare/v0.5.4/cli/site/site_config.schema.json",

    "product": "FizzBuzz",
    "productSvg": "/images/logo-inline.svg",
    "productRepo": "my-org/fizzbuzz",
    "contentRepo": "my-org/fizzbuzz-docs",
    "themeColor": "#001122",
    "themeColorDark": "#223344",
    "siteMetadata": {
        "title": "FizzBuzz",
        "description": "Description for page metadata",
        "origin": "https://fizzbuzz.dev",
        "twitterUsername": "@fizzbuzz",
        "image": "/images/screenshot.v1.png",
        "imageAlt": "FizzBuzz screenshot",
        "faviconIco": "/images/favicon.2.ico",
        "faviconSvg": "/images/favicon.2.svg",
        "faviconMaskSvg": "/images/favicon.2.svg",
        "faviconMaskColor": "#334455",
        "manifest": {
            "name": "FizzBuzz (custom)",
        },
    },
}
```

## Full configuration format
```ts
export interface SiteConfig {

    // leave these out if no org
    readonly organization?: string; // short first (bold) part of org name
    readonly organizationSuffix?: string; // short second part of org name
    readonly organizationSvg?: string; // content repo /path/to/organization.svg must use fill="currentColor"
    readonly organizationUrl?: string; // abs url to org

    readonly product: string; // (required) product name for sidebar, etc
    readonly productRepo?: string; // e.g. "ghuser/project-repo", used for gh link in header
    readonly productSvg?: string; // content repo /path/to/product.svg must use fill="currentColor" 
    readonly contentRepo?: string; // e.g. "ghuser/docs-repo", used for edit this page in footer

    readonly themeColor?: string; // #rrggbb
    readonly themeColorDark?: string; // #rrggbb

    readonly siteMetadata: SiteMetadata; // (required for title, description)
}

export interface SiteMetadata {
    readonly title: string; // (required) (html title, og:title, twitter:title) = <page title> · <siteMetadata.title>
    readonly description: string; // (required) (html meta description, og:description, twitter:description) = <siteMetadata.description>
    readonly twitterUsername?: string; // @asdf for twitter:site
    readonly image?: string; // abs or relative url to twitter:image
    readonly imageAlt?: string; // alt text for twitter:image
    readonly origin?: string; // abs url to site (origin)
    readonly faviconIco?: string; // relative url favicon ico
    readonly faviconSvg?: string; // relative url favicon svg
    readonly faviconMaskSvg?: string; // relative url favicon mask svg
    readonly faviconMaskColor?: string; // #rrggbb favicon mask color (required if faviconMaskSvg provided)
    readonly manifest?: Record<string, unknown>; // override default web app manifest members
}
```
