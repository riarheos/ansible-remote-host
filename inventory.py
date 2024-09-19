#! /usr/bin/env python3

import json
import os

key = 'TARGET_HOST'

if key not in os.environ:
    raise Exception('Environment variable %s not set' % key)

result = {
    'all': {
        'hosts': [os.environ[key]],
    }
}
print(json.dumps(result))
