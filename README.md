# Headscale CLI & Tools Container

This container contains the [CLI tools](https://headscale.net/remote-cli/#download-and-configure-headscale) for [Headscale](https://github.com/juanfont/headscale) and some additional scripts I have found useful while managing Headscale servers.

More information on using [Headscale CLI Tools](https://headscale.net/remote-cli/#download-and-configure-headscale) can be found [here](https://headscale.net/remote-cli/#download-and-configure-headscale).

### Generate API Keys

In order to remotely manage Headscale you need to run the following commands on the Headscale instance you wish to manage:

1. Create an API key
    `headscale apikeys create --expiration 90d`
    Copy the output of the command and save it for later. Please note that you can not retrieve a key again, if the key is lost, expire the old one, and create a new key.
2. To view issued keys
    `headscale apikeys list`
3. To expire a key
    `headscale apikeys expire --prefix "<PREFIX>"`

### Container Variables

The following variables exist for the Headscale CLI Tools.

| Variable | Example | Description |
| -------- | ------- | ----------- |
| HEADSCALE\_CLI\_ADDRESS | "headscale.example.com:50443" | Hostname and Port of Headscale instance you wish to manage. |
| HEADSCALE\_CLI\_API\_KEY | "abcde12345" | API Key for Headscale instance you wish to manage. |
| HEADSCALE\_CLI\_INSECURE | "0" | Boolean value telling Headscale CLI Tools if it should use TLS or not. |


