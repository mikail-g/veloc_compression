#include "file_util.hpp"
#include "common/status.hpp"

#include <sys/sendfile.h>
#include <sys/types.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <dirent.h>
#include <unistd.h>

#include <cerrno>
#include <cstring>
#include <regex>

#include <zlib.h>



#define __DEBUG
#include "debug.hpp"



bool parse_dir(const std::string &p, const std::string &cname, dir_callback_t f) {
    DIR *dir;
    dir = opendir(p.c_str());
    if (dir == NULL)
	return false;
    std::regex e(cname + "-([0-9]+|ec)-([0-9]+).*");
    dirent *dentry;
    while ((dentry = readdir(dir)) != NULL) {
        if (dentry->d_type == DT_REG || dentry->d_type == DT_LNK) {
            std::smatch sm;
            std::string dname(dentry->d_name);
            std::regex_match(dname, sm, e);
            if (sm.size() == 3)
                f(p + "/" + dentry->d_name, sm[1], sm[2]);
        }
    }
    closedir(dir);

    return true;
}

ssize_t file_size(const std::string &source) {
    struct stat stat_buf;
    int rc = stat(source.c_str(), &stat_buf);
    return rc == 0 ? stat_buf.st_size : -1;
}

bool write_file(const std::string &source, unsigned char *buffer, ssize_t size) {
    bool ret;
    int fd = open(source.c_str(), O_CREAT | O_TRUNC | O_WRONLY, 0644);
    if (fd == -1) {
        ERROR("cannot open " << source << ", error = " << strerror(errno));
        return false;
    }
    ret = write(fd, buffer, size) == size;
    if (!ret)
        ERROR("cannot write " << size << " bytes to " << source << " , error = " << std::strerror(errno));
    close(fd);
    return ret;
}

bool read_file(const std::string &source, unsigned char *buffer, ssize_t size) {
    bool ret;
    int fd = open(source.c_str(), O_RDONLY);
    if (fd == -1) {
        ERROR("cannot open " << source << ", error = " << std::strerror(errno));
        return false;
    }
    ret = read(fd, buffer, size) == size;
    if (!ret)
        ERROR("cannot read " << size << " bytes from " << source << " , error = " << std::strerror(errno));
    close(fd);
    return ret;
}

/* ORIGINAL VELOC */
bool posix_transfer_file(const std::string &source, const std::string &dest) {
   int fi = open(source.c_str(), O_RDONLY);
    if (fi == -1) {
        ERROR("cannot open " << source << ", error = " << std::strerror(errno));
        return false;
    }
    ssize_t size = lseek(fi, 0, SEEK_END);
    char* r_addr = (char*) mmap(NULL, size, PROT_READ, MAP_PRIVATE, fi, 0);
    if (r_addr == MAP_FAILED) {
        ERROR("r_addr map failed!" << std::endl);
        return false;
    }
    madvise(r_addr, size, MADV_SEQUENTIAL);

    unsigned long nDataSize = file_size(source.c_str());
	unsigned long nCompressedDataSize = nDataSize;
	unsigned char * pCompressedData = new unsigned char[nCompressedDataSize];
    const unsigned char *inputData = (unsigned char *)r_addr;
	
	int nResult = compress2(pCompressedData, &nCompressedDataSize, inputData, nDataSize, 9);

    if(nResult != Z_OK){
        ERROR("Could not compress buffer");
        return false;
    }

    int fo = open(dest.c_str(), O_CREAT | O_TRUNC | O_WRONLY, 0644);
    if (fo == -1) {
        munmap(r_addr, size);
        delete [] pCompressedData;
        ERROR("cannot open " << dest << ", error = " << strerror(errno));
        return false;
    }
    ssize_t remaining = file_size(source.c_str());
    while(remaining > 0)
    {
        ssize_t written = write(fo, pCompressedData, remaining);
        if (written == -1) {
             munmap(r_addr, size);
             delete [] pCompressedData;
             ERROR("cannot write from " << source << " to " << dest << "; error = " << std::strerror(errno));
             break;
        }
        r_addr += (unsigned)written;
        remaining -= (unsigned)written;
        INFO("wrote " << written << " bytes from " << source << " to " << dest);
    }
    
    munmap(r_addr, size);
    delete [] pCompressedData;
    close(fi);
    close(fo);
    INFO("stopping timer...");
    return true;
}


