class DrugHelper {
  static String getAdenozine(int waga) {
    String doseInMlRounded = (waga * 0.1).toStringAsPrecision(2);
    String secondDoseRounded = (waga * 0.2).toStringAsPrecision(2);
    if (waga > 30) {
      return 'Nabierz 2 ampułki (12 mg) do strzykawki dwudziestki i rozcieńcz do'
          ' 12 '
          'ml solą fizjologiczną. Podaj $doseInMlRounded ml i.v. Druga dawka to '
          '$secondDoseRounded ml i.v. ';
    }
    return 'Nabierz 1 ampułkę (6 mg) do strzykawki dziesiątki i rozcieńcz do 6 '
        'ml solą fizjologiczną. Podaj $doseInMlRounded ml i.v. Druga dawka to '
        '$secondDoseRounded ml i.v. ';
  }

  static String getAdrenaline(int waga) {
    String adrenaline = (waga * 0.1).toStringAsPrecision(2);
    String dose = (waga * 0.01).toStringAsPrecision(2);
    return 'Nabierz 1 ampułkę (1 mg) do strzykawki dziesiątki i rozcieńcz do 10'
        ' ml solą fizjologiczną.\n\nPodaj $adrenaline ml i.v. Podałeś '
        '$dose mg'
        ' leku.';
  }

  static String getAdrenalineAnafilaksja(int waga) {
    if (waga < 20) {
      return '0.15 mg i.m. w przednioboczną powierzchnię uda.\n\nW praktyce '
          'nabierz 1 ampułkę do strzykawki dwójki i podaj 0.15 ml tj. póltorej '
          'kreseczki.';
    } else if (waga > 19 && waga < 37) {
      return '0.3 mg i.m. w przednioboczną powierzchnię uda.\n\nW praktyce '
          'nabierz 1 ampułkę do strzykawki dwójki i podaj 0.3 ml tj. 3 '
          'kreseczki.';
    }
    return '0.5 mg i.m. w przednioboczną powierzchnię uda.\n\nW praktyce '
        'nabierz 1 ampułkę do strzykawki dwójki i podaj 0.5 ml tj. pięć '
        'kreseczek.';
  }

  static String getAdrenalinPompa(int waga) {
    if (waga < 6) {
      return 'Rozcieńcz 1 mg w 50 ml 0,9% NaCl. Podaj w pompie infuzyjnej z '
          'szybkością 1 ml/h.\n\nDawka podana: 20 µg/h';
    } else if (waga > 5 && waga < 9) {
      return 'Rozcieńcz 1 mg w 50 ml 0,9% NaCl. Podaj w pompie infuzyjnej z '
          'szybkością 2 ml/h.\n\nDawka podana: 40 µg/h';
    } else if (waga > 8 && waga < 12) {
      return 'Rozcieńcz 1 mg w 50 ml 0,9% NaCl. Podaj w pompie infuzyjnej z '
          'szybkością 3 ml/h.\n\nDawka podana: 60 µg/h';
    } else if (waga > 11 && waga < 16) {
      return 'Rozcieńcz 1 mg w 50 ml 0,9% NaCl. Podaj w pompie infuzyjnej z '
          'szybkością 4 ml/h.\n\nDawka podana: 80 µg/h';
    } else if (waga > 15 && waga < 17) {
      return 'Rozcieńcz 1 mg w 50 ml 0,9% NaCl. Podaj w pompie infuzyjnej z '
          'szybkością 5 ml/h.\n\nDawka podana: 100 µg/h';
    } else if (waga > 16 && waga < 23) {
      return 'Rozcieńcz 1 mg w 50 ml 0,9% NaCl. Podaj w pompie infuzyjnej z '
          'szybkością 7 ml/h.\n\nDawka podana: 140 µg/h';
    } else if (waga > 22 && waga < 27) {
      return 'Rozcieńcz 1 mg w 50 ml 0,9% NaCl. Podaj w pompie infuzyjnej z '
          'szybkością 8 ml/h.\n\nDawka podana: 160 µg/h';
    } else if (waga > 26 && waga < 33) {
      return 'Rozcieńcz 1 mg w 50 ml 0,9% NaCl. Podaj w pompie infuzyjnej z '
          'szybkością 9 ml/h.\n\nDawka podana: 180 µg/h';
    } else if (waga > 32 && waga < 35) {
      return 'Rozcieńcz 1 mg w 50 ml 0,9% NaCl. Podaj w pompie infuzyjnej z '
          'szybkością 11 ml/h.\n\nDawka podana: 220 µg/h';
    } else if (waga > 34 && waga < 37) {
      return 'Rozcieńcz 1 mg w 50 ml 0,9% NaCl. Podaj w pompie infuzyjnej z '
          'szybkością 12 ml/h.\n\nDawka podana: 240 µg/h';
    }
    return 'Rozcieńcz 1 mg w 50 ml 0,9% NaCl. Podaj w pompie infuzyjnej z '
        'szybkością 13 ml/h.\n\nDawka podana: 260 µg/h';
  }

