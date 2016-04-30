dataSource {
    pooled = true
    driverClassName = "org.postgresql.Driver"
    username = "ennhgfqguwkgvr"
    password = "erfiKOFNuUjiUiTgxxSun4bIg1"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:postgresql://ennhgfqguwkgvr:erfiKOFNuUjiUiTgxxSun4bIg1@ec2-54-225-94-145.compute-1.amazonaws.com:5432/d5s0lnrks94gm0"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:postgresql://ennhgfqguwkgvr:erfiKOFNuUjiUiTgxxSun4bIg1@ec2-54-225-94-145.compute-1.amazonaws.com:5432/d5s0lnrks94gm0"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:postgresql://ennhgfqguwkgvr:erfiKOFNuUjiUiTgxxSun4bIg1@ec2-54-225-94-145.compute-1.amazonaws.com:5432/d5s0lnrks94gm0"
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }
}