bool transfer_naive_comm(const std::string &source, const std::string &dest, ssize_t offset) {
	TIMER_START(io_timer);
    int fi = open(source.c_str(), O_RDONLY);
    if (fi == -1) {
        ERROR("cannot open " << source << ", error = " << std::strerror(errno));
        return false;
    }
    ssize_t size = lseek(fi, 0, SEEK_END);
    char* r_addr = (char*) mmap(NULL, size, PROT_READ, MAP_PRIVATE, fi, 0);
    if (r_addr == MAP_FAILED) {
        ERROR("r_addr map failed!" << std::endl);
        return false;
    }
    madvise(r_addr, size, MADV_SEQUENTIAL);

    unsigned long nDataSize = file_size(source.c_str());
	unsigned long nCompressedDataSize = nDataSize;
	unsigned char * pCompressedData = new unsigned char[nCompressedDataSize];
    const unsigned char *inputData = (unsigned char *)r_addr;
	
	int nResult = compress2(pCompressedData, &nCompressedDataSize, inputData, nDataSize, 9);

    if(nResult != Z_OK){
        ERROR("Could not compress buffer");
        return false;
    }

    int fo = open(dest.c_str(), O_CREAT | O_TRUNC | O_WRONLY, 0644);
    if (fo == -1) {
        munmap(r_addr, size);
        delete [] pCompressedData;
        ERROR("cannot open " << dest << ", error = " << strerror(errno));
        return false;
    }
    ssize_t remaining = file_size(source.c_str());
    lseek(fo, (unsigned)offset, SEEK_SET);
    while(remaining > 0)
    {
        ssize_t written = write(fo, pCompressedData, remaining);
        if (written == -1) {
             munmap(r_addr, size);
             delete [] pCompressedData;
             ERROR("cannot write from " << source << " to " << dest << "; error = " << std::strerror(errno));
             break;
        }
        r_addr += (unsigned)written;
        remaining -= (unsigned)written;
        INFO("wrote " << written << " bytes from " << source << " to " << dest << " at offset " << (unsigned)offset);
    }
    
    munmap(r_addr, size);
    delete [] pCompressedData;
    close(fi);
    close(fo);
    INFO("stopping timer...");
    TIMER_STOP(io_timer, "transferred " << source << " to " << dest);
    return true;
}

//bool transfer_stripe_comm(const std::string &dest, char **files, ssize_t *sizes, ssize_t *offsets, int arr_size, MPI_Comm cm) {
bool transfer_stripe_comm(const std::string &source, const std::string &dest, ssize_t offset, MPI_Comm cm) {
	TIMER_START(io_timer);
    MPI_File fh;
    MPI_Status status;
    MPI_Request req;
    MPI_Info info;
    int rank, ranks, written;
    MPI_Comm_rank(cm, &rank);
    MPI_Comm_size(cm, &ranks);

    /* Get stripe info from custom set environment variables and store in INFO object 
       for MPI-IO to use to coordinate access */
    char *str_count =  getenv("STRIPE_COUNT"), *str_unit = getenv("STRIPE_UNIT");
    MPI_Info_create(&info);
    int ec = MPI_Info_set(info, "striping_factor", str_count);
    if(ec != MPI_SUCCESS)
        ERROR("couldn't get stripe count");
    ec = MPI_Info_set(info, "striping_unit", str_unit);
    if(ec != MPI_SUCCESS)
        ERROR("couldn't get stripe size");

    /* open the local file and map into mem */
    int fi = open(source.c_str(), O_RDONLY);
    if (fi == -1) {
        ERROR("cannot open " << source << ", error = " << std::strerror(errno));
        return false;
    }
    ssize_t size = lseek(fi, 0, SEEK_END);
    char* r_addr = (char*) mmap(NULL, size, PROT_READ, MAP_PRIVATE, fi, 0);
    if (r_addr == MAP_FAILED) {
        ERROR("r_addr map failed!" << std::endl);
        return false;
    }

    madvise(r_addr, size, MADV_SEQUENTIAL);
    /* Collectively open shared file */
    INFO("Collective file opened");
    ec = MPI_File_open(cm, dest.c_str(), MPI_MODE_CREATE | MPI_MODE_WRONLY, info, &fh);
    if(ec != MPI_SUCCESS) {
        ERROR("Could not open collective file!");
        return false;
    }
    INFO("Starting collective write of size " << size << "at offset " << offset);
    ec = MPI_File_iwrite_at_all(fh, (off_t)offset, r_addr, size, MPI_CHAR, &req);
    ec = MPI_Wait(&req, &status);
        ERROR("Could not collectively write");
    INFO("RETURNED");
    MPI_Get_count(&status, MPI_CHAR, &written);
    if(written != size)
        ERROR("Could not write " << size << " bytes to " << dest << ", error = " << std::strerror(errno));

    MPI_File_close(&fh);
    TIMER_STOP(io_timer, "transferred " << written << " bytes from mem to " << dest);
    INFO("Transferred " << written << "from mem to " << dest.c_str());
     return true;
}


bool check_dir(const std::string &d) {
    mkdir(d.c_str(), 0755);
    DIR *entry = opendir(d.c_str());
    if (entry == NULL)
        return false;
    closedir(entry);
    return true;
}