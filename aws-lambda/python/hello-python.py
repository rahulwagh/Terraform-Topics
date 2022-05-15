def lambda_handler(event, context):
   message = 'Hello {} !'.format(event['key1'])
   return {
       'message' : message
   }

   