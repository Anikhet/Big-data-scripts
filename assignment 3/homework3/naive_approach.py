import pandas as pd
import itertools

df = pd.read_csv('movie_table.csv', sep=',')

column_set = ["movie_id", "type", "startYear", "runtimeMinutes", "averageRating",
              "genre_id", "genres", "member_id", "characters", "birthYear"]
repeat_detect = {}
count_of_dependencies = 0

for indexMain in range(len(column_set)):
    for index in range(1, len(column_set)):
        for club in itertools.combinations(column_set, r=index):
            attribute_on_the_left = df.loc[:, column_set[indexMain]]
            attribute_on_the_left = attribute_on_the_left.drop_duplicates()
            convert_to_list = list(club)
            attribute_on_the_right = df.loc[:, convert_to_list]
            attribute_on_the_right = attribute_on_the_right.drop_duplicates()
            right_temp = attribute_on_the_right.columns[0]
            count_of_left = attribute_on_the_left.count()
            count_of_right = attribute_on_the_right[right_temp].count()
            element_index = 0
            if count_of_right == count_of_left:
                if club in repeat_detect:
                    break
                repeat_detect[club] = repeat_detect.get(club, 0)
                if column_set[indexMain] in convert_to_list:
                    element_index = convert_to_list.index(column_set[indexMain])
                    convert_to_list.pop(element_index)
                if not convert_to_list:
                    break
                count_of_dependencies += 1
                print(str(column_set[indexMain]) + " ----> " + str(tuple(convert_to_list)))


