import pandas as pd

# title ratings
df = pd.read_csv('title.ratings.tsv', sep='\t')
df['tconst'] = df['tconst'].str.replace('tt', '')
df.to_csv("ratings.csv", header=False, index=False)

# title basics
df = pd.read_csv('title.basics.tsv', sep='\t')
df = df.drop(['titleType', 'originalTitle', 'endYear', 'runtimeMinutes', 'genres'], axis=1)
df['tconst'] = df['tconst'].str.replace('tt', '')
df.to_csv("title.csv", header=False, index=False)

# name basics
df = pd.read_csv('name.basics.tsv', sep='\t')
df = df.drop(df.columns[[2, 3, 4, 5]], axis=1)
df['nconst'] = df['nconst'].str.replace('nm', '')
df.to_csv("person.csv", header=False, index=False)

# Principal
df = pd.read_csv('title.principals.tsv', sep='\t')
df = df.drop(df.columns[[1, 4, 5]], axis=1)
df['tconst'] = df['tconst'].str.replace('tt', '')
df['nconst'] = df['nconst'].str.replace('nm', '')
df.to_csv("principals.csv", header=False, index=False)

# Genre
df = df = pd.read_csv('title.basics.tsv', low_memory=False, sep='\t')
df = df.drop(df.columns[[0, 1, 2, 3, 4, 5, 6, 7]], axis=1)
df = df['genres'].str.split(",")
df = df.explode()
df = df.unique()
dictionary = {'genres': df}
genre = pd.DataFrame(dictionary)
genre.index.name = 'genre_id'
genre.to_csv('genre.csv')

# Genre basics
df = df = pd.read_csv('title.basics.tsv', low_memory=False, sep='\t')
df = df.drop(df.columns[[0, 1, 2, 3, 4, 5, 6, 7]], axis=1)
df = df['genres'].str.split(",")
df = df.explode()

# Merged dataframe
df_merged = pd.merge(df, genre, on="genres", how='outer')
df_merged.to_csv('genre_table5.csv')
