FROM composer as builder
RUN git config --global url."https://github.com/".insteadOf git@github.com:

WORKDIR /opt/app-root/src/
COPY composer.* ./

#RUN composer install


FROM registry.apps.dev.ocp-dev.ised-isde.canada.ca/ised-ci/drupal-wxt:ised-8.x



#COPY --from=builder /app/vendor /var/www/vendor
COPY --from=builder /usr/bin/composer /usr/bin/composer
COPY composer.* ./

# disable mem limits temporarily 
USER root
RUN echo 'memory_limit = -1' >> /etc/php.ini
USER 1001

RUN composer install

RUN echo 'Beginning...'






