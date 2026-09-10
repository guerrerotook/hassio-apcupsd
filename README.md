# Archived

Unfortunately, I just don't have time to maintain this project anymore. This repository is now archived, but will remain in place for anyone still using it. If someone wants to take over maintaining this repo please contact me.

I suggest migrating to the [Community NUT Add-on](https://github.com/hassio-addons/addon-nut). To help you along here's my add-on configuration:

```yaml
users:
  - username: nut
    password: <random pass here>
    instcmds:
      - all
    actions: []
devices:
  - name: apc
    driver: usbhid-ups
    port: auto
    config:
      - desc = "APC Back-UPS 600VA"
      - vendorid = 051d
mode: netserver
shutdown_host: 'false'
```

You can then add the [NUT Integration](https://www.home-assistant.io/integrations/nut/) using:

* Host: `a0d7b954-nut`
* Port: `3493`
* Username: `nut`
* Password: `<random pass here>`

# About

This repository contains just one add-on, an unofficial [apcupsd_net add-on](https://github.com/guerrerotook/hassio-apcupsd/tree/master/apcupsd_net).

# Installation

Add this repository to your [Hass.io](https://home-assistant.io/hassio/) instance:

`https://github.com/guerrerotook/hassio-apcupsd`

If you have trouble you can follow the [official docs](https://home-assistant.io/hassio/installing_third_party_addons/).

Then install the "APC UPS Daemon (No USB)" add-on.

# Configuration

See the [apcupsd_net add-on](https://github.com/guerrerotook/hassio-apcupsd/tree/master/apcupsd_net) itself for information on configuring it.

# Docker images

The add-on image is built by GitHub Actions and published to this repository owner's GitHub Container Registry:

* `ghcr.io/guerrerotook/apcupsd_net`

Every push to `master` publishes the `edge` tag plus a tag matching the `version` in the add-on `config.yaml`.
Publishing a GitHub release publishes the release version (without a leading `v`) and the `stable` (or `beta` for pre-releases) tag.
Images are built for `linux/amd64` only.

The package is created as a private package the first time the pipeline runs. Set its visibility to public in the GitHub package settings so Home Assistant can pull it.

# Releasing

Home Assistant offers an update when the `version` in `apcupsd_net/config.yaml` on `master` changes, and it then pulls `ghcr.io/guerrerotook/apcupsd_net:<version>`. Releases keep both in sync automatically:

1. Publish a GitHub release with a tag such as `v1.10` (or `1.10`).
2. The `Deploy` workflow builds and pushes `ghcr.io/guerrerotook/apcupsd_net:1.10` and the `stable` tag.
3. Afterwards, the `Sync add-on version with release` job rewrites `version` in `apcupsd_net/config.yaml` to `1.10` and commits it to `master`, so the add-on store shows the update.

Pre-releases only publish the `beta` and version tags; they do not change `config.yaml`, so users on stable are unaffected.

If `master` is protected, allow the `github-actions[bot]` account to push to it (or grant a bypass), otherwise the sync job cannot commit the version bump.

# Issues

If you have an issue with this plugin, please [file an issue](https://github.com/guerrerotook/hassio-apcupsd/issues).
