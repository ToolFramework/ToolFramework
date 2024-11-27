#ifndef JOB_QUEUE_H
#define JOB_QUEUE_H

#include <queue>
#include <mutex>
#include <Job.h>

namespace ToolFramework{

  /**
   * \class JobQueue
   *
   * A class that is a queue of jobs for worker threads
   *
   * $Author: B.Richards $
   * $Date: 2024/06/08 1:17:00 $
   */

  
  class JobQueue{
    
  public:
    
    JobQueue(); ///< simple constructor
    ~JobQueue(); ///< simple destructor
    
    bool AddJob(Job* job); ///< fucntion to adda  job to the queue @param job pointer to the job to add
    Job* GetJob(); ///< function to get job from the front of the queue, the function pops the job off the queue
    bool pop(); ///< function to pop a job off the front of the queue
    unsigned int size(); ///< function to return number of jobs in the queue
    
  private:
    
    std::queue<Job*> m_jobs;
    std::mutex m_lock;
    
  };

}
  
#endif
