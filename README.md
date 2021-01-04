# Scanning for Drupal 

A script to scan federal domains to identify sites running Drupal. This script uses data from [this GSA repository](https://github.com/GSA/data). The script makes a `curl` request to a website URL and looks for the `X-Generator` response header to identify Drupal sites. (Note - this is not a bulletproof way of identifying Drupal sites, but it's common for Drupal sites to use this response header.)

## Usage

Modify the default settings if needed. Invoke the script and direct output to a file, like so:

```bash
~$ ./scan.sh > site-generators.csv
```

## Other sources of similar data

* [Analysis of federal .gov domains](https://ben.balter.com/2021-analysis-of-federal-dotgov-domains/) 