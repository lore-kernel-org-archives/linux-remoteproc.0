Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH 00/18] remoteproc: Add support for synchronisation with MCU 
Date: Thu, 12 Mar 2020 16:11:40 -0600
Message-Id: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

This patchset is a new flavour of the work started by TI, ST and NXP to
add support for attaching with an MCU at kernel boot time rather than
starting it.

The name has been changed from "late attach" to "synchronisation" because
it offers the former as a subset of the latter.  It moves all the decision
making as to whether the remoteproc core should synchronise with an MCU
or boot from the platform code to the core, eliminating a lot of
duplication in the logic.  

In order to accomodate the infinite amount of possibilites and scenarios,
the platform code is given the opportunity to dictate how MCUs should be
handled at three different stages of the MCU lifecycle, that is when
the remoteproc core initiates, when an MCU is stopped from the sysfs
interface and when it crashes.  More stages can be added if and when we 
see fit.

The last patch in the set is a refactor of a patch sent by Arnaud and
Fabien.  It is provided as an example of how to use the new functionality.

Best regards,
Mathieu

Fabien Dessenne (1):
  remoteproc: stm32: add support for co-processor booted before kernel

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

 drivers/remoteproc/remoteproc_core.c     | 383 ++++++++++++++++++-----
 drivers/remoteproc/remoteproc_debugfs.c  |  31 ++
 drivers/remoteproc/remoteproc_internal.h |  90 ++++--
 drivers/remoteproc/remoteproc_sysfs.c    |  57 +++-
 drivers/remoteproc/stm32_rproc.c         | 207 +++++++++++-
 include/linux/remoteproc.h               |  28 +-
 6 files changed, 684 insertions(+), 112 deletions(-)

-- 
2.20.1