  static String getAmiodaron(int waga) {
    if (waga < 21) {
      int dawka = waga * 5;
      return 'Nabierz 100 mg (tj. 2 ml leku z ampułki zawierającej 150 mg/3 ml)'
          ' do strzykawki dwudziestki i rozcieńcz do 20 ml 5% glukozą. Podaj '
          '$waga ml roztworu i.v. Podałeś $dawka mg leku.';
    } else if (waga > 20 && waga < 33) {
      String dawkaMl = (waga / 2).toStringAsPrecision(3);
      String dawkaMg = (waga * 5).toStringAsPrecision(3);
      return 'Nabierz 1 ampułkę (150 mg) do strzykawki dwudziestki i rozcieńcz '
          'do 15 ml 5% glukozą. Podaj $dawkaMl ml roztworu i.v.\n\n Podałeś '
          '$dawkaMg mg leku.';
    } else if (waga > 32 && waga < 41) {
      String dawkaMl = (waga / 2).toStringAsPrecision(2);
      String dawkaMg = (waga * 5).toStringAsPrecision(3);
      return 'Nabierz 4 ml leku (jedna cała ampułka i 1 ml z drugiej) do '
          'strzykawki dwudziestki i rozcieńcz do 20 ml 5% glukozą. '
          'Podaj $dawkaMl ml roztworu i.v.\n\n Podałeś '
          '$dawkaMg mg leku.';
    }
    return 'Nabierz 2 ampułki leku (300 mg) do strzykawki dwudziestki i '
        'rozcieńcz do 20 ml 5% glukozą.\n\nPodaj 20 ml roztworu i.v.';
  }

  static String getAtropine(int waga) {
    String dawkaMl = (waga / 10).toStringAsPrecision(2);
    String dawkaMg = (waga * 0.02).toStringAsPrecision(2);
    if (waga > 5) {
      return 'Nabierz 2 mg atropiny do strzykawki dziesiątki i rozcieńcz do 10 '
          'ml solą fizjologiczną. Podaj $dawkaMl ml roztworu i.v.\n\n Podałeś '
          '$dawkaMg mg leku.';
    }
    return 'Nabierz 1 mg Atropiny do strzykawki dziesiątki i rozcieńcz do 10 ml'
        ' solą fizjologiczną. Podaj 1 ml i.v. \n\nPodałeś 0,1 mg leku.';
  }

  static String getClonazepam() {
    return 'Nabierz 1 ampułkę (1 mg) do strzykawki dziesiątki i rozcieńcz do 10'
        ' ml 0,9% NaCl. Podaj 5 ml roztworu.\n\nPodałeś 0,5 mg leku.';
  }

  static String getDeksametazon(int waga) {
    if (waga < 4) {
      return 'Nabierz 4 mg do strzykawki dziesiątki i rozcieńcz do 10 ml solą '
          'fizjologiczną. Podaj 2,5 ml i.v.\n\nPodałeś 1 mg leku.';
    } else if (waga > 3 && waga < 10) {
      return 'Nabierz 4 mg do strzykawki dziesiątki i rozcieńcz do 10 ml solą '
          'fizjologiczną. Podaj 5 ml i.v.\n\nPodałeś 2 mg leku.';
    }
    return 'Podaj 4 mg leku i.v. lub i.m. Przed podaniem dożylnym lek rozcieńcz'
        ' do 10 ml solą fizjologiczną.';
  }

  static String getDiazepam(int waga) {
    String dawkaMl = (waga * 0.05).toStringAsPrecision(2);
    String dawakMg = (waga * 0.25).toStringAsPrecision(2);
    if (waga < 41) {
      return 'Nabierz 1 ampułkę (10 mg) do strzykawki dwójki. Podaj $dawkaMl ml '
          'leku powoli i.v.\n\nPodałeś $dawakMg mg leku.';
    }
    return 'Podaj 10 mg leku powoli i.v.';
  }

