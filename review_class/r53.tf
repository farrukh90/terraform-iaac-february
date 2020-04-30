resource "aws_route53_record" "www" {
    zone_id = "Z32OHGRMBVZ9LR"
    name    = "www.acirrustech.com"
    type    = "A"
    ttl     = "5"

    records = [
        "${aws_instance.review_class_web.*.public_ip}"
    ]
}
