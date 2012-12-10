Simple Secret Santa
===

This is a very basic secret santa engine I threw together for some friends. It’s a basic rails app, so you should be able to fork and run `rails s` with minimal setup.

## Heroku 
The app is currently set up for quick deploy to Heroku. Just follow the instructions [here](https://devcenter.heroku.com/articles/rails3) to get running.

## Configuration
You’ll need to rename `/config/application.example.rb` to `application.rb` and edit that file’s contents with Gmail/Google Apps account info in order to send emails via SMTP.

## User Management
Once the app is running, the list of users is available at `/users`, and isn’t protected by auth. I’m assuming your friends aren’t devs that’ll go snooping around. :)

## User Actions
You should generally run these in this order and spaced out by a day or so to give your guests time to act on each email.

### Invite Santas
This sends `/views/email_matches/invite_email.html.erb` to all users.

### Remind Santas
This sends `/views/email_matches/reminder_email.html.erb` to any users that have not RSVP’d yet.

### Match Santas
This matches santas with each other, but only for users that have RSVP’d.

### Email Matches
This sends `/views/email_matches/send_matches.html.erb` to all users that have RSVP’d and received a match.

### Envelope Button
This allows you to send the original invite email to an individual user. Useful if you have a late addtion.