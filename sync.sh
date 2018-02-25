
ruby generate_indexes.rb
ruby generate_thumbs.rb
aws s3 sync . s3://vqf2018 --acl public-read --delete
