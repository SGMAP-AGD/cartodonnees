# http://lecomarquage.service-public.fr/donnees_locales_v2/all_latest.tar.bz2

if(!file.exists("robots/dila/all_latest.tar.bz2")){
  download.file("http://lecomarquage.service-public.fr/donnees_locales_v2/all_latest.tar.bz2","robots/dila/all_latest.tar.bz2")
}

untar("robots/dila/all_latest.tar.bz2","robots/dila")
