package main

import (
	"fmt"
	"io/ioutil"
	"strings"

	"gopkg.in/yaml.v2"
)

type (
	AppConfig struct {
		Yml2conf Yml2conf      `yaml:"yml2conf"`
		Configs  []interface{} `yaml:"configs"`
	}
	Yml2conf struct {
		Version string `yaml:"version"`
	}
	Cron struct {
		Minute     string `yaml:"minute"`
		Hour       string `yaml:"hour"`
		Day        string `yaml:"day"`
		Month      string `yaml:"month"`
		DayOfMonth string `yaml:"day_of_month"`
		Command    string `yaml:"command"`
	}
	Sshd struct {
		Host         string
		HostName     string
		Port         string
		User         string
		IdentityFile string
	}
)

func main() {
	c := load("examples/cron.2.yml")
	s, err := formatCron(c)
	if err != nil {
		panic(err)
	}
	fmt.Println(s)

	c = load("examples/sshd_config.3.yml")
	s, err = formatSshdConfig(c)
	if err != nil {
		panic(err)
	}
	fmt.Println(s)
}

func load(path string) AppConfig {
	b, err := ioutil.ReadFile(path)
	if err != nil {
		panic(err)
	}
	var conf AppConfig
	if err := yaml.Unmarshal(b, &conf); err != nil {
		panic(err)
	}
	return conf
}

func formatCron(ac AppConfig) (string, error) {
	var lines []string
	for _, c := range ac.Configs {
		if cron, ok := c.(map[interface{}]interface{}); ok {
			line := fmt.Sprintf("%v %v %v %v %v %v", cron["minute"], cron["hour"], cron["day"], cron["month"], cron["day_of_month"], cron["command"])
			lines = append(lines, line)
		} else {
			fmt.Println("error")
		}
	}
	return strings.Join(lines, "\n"), nil
}

func formatSshdConfig(ac AppConfig) (string, error) {
	var lines []string
	for _, c := range ac.Configs {
		if sc, ok := c.(map[interface{}]interface{}); ok {
			var (
				host         = sc["Host"]
				hostName     = sc["HostName"]
				port         = sc["Port"]
				user         = sc["User"]
				identityFile = sc["IdentityFile"]
			)
			lines = append(lines, fmt.Sprintf("Host %v", host))
			lines = append(lines, fmt.Sprintf("  HostName     %v", hostName))
			lines = append(lines, fmt.Sprintf("  Port         %v", port))
			lines = append(lines, fmt.Sprintf("  User         %v", user))
			lines = append(lines, fmt.Sprintf("  IdentityFile %v", identityFile))
			lines = append(lines, "")
		} else {
			fmt.Println("error")
		}
	}
	return strings.Join(lines, "\n"), nil
}
