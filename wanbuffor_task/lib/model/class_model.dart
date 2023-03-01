
class ClassModel {
    String? msg;
    String? code;
    String? iosUpdate;
    String? androidUpdate;
    Model? model;

    ClassModel({this.msg, this.code, this.iosUpdate, this.androidUpdate, this.model});

    ClassModel.fromJson(Map<String, dynamic> json) {
        msg = json["msg"];
        code = json["code"];
        iosUpdate = json["ios_update"];
        androidUpdate = json["android_update"];
        model = json["model"] == null ? null : Model.fromJson(json["model"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["msg"] = msg;
        _data["code"] = code;
        _data["ios_update"] = iosUpdate;
        _data["android_update"] = androidUpdate;
        if(model != null) {
            _data["model"] = model?.toJson();
        }
        return _data;
    }
}

class Model {
    List<Slider>? slider;
    List<Categories>? categories;
    List<Featuredcategories>? featuredcategories;
    List<Newproducts>? newproducts;
    String? currency;

    Model({this.slider, this.categories, this.featuredcategories, this.newproducts, this.currency});

    Model.fromJson(Map<String, dynamic> json) {
        slider = json["slider"] == null ? null : (json["slider"] as List).map((e) => Slider.fromJson(e)).toList();
        categories = json["categories"] == null ? null : (json["categories"] as List).map((e) => Categories.fromJson(e)).toList();
        featuredcategories = json["featuredcategories"] == null ? null : (json["featuredcategories"] as List).map((e) => Featuredcategories.fromJson(e)).toList();
        newproducts = json["newproducts"] == null ? null : (json["newproducts"] as List).map((e) => Newproducts.fromJson(e)).toList();
        currency = json["currency"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(slider != null) {
            _data["slider"] = slider?.map((e) => e.toJson()).toList();
        }
        if(categories != null) {
            _data["categories"] = categories?.map((e) => e.toJson()).toList();
        }
        if(featuredcategories != null) {
            _data["featuredcategories"] = featuredcategories?.map((e) => e.toJson()).toList();
        }
        if(newproducts != null) {
            _data["newproducts"] = newproducts?.map((e) => e.toJson()).toList();
        }
        _data["currency"] = currency;
        return _data;
    }
}

class Newproducts {
    String? id;
    String? name;
    String? price;
    String? specialPrice;
    String? ruleDiscountAmount;
    String? ruleDiscountPercent;
    String? sku;
    int? qty;
    int? hasOptions;
    int? hasCustomOptions;
    int? isWishlist;
    String? imageUrl;
    Seller? seller;
    int? reviewCount;
    int? rating;
    bool? restrictedProduct;
    bool? videoFlag;

    Newproducts({this.id, this.name, this.price, this.specialPrice, this.ruleDiscountAmount, this.ruleDiscountPercent, this.sku, this.qty, this.hasOptions, this.hasCustomOptions, this.isWishlist, this.imageUrl, this.seller, this.reviewCount, this.rating, this.restrictedProduct, this.videoFlag});

    Newproducts.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        name = json["name"];
        price = json["price"];
        specialPrice = json["special_price"];
        ruleDiscountAmount = json["rule_discount_amount"];
        ruleDiscountPercent = json["rule_discount_percent"];
        sku = json["sku"];
        qty = json["qty"];
        hasOptions = json["has_options"];
        hasCustomOptions = json["has_custom_options"];
        isWishlist = json["is_wishlist"];
        imageUrl = json["image_url"];
        seller = json["seller"] == null ? null : Seller.fromJson(json["seller"]);
        reviewCount = json["review_count"];
        rating = json["rating"];
        restrictedProduct = json["restricted_product"];
        videoFlag = json["video_flag"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["name"] = name;
        _data["price"] = price;
        _data["special_price"] = specialPrice;
        _data["rule_discount_amount"] = ruleDiscountAmount;
        _data["rule_discount_percent"] = ruleDiscountPercent;
        _data["sku"] = sku;
        _data["qty"] = qty;
        _data["has_options"] = hasOptions;
        _data["has_custom_options"] = hasCustomOptions;
        _data["is_wishlist"] = isWishlist;
        _data["image_url"] = imageUrl;
        if(seller != null) {
            _data["seller"] = seller?.toJson();
        }
        _data["review_count"] = reviewCount;
        _data["rating"] = rating;
        _data["restricted_product"] = restrictedProduct;
        _data["video_flag"] = videoFlag;
        return _data;
    }
}

class Seller {
    String? id;
    String? name;
    int? rating;

    Seller({this.id, this.name, this.rating});

    Seller.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        name = json["name"];
        rating = json["rating"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["name"] = name;
        _data["rating"] = rating;
        return _data;
    }
}

class Featuredcategories {
    String? name;
    String? id;
    String? parentid;
    int? productCount;
    String? sortOrder;
    String? imageUrl;

    Featuredcategories({this.name, this.id, this.parentid, this.productCount, this.sortOrder, this.imageUrl});

    Featuredcategories.fromJson(Map<String, dynamic> json) {
        name = json["name"];
        id = json["id"];
        parentid = json["parentid"];
        productCount = json["product_count"];
        sortOrder = json["sort_order"];
        imageUrl = json["image_url"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["name"] = name;
        _data["id"] = id;
        _data["parentid"] = parentid;
        _data["product_count"] = productCount;
        _data["sort_order"] = sortOrder;
        _data["image_url"] = imageUrl;
        return _data;
    }
}

class Categories {
    String? name;
    String? id;
    String? parentid;
    int? productCount;
    String? sortOrder;
    String? imageUrl;

    Categories({this.name, this.id, this.parentid, this.productCount, this.sortOrder, this.imageUrl});

    Categories.fromJson(Map<String, dynamic> json) {
        name = json["name"];
        id = json["id"];
        parentid = json["parentid"];
        productCount = json["product_count"];
        sortOrder = json["sort_order"];
        imageUrl = json["image_url"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["name"] = name;
        _data["id"] = id;
        _data["parentid"] = parentid;
        _data["product_count"] = productCount;
        _data["sort_order"] = sortOrder;
        _data["image_url"] = imageUrl;
        return _data;
    }
}

class Slider {
    String? imageUrl;
    String? bannerTitle;
    String? brandId;
    String? categoryId;
    String? categoryName;
    bool? isChild;

    Slider({this.imageUrl, this.bannerTitle, this.brandId, this.categoryId, this.categoryName, this.isChild});

    Slider.fromJson(Map<String, dynamic> json) {
        imageUrl = json["image_url"];
        bannerTitle = json["banner_title"];
        brandId = json["brand_id"];
        categoryId = json["category_id"];
        categoryName = json["category_name"];
        isChild = json["is_child"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["image_url"] = imageUrl;
        _data["banner_title"] = bannerTitle;
        _data["brand_id"] = brandId;
        _data["category_id"] = categoryId;
        _data["category_name"] = categoryName;
        _data["is_child"] = isChild;
        return _data;
    }
}