use Mix.Config

config :pleroma, Pleroma.Web.Endpoint,
   url: [host: "pl.asterism.xyz", scheme: "https", port: 443]

config :pleroma, :instance,
  limit: 5000,
  registrations_open: false,
  dedupe_media: false,
  rewrite_policy: [Pleroma.Web.ActivityPub.MRF.SimplePolicy, Pleroma.Web.ActivityPub.MRF.MediaProxyWarmingPolicy],
  no_attachment_links: true,
  description: "A pleroma instance for me(@aries@pl.asterism.xyz, @aries@mstdn.asterism.xyz)"

config :logger,
  backends: [{ExSyslogger, :ex_syslogger}]

config :logger, :ex_syslogger,
  level: :info

config :pleroma, :media_proxy,
  enabled: true,
  proxy_opts: [
    redirect_on_failure: true
  ]

config :pleroma, Pleroma.Upload,
  uploader: Pleroma.Uploaders.S3,
  filters: [
    Pleroma.Upload.Filter.AnonymizeFilename,
    Pleroma.Upload.Filter.Mogrify
  ]

config :pleroma, Pleroma.Upload.Filter.Mogrify, args: ["strip", "auto-orient"]

config :pleroma, :mrf_simple,
  media_nsfw: ["pawoo.net"],
  reject: ["switter.at", "sinblr.com", "humblr.social", "neo.hongeipii.com", "weedis.life"]

config :pleroma, :chat, enabled: false

config :pleroma, :fetch_initial_posts,
  enabled: true,
  pages: 1

config :pleroma, Pleroma.Web.Federator.RetryQueue,
  enabled: true,
  max_jobs: 20,
  initial_timeout: 10,
  max_retries: 3

# Default gitignore is *.secret.exs
import_config "<your-keys>.secret.exs"
