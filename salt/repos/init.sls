include:
  {% if not grains.get('additional_repos_only') %}
  - repos.default
  - repos.minion
  - repos.proxy
  - repos.server
  - repos.testsuite
  - repos.virthost
  - repos.tools
  {% endif %}
  - repos.additional

{% if grains['os'] == 'SUSE'  and not grains.get('skip_install') %}
refresh_repos:
  cmd.run:
    - name: zypper --non-interactive --gpg-auto-import-keys refresh
{% endif %}

# HACK: work around #10852
{{ sls }}_nop:
  test.nop: []
