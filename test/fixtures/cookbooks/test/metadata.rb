# frozen_string_literal: true

name              'test'
maintainer        'Mendy Baitelman'
maintainer_email  'mendy@baitelman.com'
license           'Apache-2.0'
description       'Testing cookbook for loki'
version           '0.0.1'
depends           'loki'

depends 'apt'
depends 'curl'
