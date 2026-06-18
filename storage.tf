resource "aws_s3_bucket" "boite_cv" {
    bucket = "cv-deploiement-storage-joseph-nathan"

    tags = {
         Name        = "Ma boite de stockage"
         Environment = "cloud-finops-formation"
    }
}

resource "aws_s3_object" "depot_html" {
    bucket       = aws_s3_bucket.boite_cv.id
    key          = "index.html"
    source       = "C:/Users/badil/Documents/formation-cloud-finops/index.html"
    content_type = "text/html"

    tags = {
        Name = "Mon fichier HTML"
    }
}

resource "aws_s3_object" "depot_css" {
    bucket       = aws_s3_bucket.boite_cv.id
    key          = "style.css"
    source       = "C:/Users/badil/Documents/formation-cloud-finops/style.css"
    content_type = "text/css"

    tags = {
        Name = "Mon fichier css"
    }
}

resource "aws_s3_object" "depot_image" {
    bucket       = aws_s3_bucket.boite_cv.id
    key          = "image_site/ma_tete.jpeg"
    source       = "C:/Users/badil/Documents/formation-cloud-finops/image_site/ma_tete.jpeg"
    content_type = "image/jpeg"

    tags = {
        Name = "Mon image"
    }
}