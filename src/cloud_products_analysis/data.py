import pandas as pd
from cloud_products.aws import AwsCrawler


def get_cloud_products(use_cache=True):
    crawler = AwsCrawler()
    products = crawler.get_products(use_cache=use_cache)

    product_text = {}
    for product in products:
        product_lines = crawler.get_product_text(product, use_cache=use_cache)
        product_text[product.code] = " ".join(product_lines)

    df = pd.DataFrame.from_records([vars(p) for p in products])
    df['product_text'] = df["code"].apply(lambda code: product_text[code])
    
    return df
