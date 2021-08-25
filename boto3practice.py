import boto3

s3=boto3.client('s3')

bucket = s3.create_bucket(  Bucket='pcessna01',
                            ACL='private',                        
)

for buck in s3.buckets.all():
    print(bucket.name)