  static String getDiazepamPr(int waga) {
    String dawakMg = (waga * 0.5).toStringAsPrecision(2);
    if (waga < 10) {
      return 'Podaj $dawakMg mg leku p.r.\n\nNa wlewce nie ma podziałki - lek '
          'podaje się w przybliżeniu.';
    } else if (waga > 9 && waga < 16) {
      return '5 mg p.r.';
    }
    return '10 mg p.r.';
  }

  static String getFentanyl(int waga) {
    String dawkaMl = (waga * 0.1).toStringAsPrecision(2);
    return 'Nabierz 1 ampułkę (0,1 mg) do strzykawki dziesiątki i rozcieńcz do '
        '10 ml 0,9% NaCl. Podaj $dawkaMl ml roztworu. Podałeś $waga µg.\n'
        '\nRozważ zwiększenie (x2 lub x3) dawki jeśli brak efektu.';
  }

  static String getFurosemid(int waga) {
    if (waga < 21) {
      return 'Nabierz 1 ampułkę (20 mg) do strzykawki dwudziestki i rozcieńcz do '
          '20 ml 0,9% NaCl. Podaj $waga ml roztworu \n\nPodałeś $waga mg leku.';
    }
    return '20 mg i.v. (1 ampułka) w ciągu 5 min. \n\nMożna rozcieńczyć do 10 ml '
        '0,9% NaCl';
  }

  static String getGlukagon(int waga) {
    if (waga < 27) {
      return '0,5 mg i.m.';
    }
    return '1 mg i.m.';
  }

  static String getGlukoza(int waga) {
    return 'Podaj $waga ml leku i.v.';
  }

  static String getHydrokortyzon(int waga) {
    if (waga < 8) {
      return '25 mg i.v.\n\nRozcieńcz 100 mg leku do 4 ml wodą do iniekcji i '
          'podaj 1 ml.';
    } else if (waga > 7 && waga < 21) {
      return '50 mg i.v.';
    } else if (waga > 20 && waga < 41) {
      return '100 mg i.v.';
    }
    return '200 mg i.v.';
  }

  static String getIbuprofen(int waga) {
    if (waga < 7) {
      return 'Nie stosuje się u dzieci poniżej 7 kilogramów.';
    } else if (waga > 6 && waga < 9) {
      return '${waga * 5} - ${waga * 10} mg p.o. lub 60 mg p.r.';
    } else if (waga > 8 && waga < 10) {
      return '${waga * 5} - ${waga * 10} mg p.o. lub 60 mg p.r.';
    } else if (waga > 9 && waga < 11) {
      return '${waga * 5} - ${waga * 10} mg p.o. lub 60 mg p.r.';
    } else if (waga > 10 && waga < 12) {
      return '${waga * 5} - ${waga * 10} mg p.o. lub 60 mg p.r.';
    } else if (waga > 11 && waga < 14) {
      return '${waga * 5} - ${waga * 10} mg p.o lub 60 p.r.';
    } else if (waga > 13 && waga < 16) {
      return '${waga * 5} - ${waga * 10} mg p.o. lub 125 mg p.r.';
    } else if (waga > 15 && waga < 18) {
      return '${waga * 5} - ${waga * 10} mg p.o. lub 125 mg p.r.';
    } else if (waga > 17 && waga < 20) {
      return '${waga * 5} - ${waga * 10} mg p.o lub 125 mg p.r.';
    } else if (waga > 19 && waga < 22) {
      return '${waga * 5} - ${waga * 10} mg p.o. lub 125 mg p.r.';
    } else if (waga > 21 && waga < 25) {
      return '${waga * 5} - ${waga * 10} mg p.o. lub 125 mg p.r.';
    } else if (waga > 24 && waga < 28) {
      return '${waga * 5} - ${waga * 10} mg p.o. lub 125 p.r.';
    } else if (waga > 27 && waga > 33) {
      return '${waga * 5} - ${waga * 10} mg p.o. lub 125 mg p.r.';
    } else if (waga > 32 && waga < 36) {
      return '${waga * 5} - ${waga * 10} mg p.o. lub 125 mg p.r.';
    } else if (waga > 35 && waga < 40) {
      return '${waga * 5} - ${waga * 10} mg p.o. lub 125 mg p.r.';
    }
    return '${waga * 5} - ${waga * 10} mg p.o. lub 125 mg p.r.';
  }

