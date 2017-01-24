{% from "wordpress/map.jinja" import wordpress with context %}

{%- set high_state = true %}

include:
  - wordpress.cli
  - wordpress.download
  - wordpress.install
  - wordpress.config