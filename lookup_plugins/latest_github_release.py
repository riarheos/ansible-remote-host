from ansible.plugins.lookup import LookupBase
import requests


class LookupModule(LookupBase):
    def run(self, terms, **kwargs):
        url, tmpl, facts = terms

        for key in facts:
            facts[key] = str(facts[key]).lower()

        if facts['machine'] == 'x86_64':
            facts['machine'] = 'amd64'
        if facts['machine'] == 'aarch64':
            facts['machine'] = 'arm64'

        res = requests.get('https://api.github.com/repos/%s/releases/latest' % url)
        res.raise_for_status()
        data = res.json()

        name = tmpl.format(**facts)
        for asset in data['assets']:
            if asset['name'] == name:
                return [asset['browser_download_url']]

        raise RuntimeError('Could not find %s in the latest release' % name)