  static String getMagnez(int waga) {
    String dawkaMl = (waga * 0.2).toStringAsPrecision(1);
    String dawakMg = (waga * 40).toString();
    return 'Nabierz $dawkaMl ml leku i dodaj do kroplówki 5% glukozy lub '
        'Optylite. Podaj we wlewie.\n\nPodałeś $dawakMg mg leku.';
  }

  static String getMidazolam(int waga) {
    String dawkaMl = (waga / 10).toStringAsPrecision(2);
    String dawakMg = (waga / 10).toStringAsPrecision(2);
    return 'Nabierz 5 mg leku i rozcieńcz do 5 ml 0,9% NaCl. Podaj $dawkaMl ml'
        ' roztworu.\n\nPodałeś $dawakMg mg leku.';
  }

  static String getMorfina(int waga) {
    String dawkaMl = (waga / 10).toStringAsPrecision(2);
    String dawakMg = (waga * 0.1).toStringAsPrecision(2);
    return 'Rozcieńcz 10 mg leku do 10 ml solą fizjologiczną. Podaj $dawkaMl ml'
        ' roztworu powoli i.v.\n\nPodałeś $dawakMg mg leku.\nMoże być konieczne'
        ' powtórzenie dawki.';
  }

  static String getNahco3(int waga) {
    return 'Nabierz $waga ml leku z ampułki 8,4% roztworu NaHCO3 i rozcieńcz w '
        'stosunku 1:1 wodą do iniekcji. Podawaj we wlewie z prędkością 1 '
        'kropla/sekundę.';
  }

  static String getNalokson(int waga) {
    String dawkaMl = (waga / 10).toStringAsPrecision(2);
    if (waga < 41) {
      return 'Nabierz 1 ampułkę (0,4 mg) do strzykawki dziesiątki i rozcieńcz '
          'do 4 ml 0,9% NaCl. Podaj $dawkaMl ml roztworu i.v. \n\nW razie '
          'potrzeby '
          'można powtórzyć.';
    }
    return '0,4 mg i.v. (1 ampułka)';
  }

  static String getParacetamolCzopek(int waga) {
    if (waga < 7) {
      return '50 mg p.r.';
    } else if (waga > 6 && waga < 11) {
      return '80 mg p.r.';
    } else if (waga > 10 && waga < 16) {
      return '125 mg p.r.';
    } else if (waga > 15 && waga < 29) {
      return '250 mg p.r.';
    }
    return '500 mg p.r.';
  }

  static String getParacetamol(int waga) {
    String dawkaMl = (waga * 0.75).toStringAsPrecision(2);

    String dawkaMg = (waga * 7.5).toStringAsPrecision(2);
    String dawkaMl2 = (waga * 1.5).toStringAsPrecision(2);
    String dawakMg2 = (waga * 15).toStringAsPrecision(3);
    if (waga < 11) {
      return 'Podaj $dawkaMl ml ($dawkaMg mg) leku we wlewie w ciągu 15 min.\n\n '
          'Dawkę '
          'rozcieńcz'
          ' w '
          'stosunku 1:10 w 0,9% NaCl lub 5% glukozie.';
    } else if (waga > 10 && waga < 33) {
      return 'Podaj $dawkaMl2 ml ($dawakMg2 mg) leku we wlewie w ciągu 15 min.'
          '\n\nDawkę rozcieńcz w stosunku 1:10 w 0,9% NaCl lub 5% glukozie.';
    }
    return 'Podaj 500 mg we wlewie trwającym conajmniej 15 min.';
  }

  static String getSalbutamol(int waga) {
    if (waga < 20) {
      return '2,5 mg w nebulizacji.\n\nW razie potrzeby dawkę można powtarzać co '
          '20 min.';
    }
    return '5 mg w nebulizacji.\n\nW razie potrzeby dawkę można powtarzać co 20'
        ' min.';
  }

  static String getPlyn(int waga) {
    String razy10 = (waga * 10).toString();
    return 'Podaj $razy10 ml we wlewie. \n\nW razie potrzeby można powtórzyć.';
  }
}
