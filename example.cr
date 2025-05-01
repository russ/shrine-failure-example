require "shrine"
require "shrine/plugins/determine_mime_type"

module Uploads
  class Uploader < Shrine
    load_plugin(
      Shrine::Plugins::DetermineMimeType,
      analyzer: Shrine::Plugins::DetermineMimeType::Tools::File
    )

    finalize_plugins!

    def generate_location(_io : IO | UploadedFile, metadata, **options)
      "/tmp/example"
    end
  end
end

file = File.open("shard.yml")
Uploads::Uploader.upload(file, "store")
