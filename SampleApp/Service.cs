
using Microsoft.Extensions.Configuration;
using System;

namespace SampleApp
{
    public class Service : IService
    {
        private readonly IConfiguration config;

        public Service(IConfiguration config)
        {
            this.config = config;
        }

        public string getSampleValue()
        {
            string value = this.config["Config:Sample"];
            return value;
        }
    }
}
