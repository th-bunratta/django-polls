from http.client import HTTPSConnection, HTTPException
from urllib.parse import urlparse, urljoin
from selenium import webdriver
from typing import List


def invalid_urls(urllist: list) -> List[str]:
    import ssl
    ssl._create_default_https_context = ssl._create_unverified_context
    bad_urls = []
    for check_url in urllist:
        try:
            def get_response(url):
                parsed = urlparse(url)
                conn = HTTPSConnection(host=parsed.netloc)
                print(urljoin(parsed.path, parsed.query))
                conn.request("HEAD", urljoin(parsed.path, "?" + parsed.query))
                res = conn.getresponse()
                print(res.status, res.reason, url)
                if res.status in (301, 302) and res.headers["Location"] is not None:
                    # try:
                    location = urljoin(res.headers["Location"], parsed.query)
                    if urlparse(res.headers["Location"]).netloc != '':
                        print(parsed.netloc)
                        res = get_response(location)
                    else:
                        print(urljoin(parsed.netloc, location))
                        res = get_response(urljoin(parsed.netloc, location))
                    # except ConnectionRefusedError:
                    #     pass
                    # except:
                    #     bad_urls.append(check_url)
                    # finally:
                    #     return res
                return res

            res = get_response(check_url)

            if res.status in [404]:
                bad_urls.append(check_url)
        except HTTPException:
            bad_urls.append(check_url)
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


if __name__ == '__main__':
    links = get_links('https://cpske.github.io/ISP')
    for link in links:
        print("Valid: " + link)
    print("Checking invalid links...")
    broken_links = invalid_urls(links)
    for broken_link in broken_links:
        print("Broken: " + broken_link)
