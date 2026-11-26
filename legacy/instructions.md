# Using Maple Proxy

Open **Config**, review the backend URL and save. The default connects to Maple. Leave the default key empty to have each client supply its own Maple API key. If you save a default key, anyone with access to the proxy can use your Maple account.

Start the service and choose **Launch UI** to open the chat page. For an OpenAI-compatible client, use the service address with `/v1` appended. Other services on the same StartOS server can use `http://maple-proxy.embassy:8080/v1`. Clients using their own key send it as a Bearer token in the Authorization header.

StartOS backups include the backend URL and any saved default key. Protect the backup password. Conversations in the browser are outside the server backup.
