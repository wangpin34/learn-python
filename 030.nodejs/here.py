import sys
import json
import time

while True:
  score = {'Ada':87}
  print(json.dumps(score))
  time.sleep(1)
  sys.stdout.flush()
