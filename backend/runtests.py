#!/usr/bin/env python

# This file mainly exists to allow python setup.py test to work.
import os, sys
import django
from django.test.utils import get_runner
from django.conf import settings

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "regatta.settings")
django.setup()

def runtests():
    TestRunner = get_runner(settings)
    test_runner = TestRunner(verbosity=1, interactive=True)
    failures = test_runner.run_tests(['events'])
    sys.exit(bool(failures))

if __name__ == '__main__':
    runtests()

