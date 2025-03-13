#!/usr/bin/env python3

import re
import sys
import urllib.request

play_store_url = 'https://play.google.com/store/apps/details?id='


def main():
    if len(sys.argv) != 2:
        print('Usage: get-published-version.py <package_name>')
        sys.exit(1)
    package_name = sys.argv[1]
    print(get_published_android_app_version(package_name))


def get_published_android_app_version(app_id: str) -> str:
    # https://stackoverflow.com/a/39790287
    store_url = play_store_url + app_id
    with urllib.request.urlopen(store_url) as response:
        html = response.read().decode('utf-8')
    matches = re.findall(r'\[\[\[\"\d+\.\d+\.\d+', html)
    if not matches or len(matches) > 1:
        raise Exception('Could not fetch Android app version info!')
    return matches[0][4:]


if __name__ == '__main__':
    main()
