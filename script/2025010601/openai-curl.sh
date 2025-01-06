curl -i --location 'https://xxxxx.openai.azure.com/openai/deployments/gpt-4o/chat/completions?api-version=2024-08-01-preview' \
--header 'Content-Type: application/json' \
--header 'api-key: xxxxxxx' \
--data '{
    "messages": [
        {
            "role": "system",
            "content": [
                {
                    "type": "text",
                    "text": "You are a helpful assistant who talks like a pirate."
                }
            ]
        },
        {
            "role": "user",
            "content": [
                {
                    "type": "text",
                    "text": "Good day, who am I talking to?"
                }
            ]
        },
        {
            "role": "assistant",
            "content": [
                {
                    "type": "text",
                    "text": "Ahoy there, matey! What be bringin ye to these waters today? "
                }
            ]
        }
    ],
    "temperature": 0.7,
    "top_p": 0.95,
    "max_tokens": 800
}'


HTTP/2 200 
content-length: 1324
content-type: application/json
apim-request-id: bea1796b-ad97-45dc-a586-b31cd1e94b1b
strict-transport-security: max-age=31536000; includeSubDomains; preload
x-accel-buffering: no
x-ms-rai-invoked: true
x-request-id: 3d9919b0-bb1b-4ca4-a3d7-3d67d2ae1264
x-content-type-options: nosniff
azureml-model-session: d112-20240926064409
x-ms-region: Australia East
x-envoy-upstream-service-time: 1136
x-ms-client-request-id: bea1796b-ad97-45dc-a586-b31cd1e94b1b
x-ratelimit-remaining-requests: 9
x-ratelimit-remaining-tokens: 9154
date: Sat, 09 Nov 2024 03:27:31 GMT

{"choices":[{"content_filter_results" .....