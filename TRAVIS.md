## Set up the build user

- For the user to be used for the build, go to the *user* settings, and generate a key. This will be used to do password-less login.



## Set up Travis

- Connect the Github and Travis - go to https://travis-ci.com and log in with your Github account

Then, as shown below, go to the Project Settings tabs and configure it:

    Check some options on General Settings

        check the Build only if .travis.yml is present option

        check the Build pushes option

    Create some Environment Variables that will be used in .travis.yml file:

        GH_USER_NAME : your GitHub username

        GH_USER_EMAIL : your GitHub account email

        GH_TOKEN: the token created on previous step


<code>
sudo: required

services:
  - docker                  

before_install:            
  - mkdir -p output
  - docker pull asciidoctor/docker-asciidoctor

script:
  - docker run -v $TRAVIS_BUILD_DIR:/documents/ --name asciidoc-to-html asciidoctor/docker-asciidoctor asciidoctor -D /documents/output *.adoc      
  - docker run -v $TRAVIS_BUILD_DIR:/documents/ --name asciidoc-to-pdf asciidoctor/docker-asciidoctor asciidoctor-pdf -D /documents/output *.adoc    

after_error: 
  - docker logs asciidoc-to-html
  - docker logs asciidoc-to-pdf

after_failure:
  - docker logs asciidoc-to-html
  - docker logs asciidoc-to-pdf

after_success:      
  - cd output ; mv README.html index.html ; cp -R ../images images
  - git init
  - git config user.name "${GH_USER_NAME}"
  - git config user.email "{GH_USER_EMAIL}"
  - git add . ; git commit -m "Deploy to GitHub Pages"
  - git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1

</code>

# Maintenance

The document is built in ASCIIDOC format (similar to Markdown, but more flexible).

The conversion to web pages is done using [asciidoctor](https://asciidoctor.org/docs/asciidoctor/). The conversion to PDF is done using [asciidoctor-pdf](https://asciidoctor.org/docs/asciidoctor-pdf/)