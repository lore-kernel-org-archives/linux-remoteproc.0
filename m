Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH 0/7] remoteproc: add fixed memory region support
Date: Fri, 27 Oct 2017 14:44:07 +0200
Message-ID: <1509108254-22296-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The aim of the series is to implement carveout memory management as
discussed during OpenAMP weekly call and defined in proposed document [1]

This first series focus only on adding support of the different types of
carveout memories (dynamic, fixed, platform driver depend...).
64bit resource table will be addressed in a next series.

[1]: http://openamp.github.io/docs/mca/coprocessor-memory-definition-v6.pdf

Loic Pallardy (7):
  remoteproc: add rproc_va_to_pa function
  remoteproc: add release ops in rproc_mem_entry struct
  remoteproc: introduce rproc_add_carveout function
  remoteproc: introduce rproc_find_carveout_by_da
  remoteproc: modify rproc_handle_carveout to support preallocated
    region
  remoteproc: modify vring allocation to support preallocated region
  remoteproc: st: add reserved memory support

 drivers/remoteproc/remoteproc_core.c     | 193 +++++++++++++++++++++++++++----
 drivers/remoteproc/remoteproc_internal.h |   7 ++
 drivers/remoteproc/st_remoteproc.c       |  43 +++++--
 include/linux/remoteproc.h               |   8 +-
 4 files changed, 218 insertions(+), 33 deletions(-)

-- 
1.9.1
