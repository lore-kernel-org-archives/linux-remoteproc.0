Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v2 00/17] remoteproc: Add support for synchronisation with MCU 
Date: Tue, 24 Mar 2020 15:45:46 -0600
Message-Id: <20200324214603.14979-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org
Cc: ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This is the second revision of this set that tries to address the
problem of synchronising with an MCU with as much flexibility as
possible.

New in this revision is a fix for a couple of bugs I found while
testing things.  First with the helper macro in patch 09 and the
suppression of a boot message when synchronising with an MCU
in patch 12.  I have completely removed what used to be patch 18,
the example on how to use the new API.  This will be the subject
of an upcoming patchset.

Tested on ST's mp157c platform.  Applies on v5.6-rc7 to keep things
simple.

Comments would be much appreciated.

Thanks,
Mathieu

Mathieu Poirier (17):
  remoteproc: Add new operation and state machine for MCU
    synchronisation
  remoteproc: Introduce function rproc_set_mcu_sync_state()
  remoteproc: Split firmware name allocation from rproc_alloc()
  remoteproc: Split rproc_ops allocation from rproc_alloc()
  remoteproc: Get rid of tedious error path
  remoteproc: Introduce function rproc_alloc_internals()
  remoteproc: Introduce function rproc_alloc_state_machine()
  remoteproc: Allocate synchronisation state machine
  remoteproc: Call the right core function based on synchronisation
    state
  remoteproc: Decouple firmware load and remoteproc booting
  remoteproc: Repurpose function rproc_trigger_auto_boot()
  remoteproc: Rename function rproc_fw_boot()
  remoteproc: Introducting new functions to start and stop an MCU
  remoteproc: Refactor function rproc_trigger_recovery()
  remoteproc: Correctly deal with MCU synchronisation when changing FW
    image
  remoteproc: Correctly deal with MCU synchronisation when changing
    state
  remoteproc: Make MCU synchronisation state changes on stop and crashed

 drivers/remoteproc/remoteproc_core.c     | 387 ++++++++++++++++++-----
 drivers/remoteproc/remoteproc_debugfs.c  |  31 ++
 drivers/remoteproc/remoteproc_internal.h |  91 ++++--
 drivers/remoteproc/remoteproc_sysfs.c    |  57 +++-
 include/linux/remoteproc.h               |  28 +-
 5 files changed, 487 insertions(+), 107 deletions(-)

-- 
2.20.1
