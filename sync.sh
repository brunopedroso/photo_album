
ruby generate_indexes.rb
ruby generate_thumbs.rb
aws s3 sync . s3://my_bucket --acl public-read --delete
