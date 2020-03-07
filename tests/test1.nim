import unittest, streams, typeinfo

import yaml

type
  Sample1 = object of RootObj
    n: int
  Sample2 = object of RootObj
    s: string
  Yml2Conf = object of RootObj
    version: string
  Cron = ref object of RootObj
    minute, hour, day, month, day_of_month, command: string
  Config = object
    yml2conf: Yml2Conf
    configs: seq[Cron]
  Config2 = object
    yml2conf: Yml2Conf
    configs: seq[Any]

suite "suite":
  test "test1":
    var conf: Sample1
    var strm = newFileStream("tests/sample1.yml")
    defer: strm.close()
    strm.load(conf)
    echo conf
  test "test2":
    var conf: Sample2
    var strm = newFileStream("tests/sample2.yml")
    defer: strm.close()
    strm.load(conf)
    echo conf
  test "cron":
    var conf: Config
    var strm = newFileStream("examples/cron.yml")
    defer: strm.close()
    strm.load(conf)
    echo conf
