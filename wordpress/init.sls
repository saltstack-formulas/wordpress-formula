{% from "wordpress/map.jinja" import wordpress with context %}

include:
  - wordpress.cli
  - wordpress.download
  - wordpress.install
  - wordpress.config