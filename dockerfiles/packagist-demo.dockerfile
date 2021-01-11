FROM registry.apps.dev.ocp-dev.ised-isde.canada.ca/ised-ci/drupal-wxt:ised-8.x

# tell git to use https
RUN git config --global url."https://github.com/".insteadOf git@github.com:

# disable mem limits temporarily 
USER root
RUN echo 'memory_limit = -1' >> /etc/php.ini
USER 1001

RUN echo 'Beginning...'

# cd into our app's root dir
RUN cd /opt/app-root/src/

COPY composer.json .



CMD bash -c "composer install"



