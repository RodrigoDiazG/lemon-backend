# We use rails image 
FROM ruby:2.6.3
# Set limoneno like work folder
WORKDIR /limoneno
# Copy the gemfile to run the install of dependencies 
COPY Gemfile* ./
# Run the install of dependencies
RUN bundle install
# Copy the app into the container
COPY . .
# Run the apidoc to make the api documentation
# replace the env file
RUN mv .env.production .env
# Expose port 5000 to
EXPOSE 5000
# Set env vars
ENV RAILS_ENV production
# Install foreman
RUN gem install foreman
# Run the app
CMD ["bash", "-c", "rake db:migrate && rake db:seed && foreman start"]