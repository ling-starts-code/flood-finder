# Use an existing Docker image as the base
FROM ruby:3.2.1

# Set the working directory inside the container
WORKDIR /app

RUN apt update && \
  apt install -y curl postgresql-client && \
  rm -rf /var/lib/apt/lists/*

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN gem install bundler && \
    bundle install --jobs 20 --retry 5

# Copy the rest of the application code to the container
COPY . .

# Set environment variables
ENV RAILS_ENV=production

# Precompile assets and run database migrations
RUN bundle exec rails assets:precompile && \
    bundle exec rails db:migrate

# Expose the port on which the Rails application will run
EXPOSE 3000

# Start the Rails application server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
