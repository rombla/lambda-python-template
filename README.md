# Upload a simple python code to Lambda with Docker

1. create a new function using `./new-lambda-function.sh <name>`

2. Populate the `handler` function in the `app.py` file

3. Put any lib requirements in the `requirements.txt`, like: 
```
requests==2.28.2
numpy==1.24.2
```

4. populate the `.env` with necessary information, image name and lambda function name

4. build the image and run the image using `./run.sh <folder>`. It will listen on port http 9000

6. You can trigger execution of the function with HTTP:
```
curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'
```

Request body is customizable, it is passed to lambda code as the event variable of the handler function.

## Deploy

To deploy your code to lambda once it works :

1. The first time only, create the repository in the ECR regitry: 
```
aws ecr create-repository --repository-name <image-name> --image-scanning-configuration scanOnPush=true
```

2. Then to push and update the function every time, use `./deploy.sh <folder>`

3. For troubleshooting incorrect login issues, run:
```
aws ecr get-login-password | docker login --username AWS --password-stdin <registry-uri>
```

## AWS stuff

* don't forget to add IAM roles/policies/user groups etc to allow necessary actions (e.g. send emails, create registry, execute lambda...)

* also attach policies to the role that lambda will create for the function

* Using eventbridge works well to trigger lambda on a schedule