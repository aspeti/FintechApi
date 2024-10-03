using FintechApi.Model;
using Microsoft.EntityFrameworkCore;

namespace FintechApi.DAL
{
    public class DBContext : DbContext
    {
        public DBContext(DbContextOptions<DBContext> options) : base(options) { }

        public DbSet<ManagerBalance> ManagerBalances { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ManagerBalance>().HasNoKey();
        }
    }
}
