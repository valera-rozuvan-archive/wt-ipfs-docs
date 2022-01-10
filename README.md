# ORGiD SDK docs

Deploy any version of [ORGiD SDK docs](https://github.com/windingtree/org.id-sdk) as an IPFS site.

- for demonstration purposes only
- a fully automated setup, where a GitHub action is run when a new commit lands into the `master` branch
- you can specify which version of the docs gets deployed by modifying the commit hash (of the git submodule `org.id-sdk`)
- this flow can be extended to deploy any number of separate Git doc repositories

## Live version

This GitHub repo deploys the static site to a self-hosted IPFS node and a self-hosted gateway.

- my gateway - [https://orgid-docs.rozuvan.net/](https://orgid-docs.rozuvan.net/)
- Cloudflare gateway - [https://cloudflare-ipfs.com/ipfs/QmYXT9SjaY7qVzz1cpk97rCN2mMecnM8172ociQRoTdwSV/](https://cloudflare-ipfs.com/ipfs/QmYXT9SjaY7qVzz1cpk97rCN2mMecnM8172ociQRoTdwSV/)

You can also see the content's of:

- [https://orgid-docs.rozuvan.net/build](https://orgid-docs.rozuvan.net/build)
- the same via Cloudflare - [https://cloudflare-ipfs.com/ipfs/QmYXT9SjaY7qVzz1cpk97rCN2mMecnM8172ociQRoTdwSV/build](https://cloudflare-ipfs.com/ipfs/QmYXT9SjaY7qVzz1cpk97rCN2mMecnM8172ociQRoTdwSV/build)

Please note! Cloudflare gateway caches the contents when you request a particular IPFS hash. It then clears the caches in about 24 hours if nobody requests that particular IPFS hash again. When there is no cached content, Cloudflare can take up to 2-3 minutes to fully load the static site.

This is why I think it's important to have your own IPFS node running, and your own gateway.
