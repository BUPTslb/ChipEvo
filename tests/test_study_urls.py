import unittest
from chipevo.study_config import validate_base_url

class StudyURLTests(unittest.TestCase):
    def test_tls_and_explicit_local_proxy(self):
        for url in ['https://api.kimi.com/coding/v1','https://api.deepseek.com','http://127.0.0.1:8317/v1','http://localhost:8317/v1','http://[::1]:8317/v1']:
            validate_base_url(url)

    def test_reject_remote_plaintext_and_secret_bearing_urls(self):
        for url in [None,'','http://example.com/v1','http://127.0.0.1.example.com/v1','ftp://localhost/v1','https://user:key@example.com','https://example.com/v1?key=secret','https://example.com/v1#key','http://127.0.0.1:bad/v1']:
            with self.assertRaises(ValueError,msg=str(url)):validate_base_url(url)
