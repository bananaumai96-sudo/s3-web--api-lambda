import json
import boto3
import uuid

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table("users")

def lambda_handler(event, context):
    method = event.get("requestContext", {}).get("http", {}).get("method")
    path = event["rawPath"]

    if method == "OPTIONS":
        return {
            "statusCode": 200,
            "body": ""
        }

    elif method == "POST" and path == "/hello":
        try:
            body_str = event.get("body") or "{}"
            body = json.loads(body_str)
            name = body.get("name")

            # 🔥 DynamoDB保存
            table.put_item(
                Item={
                    "users_id": str(uuid.uuid4()),
                    "name": name
                }
            )

            return {
                "statusCode": 200,
                "body": f"Saved: {name}"
            }

        except Exception as e:
            return {
                "statusCode": 400,
                "body": f"エラー：{e}"
            }

    elif method == "GET" and path == "/hello":
        try:
            params = event.get("queryStringParameters") or "{}"
            user_id = params.get("id")
        
            if not user_id:
                return {
                    "statusCode": 400,
                    "body": "id is required"
                }

            res = table.get_item(Key={"users_id": user_id})
            item = res.get("Item")
            if not item:
                return {
                    "statusCode": 404,
                    "body": "Not Found"
                }
            
            return {
                "statusCode": 200,
                "body": f"name: {item['name']}"
            }
        
        except Exception as e:
            return {
                "statusCode": 400,
                "body": f"エラー：{e}"
            }
        
    elif method == "POST" and path == "/users":
        try:
            body = json.loads(event.get("body") or "{}")
            name = body.get("name")
            department = body.get("department")
            email = body.get("email")
            table.put_item(
                Item={
                    "users_id": str(uuid.uuid4()),
                    "name": name,
                    "department": department,
                    "email": email
                }
            )
            return{
                "statusCode": 200,
                "body": "登録完了"
            }

        except Exception as e:
            return {
                "statusCode": 400,
                "body": f"エラー：{e}"
            }

    elif method == "GET" and path == "/users":
      try:
        params = event.get("queryStringParameters") or "{}"
        email = params.get("email")
        
        response = table.query(
                IndexName="email-index",
                KeyConditionExpression="email = :e",
                ExpressionAttributeValues={
                    ":e": email
                }
        )
        
        items = response.get("Items",[])
        if not items:
            return{
                "statusCode": 200,
                "body": json.dumps(items)
            }
        
        return {
            "statusCode": 200,
            "body": json.dumps(response["Items"])
        }
      except Exception as e:
        return {
            "statusCode": 400,
            "body": f"エラー：{e}"
        }
         
    else:
        return {
            "statusCode": 400,
            "body": "エラー：条件一致無し"
        }
