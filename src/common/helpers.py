from IPython.display import HTML


def print_warn(s):
    print(f'\x1b[31m{s}\x1b[0m\n')


def html_df(df, head=3):
    return HTML(df.head(head).to_html())
