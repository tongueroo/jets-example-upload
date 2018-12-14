class CleanerJob < ApplicationJob
  include Jets::AwsServices

  # Deletes all the current DB records and reseed the db
  rate "1 day"
  iam_policy "s3"
  def clean
    empty_s3_bucket
    reset_records
  end

private
  # Delete all items in the uploads bucket to keep it clean
  def empty_s3_bucket
    s3_bucket_name = ENV['CARRIERWAVE_S3_BUCKET']
    resp = s3.list_objects(bucket: s3_bucket_name)
    if resp.contents.size > 0
      # IE: objects = [{key: "objectkey1"}, {key: "objectkey2"}]
      objects = resp.contents.map { |item| {key: item.key} }
      s3.delete_objects(
        bucket: s3_bucket_name,
        delete: {
          objects: objects,
          quiet: false,
        }
      )
      empty_s3_bucket # keep deleting objects until bucket is empty
    end
  end

  def reset_records
    Post.delete_all
    3.times do |i|
      create_post(i)
    end
  end

  def create_post(i)
    post = Post.create(id: i+1, title: "My test post #{i+1}")
    File.open("db/seed/#{data[i]}") do |f|
      post.photo = f
    end
    post.save!
  end

  def data
    %w[
      jets.png
      jets-mega-mode.png
      jets-function-properties.png
    ]
  end

end