from http.client import HTTPSConnection, HTTPException
from urllib.parse import urlparse
from selenium import webdriver
from typing import List

import time

from django.contrib.auth.models import User
from django.test import LiveServerTestCase
from django.urls import reverse

from ..models import Question, Choice
from .test_models import create_question, create_choice


def get_abs_url(hostname, namespace, args=None) -> str:
    return ''.join([hostname, reverse(namespace, args=args)])


def invalid_urls(urllist: list) -> List[str]:
    import ssl
    ssl._create_default_https_context = ssl._create_unverified_context
    bad_urls = []
    for url in urllist:
        try:
            parsed = urlparse(url)
            conn = HTTPSConnection(host=parsed.netloc)
            conn.request("HEAD", parsed.path)
            res = conn.getresponse()
            if res.status in [404]:
                bad_urls.append(url)
        except HTTPException:
            bad_urls.append(url)
    return bad_urls


def get_links(url) -> List[str]:
    """Find all links on page at the given url.
           Return a list of all link addresses, as strings.
    """
    url_list = []
    browser = webdriver.Chrome()
    browser.get(url)
    elements = browser.find_elements_by_tag_name('a')
    for element in elements:
        url_list.append(element.get_attribute("href"))
    browser.close()
    return url_list


class FunctionalTest(LiveServerTestCase):
    url = 'https://cpske.github.io/ISP/'
    browser = webdriver.Chrome()
    username = "testuser"
    password = "123$*HCfjdksla"

    @classmethod
    def setUpClass(cls):
        super().setUpClass()

    def setup_user(self):
        User.objects.create_user(self.username, password=self.password)
        self.browser.get(get_abs_url(self.live_server_url, "accounts:login"))
        self.browser.find_element_by_id("id_username").send_keys(self.username)
        self.browser.find_element_by_id("id_password").send_keys(self.password)
        self.browser.find_element_by_id("login").click()

    def test_heading(self):
        """Find all links on page at the given url.
           Return a list of all link addresses, as strings.
        """
        self.browser.get(get_abs_url(self.live_server_url, "polls:index"))
        element = self.browser.find_element_by_id("app_title")
        self.assertEqual(element.text, "Polls App")

    def test_questions_with_choices(self):
        self.setup_user()
        question = create_question("Some question")
        self.browser.refresh()
        with self.subTest():
            element = self.browser.find_element_by_id(f"q{question.id}")
            self.assertEqual(element.text, "Some question")
        choice = create_choice("Blabla", question.id)
        detail_page_url = get_abs_url(self.live_server_url, "polls:detail", [question.id])
        with self.subTest():
            self.assertEqual(element.get_attribute("href"), detail_page_url)
        with self.subTest("Click on a polls hyperlink. Verify that it goes to a page with list of choices to vote on."):
            element.click()
            self.assertEqual(self.browser.current_url, detail_page_url)
        with self.subTest("Click on the first choice. Verify that it goes to a page of voting results."):
            choice_element = self.browser.find_element_by_id(f"label_choice{choice.id}")
            self.assertEqual(choice_element.text, choice.choice_text)
            choice_element.click()
            self.browser.find_element_by_id(f"vote").click()
            result_page_url = get_abs_url(self.live_server_url, "polls:results", [question.id])
            self.assertEqual(self.browser.current_url, result_page_url)

    @classmethod
    def tearDownClass(cls):
        cls.browser.close()


if __name__ == '__main__':
    links = get_links('https://cpske.github.io/ISP')
    for link in links:
        print("Valid: " + link)
    print("Checking invalid links...")
    broken_links = invalid_urls(links)
    for broken_link in broken_links:
        print("Broken: " + broken_link)
