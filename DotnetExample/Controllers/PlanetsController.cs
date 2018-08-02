using JsonApiDotNetCore.Controllers;
using JsonApiDotNetCore.Services;
using DotnetExample.Models;
using Microsoft.Extensions.Logging;

namespace DotnetExample.Controllers
{
    public class PlanetsController : JsonApiController<Planet>
    {
        public PlanetsController(
            IJsonApiContext jsonApiContext,
            IResourceService<Planet> resourceService,
            ILoggerFactory loggerFactory) : base(jsonApiContext, resourceService, loggerFactory)
        { }
    }
}
