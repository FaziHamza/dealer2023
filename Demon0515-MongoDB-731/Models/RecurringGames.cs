﻿using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;

namespace PersonalizedCardGame.Models
{
    public class RecurringGames
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string? Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string CreatorId { get; set; } = string.Empty;
    }
}
