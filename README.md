\#MakerHood
================
[makerhood.nz](http://www.makerhood.nz/)
---

#####We are the #makerhood, a community that creates its own destiny.

An initiative designed and led by the South Auckland community, in New Zealand, to develop a generation of creative, entrepreneurial, engaged and full of purpose people.

Tapping into two already existing projects Oceania Career Academy and The Roots, #makerhood creates a platform for young South Aucklanders to leapfrog from unemployment and underpaid jobs to the most valuable skills in the world we are living in.

The secret: Fusion
Design + Trades
Thinking + Doing
Creativity + Practicality
Minds + Hands
Immediate + Futuristic
Low tech + High tech

Links to get some inspiration
(maker and DIY tutorials)

Instructables
Thingiverse
Makezine
Maker Faire
DIY Drones
Brit.co
iFixit
Maori Future Makers
Wikihouse
Open Desk
POC21
BicycleTutor
Permaculture Tutorials
Poppy Projects
Open Robot Hardware

Getting Started
---------------

##### Mac OS Quickstart
- install homebrew: `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
- postgres: `brew install postgres`
- elasticsearch: `brew install elasticsearch`
- git: `brew install git`
- do setup in General Quickstart

##### Linux Quickstart
- postgres: `sudo apt-get update`
`sudo apt-get install postgresql postgresql-contrib`
- elasticsearch: [https://www.digitalocean.com/community/tutorials/how-to-install-elasticsearch-on-an-ubuntu-vps](https://www.digitalocean.com/community/tutorials/how-to-install-elasticsearch-on-an-ubuntu-vps)
- git: `sudo apt-get install git`

##### General Quickstart
- install rvm [https://rvm.io/rvm/install#quick-guided-install](https://rvm.io/rvm/install#quick-guided-install)
- install ruby with rvm `rvm install ruby-2.2.1`
- connect your git with github (skip if done) [https://help.github.com/articles/set-up-git/](https://help.github.com/articles/set-up-git/)
- checkout project somewhere: `git clone git@github.com:MakersNZ/MakersMap.git`
- move to project directory: `cd MakersMap`
- install bundler `gem install bundler`
- bundle all the gems `bundle`
- install npm
- install bower `npm install bower`
- install js dependencies with bower `rake bower:install`
- configure database connection inside: config/database.yml
- create new database: `rake db:create`
- run database migrations `rake db:migrate`
- seed starting data `rake db:seed`
- FIRE UP THE APP `rails server`
- Check it works in your browser [http://localhost:3000](http://localhost:3000)
- Make changes, reload browser to see them happen


Documentation and Support
-------------------------

To refresh the ElasticSearch Index, run `rake refresh_es`

Contact
----
- Oceania Academy: info@oca.nz

- The Roots: info@theroots.org.nz


Contributing
------------
Please fork the repo to your own github account, make a new branch for your feature/changes and then make a pull request to have it merged back into this repo.

Credits
-------
This project was designed in January 2016 in a Mesa&Cadeira for Auckland Council with the contributions of:

Baruk Jacob, Barbara Soalheiro, Elizabeth Cretney, Gabriela Agustini, Gael Surgenot, Jaco van der Merwe, Joel Umali, John Belford-Lelaulu, John Kotoisuva, Joran Kikke, Livia Araujo, Lucas Tauil de Freitas, Rui Peng, Russell O’Brien, Sandra Chemin, Waikare Komene. Pictures and Video by: Simon WIlson.


License
-------

GNU Affero General Public License v3 [https://tldrlegal.com/license/gnu-affero-general-public-license-v3-(agpl-3.0)](AGPL-3.0)
