# Manage the assets and their URI/path
module Slippery
  module Assets
    ASSETS_PATH = ROOT.join('assets')

    # Copies the assets locally
    def self.embed_locally
      raise 'damn'
      FileUtils.cp_r(ASSETS_PATH, './')
    end

    # returns a composer returning a URI for a given relative file path
    # considering if the asset is local or not
    def self.path_composer(local)
      if local
        ->(path) { File.join('assets', path) }
      else
        ->(path) { "file://#{File.expand_path(File.join(ASSETS_PATH, path), __FILE__)}" }
      end
    end
  end
end