import { compat, types as T } from "https://deno.land/x/embassyd_sdk@v0.3.3.0.11/mod.ts";

export const getConfig: T.ExpectedExports.getConfig = compat.getConfig({
  "backend-url": {
    type: "string",
    name: "Backend URL",
    description: "Use the Maple enclave unless you operate your own backend.",
    default: "https://enclave.trymaple.ai",
    nullable: false,
    masked: false,
    copyable: true,
  },
  "api-key": {
    type: "string",
    name: "Default Maple API key",
    description: "Leave empty for clients to supply their own keys. With a default key, anyone who can reach this service can use your Maple account.",
    default: null,
    nullable: true,
    masked: true,
    copyable: false,
  },
});

export const setConfig = compat.setConfig;
