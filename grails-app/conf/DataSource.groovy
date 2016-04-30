dataSource {
    pooled = true
//    driverClassName = "com.mysql.jdbc.Driver"
//    username = "root"
//    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
//        dataSource {
//            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
//            zzurl = "jdbc:mysql://localhost/subastas"
//        }
        dbCreate = "create"
            driverClassName = "org.postgresql.Driver"
            dialect = org.hibernate.dialect.PostgreSQLDialect
            url = 'postgres://ennhgfqguwkgvr:erfiKOFNuUjiUiTgxxSun4bIg1@ec2-54-225-94-145.compute-1.amazonaws.com:5432/d5s0lnrks94gm0 '
            username = 'ennhgfqguwkgvr'
            password = 'erfiKOFNuUjiUiTgxxSun4bIg1'
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost/subastas"
        }
    }
    production {
//        dataSource {
//            dbCreate = "update"
//            url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
//            pooled = true
//            properties {
//               maxActive = -1
//               minEvictableIdleTimeMillis=1800000
//               timeBetweenEvictionRunsMillis=1800000
//               numTestsPerEvictionRun=3
//               testOnBorrow=true
//               testWhileIdle=true
//               testOnReturn=true
//               validationQuery="SELECT 1"
//            }
//        }
            dbCreate = "create"
            driverClassName = "org.postgresql.Driver"
            dialect = org.hibernate.dialect.PostgreSQLDialect
            url = 'postgres://ennhgfqguwkgvr:erfiKOFNuUjiUiTgxxSun4bIg1@ec2-54-225-94-145.compute-1.amazonaws.com:5432/d5s0lnrks94gm0 '
            username = 'ennhgfqguwkgvr'
            password = 'erfiKOFNuUjiUiTgxxSun4bIg1'
    }
}
