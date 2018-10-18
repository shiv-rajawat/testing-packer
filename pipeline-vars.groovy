// the stages this pipeline supports
PIPELINE_STEPS = [
    'Build': 'bash ./scripts/build.sh',
    'Validate': 'bash ./scripts/validate.sh',
    'Deploy': 'bash ./scripts/deploy.sh'
        ]

// Credential Tokens
env.AWS_CREDENTIAL_ID_TOKEN = 'TBD'
env.AWS_ACCESS_KEY_ID_TOKEN = 'TBD'
env.AWS_SECRET_ACCESS_KEY_TOKEN = 'TBD'

// script vars
env.AWS_REGION = 'us-east-2'
env.ELK_VPC_NAME = 'cpv-vpc'
