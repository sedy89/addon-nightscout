# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## v1.4.9
- patched transform.js regardign utc timestamp issue https://github.com/nightscout/minimed-connect-to-nightscout/issues/30

## v1.4.8
- switched to CGM dev branch for latest changes
- added de_normalize flag to config
- added mmconnect verbose flag to config

## v1.4.7
- fixed version of docker image to fix home assistant uninstall

## v1.4.4
- Update Nightscout from 14.2.2 to 14.2.5
- Update base images
- Update dependencies
- Remove unsupported architectures (armv7 and i386)
- added mmconnect env variables to config yaml

## v1.2.0
- Update Nightscout from 14.0.4 to 14.2.2
- Update base images
- Update dependencies
- Remove unsupported architectures (armv7 and i386)

## [Unreleased]
- Run Nightscout inside a Home Assistant Add-on