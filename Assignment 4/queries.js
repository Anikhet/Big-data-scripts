--q1
db.Member.find({
  name: /^Phi/,
  deathYear: "",
  _id: {
    $nin: db.movies
      .find({ startYear: "2014" }, { actors: 1, _id: 0 })
      .flatMap(Movies => Movies.actor.map(actor => actor.actor))
  }
})


--q2
db.Member.aggregate([
  {
    $lookup: {
      from: "Movies",
      localField: "id",
      foreignField: "producer",
      as: "moviess"
    }
  },
  {
    $unwind:moviess
  },
  {
    $match: {
      "name": /Gill/,
      "moviess.genre": "Talk-Show",
      "moviess.startYear": "2017"
    }
  },
  {
    $project: {
      _id: 0,
      name: 1
    }
  }
])



--q3
db.movies.aggregate([
  {
    $lookup: {
      from: "Members",
      localField: "writer",
      foreignField: "_id",
      as: "writers"
    }
  },
  {
$unwind : "writers"
  },
  {
    $match: {
      "writers.name": {
        $regex: /Bhardwaj/i
      },
      "writers.deathYear":""
    }
  },
  {
    $project: {
      _id: 0,
      runtimeMinutes: 1
    }
  }
])



--q4
db.Member.aggregate([
  {
    $lookup: {
      from: "Movies",
      localField: "id",
      foreignField: "producer",
      as: "moviess"
    }
  },
    {
    $unwind: "$moviess"
  },
  
  {
    $match: {
      "deathYear":"",
      "moviess.runtimeMinutes": {
        $gt: 120
      }
    }
  },
  {
    $project: {
      _id: 0,
      name: 1
    }}])

--q5
    db.Movies.aggregate([
  {
    $match: {
      genres: "Sci-Fi"
    }
  },
  {
    $lookup: {
      from: "Members",
      localField: "writer",
      foreignField: "id",
      as: "writer_info"
    }
  },
  {
      $unwind : "writer_info"
  },
  {
    $match: {
      "writer_info.name": "James Cameron"
    }
  
  },
  {
    $match: {
      "writer_info.name": "Sigourney Weaver"
    }
  },
  {
    $project: {
      _id: 0,
      title: 1,
      year: 1,
      director: 1,
      writer: "$writer_info.name",
    }
  }
])


--Q4

--2
db.Movies.createIndex({ startYear: 1, genres: 1, "producers.name": 1 });

--4
db.Movies.createIndex({ runtime: 1 });
db.Movies.createIndex({ producers: 1 });

--5
db.Movies.createIndex({ genres: 1 });
db.Movies.createIndex({ director: 1 });