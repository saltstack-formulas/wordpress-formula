{% from "wordpress/map.jinja" import wordpress with context %}

{% if high_state is defined %}
include:
  - wordpress.cli
  - wordpress.download
  - wordpress.install
{% endif %}

{% for id, site in pillar['wordpress']['sites'].items() %}

# This command tells wp-cli to create our wp-config.php, DB info needs to be the same as above
configure_{{ id }}:
 cmd.run:
  - name: '/usr/local/bin/wp core config --dbname="{{ site.get('database') }}" --dbuser="{{ site.get('dbuser') }}" --dbpass="{{ site.get('dbpass') }}" --dbhost="{{ site.get('dbhost') }}" --path="{{ wordpress.docroot }}/{{ id }}"'
  - user: {{ wordpress.www_user }}
  - unless: /usr/local/bin/wp core is-installed --path="{{ wordpress.docroot }}/{{ id }}"

{% endfor %}
