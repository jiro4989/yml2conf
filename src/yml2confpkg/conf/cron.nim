import strformat

import types

import yaml

type
  ConfigCron = object
    yml2conf: Yml2Conf
    configs: seq[Cron]
  Cron = object
    minute, hour, day, month, day_of_month, command: string

proc generate*(s: string): string =
  var conf: ConfigCron
  s.load(conf)
  for c in conf.configs:
    let line = &"{c.minute} {c.hour} {c.day} {c.month} {c.day_of_month} {c.command}"
    result.add(line)
    result.add("\n")
