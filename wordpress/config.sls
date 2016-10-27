{% from "wordpress/map.jinja" import map with context %}
{% for name, site in pillar['wordpress']['sites'].items() %}

# This command tells wp-cli to create our wp-config.php, DB info needs to be the same as above
configure:
 cmd.run:
  - name: '/usr/local/bin/wp core config --dbhost={{ site.dbhost }} --dbname={{ site.database }} --dbuser={{ site.dbuser }} --dbpass={{ site.dbpass }}'
  - cwd: {{ map.docroot }}/{{ name }}
  - user: {{ map.www_user }}

{% endfor %}
