#!/bin/bash
set -e
if [ ! -d assets ]; then
    mkdir assets
fi

if [ ! -f assets/eclipselink-plugins-2.6.5.zip ]; then
    curl -L "http://www.eclipse.org/downloads/download.php?file=/rt/eclipselink/releases/2.6.5/eclipselink-plugins-2.6.5.v20170607-b3d05bd.zip&r=1" -o assets/eclipselink-plugins-2.6.5.zip
fi

unzip -o -j "assets/eclipselink-plugins-2.6.5.zip" "org.eclipse.persistence.asm_*.jar" -d "assets"
unzip -o -j "assets/eclipselink-plugins-2.6.5.zip" "org.eclipse.persistence.core_*.jar" -d "assets"
unzip -o -j "assets/eclipselink-plugins-2.6.5.zip" "org.eclipse.persistence.jpa_*.jar" -d "assets"
unzip -o -j "assets/eclipselink-plugins-2.6.5.zip" "org.eclipse.persistence.antlr_*.jar" -d "assets"
unzip -o -j "assets/eclipselink-plugins-2.6.5.zip" "org.eclipse.persistence.jpa.jpql_*.jar" -d "assets"
unzip -o -j "assets/eclipselink-plugins-2.6.5.zip" "org.eclipse.persistence.jpa.modelgen_*.jar" -d "assets"
unzip -o -j "assets/eclipselink-plugins-2.6.5.zip" "org.eclipse.persistence.extension_*.jar" -d "assets"

if [ ! -f assets/jgroups-3.2.8.Final.jar ]; then
    curl -L "https://sourceforge.net/projects/javagroups/files/JGroups/3.2.8.Final/jgroups-3.2.8.Final.jar" -o assets/jgroups-3.2.8.Final.jar
fi

docker build -t 38leinad/wlp-javaee7-eclipselink:latest .