![output-onlinepngtools-3](https://github.com/user-attachments/assets/6e68ae7b-382a-43c0-b426-393216c8843c)
# Friday
Friday is my CLI tooling for all my active repos and projects. It's cross platform, self contained with a docker build tool, and written in Go.


## Justification
When deciding to redo/refresh my portfolio, as well as starting some other personal side projects, it became obvious that a CLI tool would be extremely useful for manging all of the projects that I have. Combined with Docker it has the ability to make the dev env for any project a single command setup.
Given that I develop on both MacOS (Apple Silicon) and Windows (AMD) it needed to be written in a language that was straight forward to use and could be ran cross platform without having additional runtimes or dependencies required. Golang has Cobra, which was a perfect framework for writing a CLI tool in, and checks the box for the other requirement.


## Methodolgy
As engineers I think we all want to make something perfect, and it becomes extremely easy to get mired down in the details. This can lead to abstractions early on, or putting work in to writing code that will scale to a level that it's never going to. 
Something I will be paying very serious attention to during this phase of side project development is picking the right tools for the job (not just the ones I want to play with) and not over-engineering tools/projects.
You'll see that reflected in this tooling, that it is just what is needed to accomplish it's tasks without being sloppy and without going overboard on implementation.
Another important consideration was cost. I've sadly seen the hard way how even small cloud bills can quickly become annoying expenses - having local CI/CD tooling is one of my answers to dealing with that cost. I have the local computing power, why not utilize it?

The project is laid out so that there are top level "verb" command files that call sub-level "noun" functions. It's laid out that way because well that's how you write CLI commands, so it should make it very easy to navigate.

The Go tool is wrapped in a lightweight bash script that can run the docker build, by default will forward arguements to the proper go tooling for the cpu architecture it is being run on.


## Supported Projects
### [Christmas Container](https://github.com/kyleboehlen/christmas-container)
Docker enviroment with Python tools and boilerplate for [Advent of Code](https://adventofcode.com)

### [krypto](https://github.com/kyleboehlen/krypto)
Serverless *Go* API that *fetches* redirects and photography information


## Usage
This should be enough to get you up and going:

`./friday.sh --help`
