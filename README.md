## INTRODUCTION

LogDog allows developers to save logs easily in an iOS app. It captures text logs and saves them in UserDefaults as an array of logs. The logs are saved in the JSON format - making it easy for the fellow developers to send them to the backend.
Developed in swift, developers can either use the source code directly or can build a framework and integrate it into their apps.

## USAGE

**Enable/Disable logging**: Default value is true. If false, new logs will not be captured

    LogCat.loggingEnabled = false;

**Capture Logs**: Logs can be of the type (d)ebug, (v)erbose, (i)nformation and (e)rror

    LogDog.d(tag: "Hello", text: "World");
    LogDog.e(tag: "Hello", text: "World");
    LogDog.i(tag: "Hello", text: "World");
    LogDog.v(tag: "Hello", text: "World");

**Get Logs**: Get the logs that are captured. Logs will be retrieved in a JSON format

    LogDog.logs();

**Clear Logs**: Remove all logs that persist.

    LogDog.clear();
