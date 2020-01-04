require 'shrine'
require 'shrine/storage/file_system'

Shrine.plugin :activerecord
Shrine.plugin :validation_helpers
Shrine.plugin :determine_mime_type
Shrine.plugin :backgrounding
Shrine.plugin :pretty_location, namespace: "_"

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),
  store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store')
}

Shrine::Attacher.promote_block do
  PromoteJob.perform_async(self.class.name, record.class.name, record.id, name, file_data)
end