{% from "wordpress/map.jinja" import wordpress with context %}

include:
  - wordpress.cli
  - wordpress.download
  - wordpress.config
  - wordpress.install