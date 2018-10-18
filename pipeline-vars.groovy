// the stages this pipeline supports
env.PIPELINE_STEPS = [
    'Build: "./scripts/build.sh"',
    'Validate: "./scripts/validate.sh"',
    'Deploy: "./scripts/deploy.sh"',
];

// Credential Tokens
env.AWS_CREDENTIAL_ID_TOKEN = 'TBD'
env.AWS_ACCESS_KEY_ID_TOKEN = 'TBD'
env.AWS_SECRET_ACCESS_KEY_TOKEN = 'TBD'

// script env vars
env.vars = [ 'AWS_REGION=us-east-1' ]
