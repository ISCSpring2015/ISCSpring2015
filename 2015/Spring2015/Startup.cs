using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Spring2015.Startup))]
namespace Spring2015
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
