{% from "wordpress/map.jinja" import wordpress with context %}
{% for name, site in pillar['wordpress']['sites'].items() %}

{% if high_state is defined %}
include:
  - wordpress.cli
  - wordpress.download
  - wordpress.install
{% endif %}

# This command tells wp-cli to create our wp-config.php, DB info needs to be the same as above
configure_{{ name }}:
 cmd.run:
  - name: '/usr/local/bin/wp core config --dbname="{{ site.get('database') }}" --dbuser="{{ site.get('dbuser') }}" --dbpass="{{ site.get('dbpass') }}" --dbhost="{{ site.get('dbhost') }}" --path="{{ wordpress.docroot }}/{{ site }}"'
  - user: {{ wordpress.www_user }}
  - unless: /usr/local/bin/wp core is-installed --path="{{ wordpress.docroot }}/{{ name }}"

{% endfor %}
