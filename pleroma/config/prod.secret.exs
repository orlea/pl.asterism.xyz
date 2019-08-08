use Mix.Config

config :pleroma, Pleroma.Web.Endpoint,
   http: [ ip: {0, 0, 0, 0},],
   url: [host: "pl.asterism.xyz", scheme: "https", port: 443]

config :pleroma, :instance,
  limit: 5000,
  registrations_open: false,
  dedupe_media: false,
  rewrite_policy: [Pleroma.Web.ActivityPub.MRF.SimplePolicy, Pleroma.Web.ActivityPub.MRF.MediaProxyWarmingPolicy],
  no_attachment_links: true,
  description: "A pleroma instance for me(@aries@pl.asterism.xyz, @aries@mstdn.asterism.xyz)"

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
  enabled: false,
  pages: 1

config :pleroma, Pleroma.Web.Federator.RetryQueue,
  enabled: true,
  max_jobs: 20,
  initial_timeout: 10,
  max_retries: 3

config :pleroma_job_queue, :queues,
  federator_incoming: 200,
  federator_outgoing: 200,
  web_push: 50,
  mailer: 10,
  transmogrifier: 20,
  scheduled_activities: 100,
  background: 50


# Default gitignore is *.secret.exs
# import_config "<your-keys>.secret.exs"
