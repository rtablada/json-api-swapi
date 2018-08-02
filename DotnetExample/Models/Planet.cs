using System;
using System.Collections.Generic;
using JsonApiDotNetCore.Models;

namespace DotnetExample.Models
{
    public class Planet : Identifiable
    {
        [Attr("name")] public string Name { get; set; }
        [Attr("rotation-period")] public string RotationPeriod { get; set; }
        [Attr("orbital-period")] public string OrbitalPeriod { get; set; }
        [Attr("diameter")] public string Diameter { get; set; }
        [Attr("climate")] public string Climate { get; set; }
        [Attr("gravity")] public string Gravity { get; set; }
        [Attr("terrain")] public string Terrain { get; set; }
        [Attr("surface-water")] public string SurfaceWater { get; set; }
        [Attr("population")] public string Population { get; set; }

        // [HasMany("films")] public List<Film> Films { get; set; }
    }
}
