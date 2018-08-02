using JsonApiDotNetCore.Controllers;
using JsonApiDotNetCore.Services;
using DotnetExample.Models;
using Microsoft.Extensions.Logging;

namespace DotnetExample.Controllers
{
    public class FilmsController : JsonApiController<Film>
    {
        public FilmsController(
            IJsonApiContext jsonApiContext,
            IResourceService<Film> resourceService,
            ILoggerFactory loggerFactory) : base(jsonApiContext, resourceService, loggerFactory)
        { }
    }
}
