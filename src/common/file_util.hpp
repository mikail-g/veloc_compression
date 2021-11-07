#ifndef __FILE_UTIL
#define __FILE_UTIL

#include "status.hpp"

#include <string>
#include <functional>
#include <mpi.h>
typedef std::function<void (const std::string &, const std::string &, const std::string &)> dir_callback_t;

ssize_t file_size(const std::string &source);
bool write_file(const std::string &source, unsigned char *buffer, ssize_t size);
bool write_commonfile(const std::string &source, unsigned char *buffer, ssize_t size, ssize_t offset);
bool write_commonfile_stripealigned(const std::string &source, unsigned char *buffer, ssize_t size, ssize_t offset);
bool read_file(const std::string &source, unsigned char *buffer, ssize_t size);
bool posix_transfer_file(const std::string &source, const std::string &dest);
bool transfer_naive_comm(const std::string &source, const std::string &dest, ssize_t offset);
bool transfer_stripe_comm(const std::string &source, const std::string &dest, ssize_t offset, MPI_Comm cm);

bool check_dir(const std::string &d);
bool parse_dir(const std::string &p, const std::string &cname, dir_callback_t f);

#endif //__FILE_UTIL
