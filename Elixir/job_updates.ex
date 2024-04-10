defmodule JobUpdates do
  def read() do
    file_contents = File.read!("v1_jobs_1h")
    parsed_data = Jason.decode!(file_contents)
    IO.puts(parsed_data)
  end
end
JobUpdates.read()
