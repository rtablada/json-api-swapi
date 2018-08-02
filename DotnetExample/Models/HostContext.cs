using Microsoft.EntityFrameworkCore;
using Npgsql.EntityFrameworkCore.PostgreSQL;

namespace DotnetExample.Models
{
    public class HostContext : DbContext
    {
        public HostContext(DbContextOptions<HostContext> options) : base(options) {}

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseNpgsql("Host=localhost;Database=swapi");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Film>(entity =>
            {
                entity.ToTable("film");
                entity.Property(e => e.Id).HasColumnName("id");
                entity.Property(e => e.EpisodeId).HasColumnName("episode_id");
                entity.Property(e => e.Title).HasColumnName("title");
                entity.Property(e => e.OpeningCrawl).HasColumnName("opening_crawl");
                entity.Property(e => e.Director).HasColumnName("director");
                entity.Property(e => e.Producer).HasColumnName("producer");
                entity.Property(e => e.ReleaseDate).HasColumnName("release_date");
            });

            modelBuilder.Entity<Planet>(entity =>
            {
                entity.ToTable("planet");
                entity.Property(e => e.Id).HasColumnName("id");
                entity.Property(e => e.Name).HasColumnName("name");
                entity.Property(e => e.RotationPeriod).HasColumnName("rotation_period");
                entity.Property(e => e.OrbitalPeriod).HasColumnName("orbital_period");
                entity.Property(e => e.Diameter).HasColumnName("diameter");
                entity.Property(e => e.Climate).HasColumnName("climate");
                entity.Property(e => e.Gravity).HasColumnName("gravity");
                entity.Property(e => e.Terrain).HasColumnName("terrain");
                entity.Property(e => e.SurfaceWater).HasColumnName("surface_water");
                entity.Property(e => e.Population).HasColumnName("population");
            });
        }

        public DbSet<Film> Films { get; set; }
        public DbSet<Planet> Planets { get; set; }
    }
}
