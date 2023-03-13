import json

def handler(event, context):
  print('Hello world')

  # WRITE CODE HERE

  return {
        'statusCode': 200,
        'body': json.dumps('Hello world')
  }