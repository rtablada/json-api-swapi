using System;
using System.Collections.Generic;
using JsonApiDotNetCore.Models;

namespace DotnetExample.Models
{
    public class Film : Identifiable
    {
        [Attr("episode-id")] public int EpisodeId { get; set; }
        [Attr("title")] public string Title { get; set; }
        [Attr("opening-crawl")] public string OpeningCrawl { get; set; }
        [Attr("director")] public string Director { get; set; }
        [Attr("producer")] public string Producer { get; set; }
        [Attr("release-date")] public DateTime ReleaseDate { get; set; }

        // [HasMany("planets")] public List<Planet> Planets { get; set; }
    }
}
