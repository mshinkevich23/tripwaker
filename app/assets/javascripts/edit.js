function globalf() {
  cities = [
    "Shanghai",
    "Karachi",
    "Beijing",
    "Delhi",
    "Lagos",
    "Tianjin",
    "Istanbul",
    "Guangzhou",
    "Mumbai",
    "Moscow",
    "Dhaka",
    "Cairo",
    "São Paulo",
    "Lahore",
    "Shenzhen",
    "Seoul",
    "Jakarta",
    "Kinshasa",
    "Tokyo",
    "Mexico City",
    "Lima",
    "London",
    "New York City",
    "Bangkok",
    "Dongguan",
    "Nanjing",
    "Tehran",
    "Ahmedabad",
    "Bogotá",
    "Ho Chi Minh City",
    "Hong Kong",
    "Baghdad",
    "Wuhan",
    "Hyderabad",
    "Hanoi",
    "Luanda",
    "Rio de Janeiro",
    "Foshan",
    "Santiago",
    "Riyadh",
    "Singapore",
    "Shantou",
    "Saint Petersburg",
    "Pune",
    "Ankara",
    "Chennai",
    "Abidjan",
    "Chengdu",
    "Yangon",
    "Alexandria",
    "Chongqing",
    "Kolkata",
    "Xi'an",
    "Surat",
    "Johannesburg",
    "Dar es Salaam",
    "Suzhou",
    "Harbin",
    "Giza",
    "Zhengzhou",
    "New Taipei City",
    "Los Angeles",
    "Cape Town",
    "Shenyang",
    "Yokohama",
    "Busan",
    "Hangzhou",
    "Xiamen",
    "Quanzhou",
    "Berlin",
    "Jeddah",
    "Durban",
    "Kabul",
    "Jaipur",
    "Hefei",
    "Pyongyang",
    "Madrid",
    "Ekurhuleni",
    "Nairobi",
    "Addis Ababa",
    "Changsha",
    "Wenzhou",
    ];
    
    var acity;
    if(city == undefined || city == '') {
      acity = "Shanghai";
    } else {
      acity = city;
    }
    $(".form-place").val(acity);

    for (var i = 0; i < cities.length; i++) {
      if (cities[i] == city) {
        $(".chosen-city").append("<option selected>" + cities[i] + "</option>");
      } else {
        $(".chosen-city").append("<option>" + cities[i] + "</option>");
      }
    }
    $(".chosen-city").chosen();
    $(".chosen-city").on('change', function(evt, params) {
      console.log(params.selected);
      acity = params.selected;
      $(".form-place").val(params.selected);
    });

    langs = [
      "Mandarin",
      "English",
      "Spanish",
      "Hindi",
      "Arabic",
      "French",
      "Indonesian and Malay",
      "Portuguese",
      "Bengali",
      "Russian",
      "Urdu",
      "German",
      "Japanese",
      "Javanese",
      "Telugu",
      "Wu",
      "Korean",
      "Tamil",
      "Marathi",
      "Turkish",
      "Vietnamese",
      "Italian",
      "Western Panjabi",
      "Yue",
      "Kannada",
    ];

    var alangs = languages;

    for (var i = 0; i < langs.length; i++) {
      if (languages.indexOf(langs[i]) == -1) {
        $(".chosen-lang").append("<option>" + langs[i] + "</option>");
      } else {
        $(".chosen-lang").append("<option selected>" + langs[i] + "</option>");
      }
    }
    $(".chosen-lang").chosen();
    $(".chosen-lang").on('change', function(evt, params) {
      var j = alangs.indexOf(params.deselected);
      if (j > -1) {
          alangs.splice(j, 1);
      }
      if (params.selected != undefined) {
        alangs.push(params.selected);
      }
      console.log(alangs);
      if (alangs.length == 0) {
        $(".form-languages").val('');
      } else {
        $(".form-languages").val(alangs.join(','));
      }
    });

    ints = [
        "Photo",
        "Music",
        "Movies",
        "Sport",
        "Books",
        "Business",
        "Animals",
        "Food",
        "Science",
        "Art&Culture",
        "Entertainment",
    ];
    aints = interests;
    for (var i = 0; i < ints.length; i++) {
      if (interests.indexOf(ints[i]) == -1) {
        $(".chosen-interests").append("<option>" + ints[i] + "</option>");
      } else {
        $(".chosen-interests").append("<option selected>" + ints[i] + "</option>");
      }
    }
    $(".chosen-interests").chosen();
    $(".chosen-interests").on('change', function(evt, params) {
      var j = aints.indexOf(params.deselected);
      if (j > -1) {
          aints.splice(j, 1);
      }
      if (params.selected != undefined) {
        aints.push(params.selected);
      }
      console.log(aints);
      if (aints.length == 0) {
        $(".form-interests").val('');
      } else {
        $(".form-interests").val(aints.join(','));
      }
    });
}
