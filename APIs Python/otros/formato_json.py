import json

data = {"name":"juan","edad":25}
parsed = json.loads(data)
print(parsed["name"])