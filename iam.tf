resource "aws_iam_role" "role_serveur_cv" {
    name        = "role-serveur-cv-joseph-v3" 
    description = "Autorisation de lecture du serveur s3"

    assume_role_policy = jsonencode({
        Version   = "2012-10-17"
        Statement = [
            {
                Action      = "sts:AssumeRole"
                Effect      = "Allow"
                Principal   = {
                 Service    = "ec2.amazonaws.com"
                }
            }
        ]
    })
}

resource "aws_iam_policy" "politique_lecture_s3" {
    name        = "politique-de-lecture-boite_cv"
    description = "Lecture de la boite s3"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect      = "Allow"
                Action      = [
                    "s3:GetObject",
                    "s3:ListBucket"
                ]
                Resource   = [
                    "${aws_s3_bucket.boite_cv.arn}",
                    "${aws_s3_bucket.boite_cv.arn}/*"
                ]
            }
        ]
    })
}

resource "aws_iam_role_policy_attachment" "liaison_role_policy" {
    role        = aws_iam_role.role_serveur_cv.name
    policy_arn  = aws_iam_policy.politique_lecture_s3.arn
}

resource "aws_iam_instance_profile" "profil_serveur_cv" {
    name = "profile-serveur-cv-joseph-v3"
    role = aws_iam_role.role_serveur_cv.name
}
