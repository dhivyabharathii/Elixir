import Config

config :friends, Friends.Repo,
  database: "friends_repo",
  username: "postgres",
  password: "Dhivya_14$",
  hostname: "localhost"

config :friends, ecto_repos: [Friends.Repo]
