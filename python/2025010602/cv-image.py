import asyncio
import aiohttp
import time, glob
from aiolimiter import AsyncLimiter
import json, requests, time
from datetime import datetime, timezone

# with open('Config.json','r') as f:
#     data=json.load(f)


headers = {
    "Content-Type": "application/octet-stream",
    "Prediction-Key": "ea6eb5978df14151a028ecb47c55f600",
}
url = "https://australiaeast.api.cognitive.microsoft.com/customvision/v3.0/Prediction/b6fada6f-7d13-4e14-8da9-d771c7268771/classify/iterations/Iteration1/image"

# Create a rate limiter with a maximum of 5 requests per second
rate_limiter = AsyncLimiter(max_rate=10, time_period=1)


async def upload(data):
    async with rate_limiter:
        current_time = datetime.now(timezone.utc).timestamp()
        async with aiohttp.request("POST", url, data=data, headers=headers) as response:
            print("Response Status Code:", response.status)
            print("Response Headers:", response.headers)
            print("Response Headers:", response.json())
            return await response.json(), current_time


async def demonstrate_throughput():

    n = 20
    files = "cover.png"
    start_time = time.monotonic()
    tasks = []
    for file in files:
        with open("d:\\cover.png", "rb") as f:
            data = f.read()
        tasks.append(upload(data))
    responses = await asyncio.gather(*tasks)

    end_time = time.monotonic()

    times = []
    failurecount = 0

    for result, current_time in sorted(responses, key=lambda x: x[1]):

        timecount = 0
        for t in times:
            if t >= current_time - 1:
                timecount += 1
        times.append(current_time)
        if "error" in result:
            failurecount += 1
            print(
                times[-1],
                timecount,
                times[-1] - times[-2] if len(times) > 1 else 0,
                "error",
            )
        else:
            print(times[-1], timecount, times[-1] - times[-2] if len(times) > 1 else 0)

    print("failurecount:", failurecount, "out of ", len(responses))

    return end_time - start_time


if __name__== "__main__":
    execution_time = asyncio.run(demonstrate_throughput())
    print(f"Total execution time: {execution_time:.2f} seconds")
