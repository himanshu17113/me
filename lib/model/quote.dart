 

 

 
  
 

class Quote {

    Quote({
        required this.quote,
        required this.author,
    });

    factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        quote: json["quote"],
        author: json["author"],
    );
    String quote;
    String author;

    Map<String, dynamic> toJson() => {
        "quote": quote,
        "author": author,
    };
}
