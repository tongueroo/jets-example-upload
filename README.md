# Jets Upload Tutorial with Carrierwave Example

[![BoltOps Badge](https://img.boltops.com/boltops/badges/boltops-badge.png)](https://www.boltops.com)

This project demonstrates how to upload images or any binary file with Jets and Carrierwave.

## Getting Started

    git clone https://github.com/tongueroo/jets-example-upload upload
    cd upload
    vim .env.development # add CARRIERWAVE_* variables per tutorial guide
    jets deploy

## Important

Remember to update your [.env](http://rubyonjets.com/docs/env-files/) files with the `CARRIERWAVE_*` variables. Example:

.env.development:

    CARRIERWAVE_AWS_ACCESS_KEY_ID=AKIAI7KI5LIEXAMPLE
    CARRIERWAVE_AWS_SECRET_ACCESS_KEY=XOGuscz2lNyGFo1ChFntigzBp3IMMGdEXAMPLE
    CARRIERWAVE_AWS_REGION=us-west-2
    CARRIERWAVE_S3_BUCKET=demo-uploads-EXAMPLE

You'll need to update `.env.development.remote` before deploying also.

.env.development.remote:

    DATABASE_URL=mysql2://user:pass@host.us-west-2.rds.amazonaws.com/upload?pool=5

## Resources

* Blog post: [Jets Image Upload Carrierwave Tutorial: Binary Support](https://blog.boltops.com/2018/12/13/jets-image-upload-carrierwave-tutorial-binary-support)
* Live Demo of [Upload Images Jets Application](https://upload.demo.rubyonjets.com/)

If you find Jets interesting, please it a GitHub star <a href="https://github.com/tongueroo/jets">tongueroo/jets</a>. It helps others find out about the project.  I'd appreciate it!
