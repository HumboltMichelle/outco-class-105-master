# App Diagramming & System Design - Instagram

### Prompt

##### Part 1

Design the high-level architecture for an Instagram clone, starting with the database schema you'll need. For now, you can ignore scale, and just focus on the relationships between the data.

Features you should be able to model are:

* Users
* Photos
* Comments
* Hash Tags
* Likes
* Following/Followers

These are the main ones, but think of how you might model any additional features you can think of.

You should also be able to describe how a particular `GET` or `POST` request will get handled.

Some good routes to think about might be:

* How would an individual user view all their photos?
* How would they view all the photos of someone they are following?
* How would leaving a comment work?
* What about a hashtag? Or a like?
* How would a request to follow work? How would it get approved?

#### Solution

[//]: {{{

![Instagram Entity Relationship Diagram](https://res.cloudinary.com/outco-io/image/upload/v1538184307/Paper.Instagram_ERD.1.png)

[//]: ---

YOUR WORK HERE

[//]: }}}


##### Part 2

Now suppose you wanted to scale the number of users on your platform to 10,000,000. Starting from a single server that handled all the requests, and housed your database, how could you start to scale and split things up?

Some parameters to work with:

* With 10,000,000 users you will be receiving 10,000 requests per second, but your server can only handle 2,000 maximum.
* 95% of requests or reads, while 5% of them are writes.
* You want high availability over consistency.
* Traffic will be evenly distributed.
* Average picture is 3 MB.


Some things to consider:

* Using a CDN for photos, and Amazon S3 for the photo storage.

* Relational database for photo metadata and user data.

* Load balancer for session storage.

* Read/ Write servers to handle different kinds of traffic

* Leader / Follower replication for database redundancy.

* Caching layer in between the server and database for faster load times.


### Resources

[Repo with Resources on Github](https://github.com/donnemartin/system-design-primer)

 [High Level Architecture for Instagram at 14 million users](https://instagram-engineering.com/what-powers-instagram-hundreds-of-instances-dozens-of-technologies-adf2e22da2ad)

 [Scalability Lecture at Harvard ](https://www.youtube.com/watch?v=-W9F__D3oY4&list=PLcSNwoY_zA3b9McOf2rDRinpzyt2hlHzC&index=10)

[Slides from Scalability Lecture on Cloudinary]() (Not yet available)

#### Solution

[//]: {{{

##### Instagram used:

* PostgreSQL for most user data, photo metadata, tags etc.

* Master-replica for all PostgreSQL instances, with RAID (redundant array of independent disks) for data redundancy.

* Redis was used to power their main feed, activity feed, sessions System.

* 6 Memcached instances for caching.

* Photos to Amazon S3, CloudFront CDN for load times around the world. In fact, most of their load balancing, and search was done on Amazon.

* Several terabytes of photos.

* 3 engineers TOTAL.

[//]: ---

YOUR WORK HERE

[//]: }}}
