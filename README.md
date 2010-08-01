# Captain-Hook

http://captain-hook.heroku.com/

## Ahoy!

Captain-Hook was written as a responder for a GitHub [post-receive hook](http://help.github.com/post-receive-hooks/). I wanted to have my Twitter automatically updated with a title and link any time I published a new post on my blog (hosted on GitHub, powered by [Jekyll](http://github.com/mattonrails/jekyll).

Pushing to a GitHub repository POSTs JSON data about the commit(s) to a hook URL, including repository info, and the messages for every commit. Captain-Hook detects a new post by parsing the commit message(s), looking for "NEW POST", and updates a Twitter account for each new post.

Working example:

	git commit -m "NEW POST: Ruby 2.0 released"

Failing example (sorry in advance):

	git commit -m "GOOD NEWS EVERYONE: Ruby 2.0 released"

**If your blog is on GitHub pages and you just love to tweet, this should save you time.**

## Requirements

- [sinatra](http://github.com/sinatra/sinatra) (1.0)
- json
- [twitter](http://github.com/jnunemaker/twitter)

## Getting Started

1. Fork or clone this repository
2. Install necessary gems with: `rake install_dependencies`
3. Copy config/config.example.yml to config/config.yml and modify
4. Follow the instructions [here](http://help.github.com/post-receive-hooks/) to setup post-receive hooks on a GitHub project
5. Push a new blog with "NEW POST" in the commit message, and wait for the traffic!

## TODO

- Generate a new [Vurl](http://vurl.me/) for each new Twitter post, for shorter tweets and click stats
- The specs could probably use some work...