{% from "wordpress/map.jinja" import wordpress with context %}
{% for name, site in pillar['wordpress']['sites'].items() %}

# This command tells wp-cli to create our wp-config.php, DB info needs to be the same as above
configure_{{ name }}:
 cmd.run:
  - name: '/usr/local/bin/wp core config --dbhost={{ site.dbhost }} --dbname={{ site.database }} --dbuser={{ site.dbuser }} --dbpass={{ site.dbpass }}'
  - cwd: {{ wordpress.docroot }}/{{ name }}
  - user: {{ wordpress.www_user }}

{% endfor %}
