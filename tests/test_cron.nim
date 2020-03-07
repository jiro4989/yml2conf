import unittest

include yml2confpkg/conf/cron

suite "generate":
  test "pattern1":
    const s = """
yml2conf:
  version: 1.0

configs:
  - minute: "0"
    hour: "1"
    day: "*"
    month: "*"
    day_of_month: "*"
    command: "echo 1 hours"

  - minute: "*/5"
    hour: "2"
    day: "*"
    month: "*"
    day_of_month: "*"
    command: "echo 1 hours"
    """
    const want = """0 1 * * * echo 1 hours
*/5 2 * * * echo 1 hours
"""
    check generate(s) == want

  test "pattern2":
    const s = """
yml2conf:
  version: 1.0

configs:
  - { minute: 0, hour: 1, day: "*", month: "*", day_of_month: "*", command: "echo test" }
  - { minute: 0, hour: 2, day: "*", month: "*", day_of_month: "*", command: "echo test" }
  - { minute: 0, hour: 3, day: "*", month: "*", day_of_month: "*", command: "echo test" }
"""
    const want = """0 1 * * * echo test
0 2 * * * echo test
0 3 * * * echo test
"""
    check generate(s) == want

#[
  test "pattern3":
    const s = """
yml2conf:
  version: 1.0

common: &common
  minute: "0"
  day: "*"
  month: "*"
  day_of_month: "*"

configs:
  - { hour: 1, command: "echo test 1", <<: *common }
  - { hour: 2, command: "echo test 2", <<: *common }
  - { hour: 3, command: "echo test 3", <<: *common }
"""
    const want = """0 1 * * * echo test 1
0 2 * * * echo test 2
0 3 * * * echo test 3
"""
    check generate(s) == want
]#

