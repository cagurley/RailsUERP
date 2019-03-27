# **RailsUERP**, A Foundation for a University Enterprise Resource Planning Application

## *Project Objective*

This project was conceived as a foundation for a website designed for artists and developers to collaborate on video game creation without the need for explicit partnership. My personal goal was to discover algorithms for routing complex page interactions and implement the basic routing functionality I would want in the publically-released product.

## *Viewing Project*

A warning: this project has _significant_ dependencies; apologies in advance for the inconvenience. Because of the number of steps involved, please refer to the following ordered list:

1. To start, `git clone` or download the repo from https://github.com/cagurley/RailsUERP.
2. Verify or install Ruby v2.5.3 on your machine. You can find the mirror for your particular OS at https://www.ruby-lang.org/en/downloads/. __Note__: I imagine that any version greater than or equal to 2.5 would work properly, but I make no guarantees. If you want to use one of these different versions, edit the `/Gemfile` to account for this.
<!-- 3. Verify or install Rails v5.2.2 or any other 5.2 version with a greater patch number. -->
4. Because of issues with the `bootstrap` gem, you'll need to verify or install Node.js for the runtime environment; that can be done at https://nodejs.org/en/download/. I used v8.12.0 during development, so I think you should be good with any version greater than or equal to that.
5. Now the biggest dependency: PostgreSQL 11. Mirrors can be found at https://www.postgresql.org/download/.
6. Either during installation or afterward (might depend on your OS), you will need to designate the port on which the PostgreSQL server will run and the username and password for the database cluster superuser. Stick with the defaults for the port and username, `5432` and `postgres` respectively, and set the password to `pachydermalelephantine`. __Note:__ This can be altered if you have already set these values to something different during a prior installation; in such a case, you will need to edit `/config/database.yml`.
7. With the database cluster initialized, open a shell window or Windows command prompt (__note: must be done via the "Run as Administrator" option__) and `cd` into the `/bin/` subdirectory in the new PostgreSQL directory, which might be a few levels deep.
8. Find your data directory for your PostgreSQL cluster and note its path. Replacing `DATADIR` with a path to this data directory, start the database server with the command `sudo pg_ctl start -D DATADIR` on Linux (just a guess, as I develop on Windows currently) or `pg_ctl start -D DATADIR -U postgres -P pachydermalelephantine` on Windows (the values after `-U` an `-P` are your superuser username and password, respectively, so change these if you didn't stick with my suggestions above).
9. Once the terminal output indicates that the server has successfully started, `cd` into the cloned repo's root directory.
10. Run the following commands below in sequence; Windows users must replace each instance of `bin/rails` in the relevant following commands with `ruby bin\rails`):
    * `bundle install` (this might take a while)
    * `bin/rails db:setup`
    * `bin/rails s`
11. Finally, open up your favorite web browser and navigate to [localhost:3000](localhost:3000). Upon receiving the authentication alert, enter `postgres` and `postsecret` for the username and password.
12. __You're here!__ Navigate to the person index view and play with the full CRUD functionality. For people added, tinker with the full CRUD functionality of their associated name models.
13. When you're done, kill the rails server with `Ctrl+C`, `cd` back into the `/bin/` directory of the PostgreSQL directory and run `sudo pg_ctl stop -D DATADIR -m s` on Linux or `pg_ctl stop -D DATADIR -m s` on Windows.

## *Notes on Functionality*

The only model with full CRUD functionality implemented is `Asset`. However, `Contributor.cs` has CRU functionality (deletion was omitted as I didn't want to anonymize contributions after the fact and user account validation is not implemented), and `Project` has CRU functionality plus the "soft delete" inactivation/reactivation functionality (which prevents cascade-deletion or orphaning of assets and allows users to reactivate projects that regain promise later). `AssetType`, `AssetSubtype`, `AssetTypeSubtypePairing`, and `ProjectCategory` are not intended to be altered by the user and are thus relegated to "look-up" functionality.

### Thanks for reviewing my site! Please let me know where I can most improve.

###### Website &copy; Colton Atticus Gurley

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
