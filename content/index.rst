Intermediate OpenACC/CUDA
=========================

.. prereq::

   A cloud environment will be used for this workshop which requires
   authentication through GitHub. Please go to https://github.com/
   and apply for an account if needed.
   
   Alternatively, you can use an HPC cluster that you have access to
   provided that it has Nvidia GPUs and the PGI compiler installed.
  

.. toctree::
   :maxdepth: 1
   :caption: The lesson


.. toctree::
   :maxdepth: 1
   :caption: Reference

   quick-reference
   guide



.. _learner-personas:

Who is the course for?
----------------------

This course is for students, researchers, engineers and programmers who would like to expand their knowledge of OpenACC and CUDA.
Some previous experience with C/C++ is required, basic knowledge of OpenACC/CUDA will help to follow the material.

The lesson furthermore assumes that participants have some familiarity with the following topics:

- Logging in to supercomputers and using a bash terminal
- Compiling C/C++ or Fortran codes using compilers and makefiles

.. callout:: If you are new to OpenACC and/or CUDA

   We encourage people without prior experience of OpenACC
   and/or CUDA to go through our introductory lesson and work on the
   exercises before attending this workshop. The materials are
   avaliable online at https://enccs.github.io/OpenACC-CUDA-beginners/.

  
Tentative schedule
------------------

.. list-table::
   :widths: 25 70
   :header-rows: 1

   * - Day 1
     -
   * - 9:00 -  9:10
     - Introduction to ENCCS
   * - 9:10 -  9:30
     - Introduction to GPUs
   * - 9:30 -  9:50
     - OpenACC: Analysis and Parallelization
   * - 9:50 - 10:20
     - Break-out rooms
   * - 10:30 - 10:40
     - Break
   * - 10:30 - 10:50
     - OpenACC: Optimization
   * - 10:50 - 11:20
     - Break-out rooms
   * - 11:20 - 11:30
     - Break
   * - 11:30 - 12:30
     - CUDA: Parallel reduction use-case

.. list-table::
   :widths: 25 50
   :header-rows: 1

   * - Day 2
     -
   * - 9:00 -  9:10
     - Follow-ups from day 1
   * - 9:10 -  10:00
     - CUDA: Optimizing the reduction kernel
   * - 10:00 - 10:20
     - Break-out rooms
   * - 10:20 - 10:30
     - Break
   * - 10:30 - 11:20
     - CUDA: Exploring task-based parallelizm: streams and events
   * - 11:20 - 11:40
     - Break-out rooms
   * - 11:40 - 11:50
     - Break
   * - 11:50 - 12:20
     - CUDA: Notes on profiling tools
   * - 12:20 - 12:30
     - Wrap-up

About the course
----------------

These course materials are developed for those who have the understanding of fundamentals of OpenACC and CUDA and would like to expand their knowledge.
The course consists of lectures, type-along and hands-on sessions.

The lectures will present the OpenACC framework with three key steps namely analysis, parallelization, and Optimization, in porting to high performance accelerated codes.
CUDA lectures cover two main topics: how to optimize computational kernels for effitient execution on GPU hardware and how to explore the task-based parallelizm using streams and events.
We will also briefly go through profiling tools that can help one to identify the computational bottleneck of the programm.

Participants are assumed to have knowledge of the C programming
language and some previous knowledge of OpenACC and CUDA. Since
participants will be using HPC clusters to run the examples, fluent
operation in a Linux/Unix environment is assumed.


See also
--------

 - Our `introductory materials <https://enccs.github.io/OpenACC-CUDA-beginners/>`_
 - Official `OpenACC site <https://www.openacc.org/>`_
 - `Nvidia Deep Learning institute <https://www.nvidia.com/en-us/training/>`_ 
 - `CSC training resources on OpenACC <https://github.com/csc-training/openacc/>`_


Credits
-------

The lesson file structure and browsing layout is inspired by and derived from
`work <https://github.com/coderefinery/sphinx-lesson>`_ by `CodeRefinery
<https://coderefinery.org/>`_ licensed under the `MIT license
<http://opensource.org/licenses/mit-license.html>`_. We have copied and adapted
most of their license text.

Instructional Material
^^^^^^^^^^^^^^^^^^^^^^

This instructional material is made available under the
`Creative Commons Attribution license (CC-BY-4.0) <https://creativecommons.org/licenses/by/4.0/>`_.
The following is a human-readable summary of (and not a substitute for) the
`full legal text of the CC-BY-4.0 license
<https://creativecommons.org/licenses/by/4.0/legalcode>`_.
You are free to:

- **share** - copy and redistribute the material in any medium or format
- **adapt** - remix, transform, and build upon the material for any purpose,
  even commercially.

The licensor cannot revoke these freedoms as long as you follow these license terms:

- **Attribution** - You must give appropriate credit (mentioning that your work
  is derived from work that is Copyright (c) ENCCS and individual contributors and, where practical, linking
  to `<https://enccs.github.io/sphinx-lesson-template>`_), provide a `link to the license
  <https://creativecommons.org/licenses/by/4.0/>`_, and indicate if changes were
  made. You may do so in any reasonable manner, but not in any way that suggests
  the licensor endorses you or your use.
- **No additional restrictions** - You may not apply legal terms or
  technological measures that legally restrict others from doing anything the
  license permits.

With the understanding that:

- You do not have to comply with the license for elements of the material in
  the public domain or where your use is permitted by an applicable exception
  or limitation.
- No warranties are given. The license may not give you all of the permissions
  necessary for your intended use. For example, other rights such as
  publicity, privacy, or moral rights may limit how you use the material.


Software
^^^^^^^^

Except where otherwise noted, the example programs and other software provided
with this repository are made available under the `OSI <http://opensource.org/>`_-approved
`MIT license <https://opensource.org/licenses/mit-license.html>`_.
