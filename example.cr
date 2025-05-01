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
      identifier = "#{metadata["identifier"]}#{File.extname(metadata["filename"]?.to_s)}".downcase
      partitioned_path = (("%08s" % identifier).scan(/..../)[0..4].map(&.[0]?.to_s) + [identifier]).join("/")
      File.join(partitioned_path.gsub(/\..*$/, ""), identifier)
    end
  end
end

file = File.open("shard.yml")
Uploads::Uploader.upload(file, "store")
