# Websphere Liberty + EclipseLink Extensions Docker image

This Docker image is based on `wlp-javaee7-jdbc` and additionally contains EclipseLink as a customer JPA Provider.
Why do this when EclipseLink is already the default JPA-provider in Liberty?
Because EclipseLink shipped with Liberty does not contain the cache-coordination feature via JGroups.
This image contains the JGroups-integration.

You can read more about it [on my blog](http://dplatz.de/blog/2018/wlp-eclipselink-cache-coordination.html).