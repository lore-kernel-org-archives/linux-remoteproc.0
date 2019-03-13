Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 13 Mar 2019 11:29:42 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc updates for v5.1
Message-ID: <20190313182942.GA8726@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>, Sibi Sankar <sibis@codeaurora.org>, Rohit kumar <rohitkr@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Brajeswar Ghosh <brajeswar.linux@gmail.com>, Colin Ian King <colin.king@canonical.com>, Fabien Dessenne <fabien.dessenne@st.com>, Rajendra Nayak <rnayak@codeaurora.org>, Ramon Fried <ramon.fried@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Xiang Xiao <xiaoxiang781216@gmail.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  git://github.com/andersson/remoteproc tags/rproc-v5.1

for you to fetch changes up to d664ce75ae1c7c1e0e3fd8fa71f7ca779906a9be:

  remoteproc: fix for "dma-mapping: remove the DMA_MEMORY_EXCLUSIVE flag" (2019-03-12 17:00:42 -0700)

----------------------------------------------------------------
remoteproc updates for v5.1

This contains the last patches in Loic's remoteproc resource table
handling changes, a number of updates to documentation, support for
invoking the crash handler (for testing purposes), a fix for the
handling of virtio devices during recovery, performance state votes in
Qualcomm modem driver, support for specifying board specific firmware
path for Qualcomm modem driver and improved support for graceful
shutdown of Qualcomm remoteprocs.

----------------------------------------------------------------
Bjorn Andersson (1):
      remoteproc: q6v5-mss: Active powerdomain for SDM845

Brajeswar Ghosh (1):
      remoteproc/qcom_sysmon.c: Remove duplicate header

Colin Ian King (1):
      remoteproc: qcom: fix spelling mistake "Peripherial" -> "Peripheral"

Fabien Dessenne (1):
      remoteproc: fix kernel-doc comment for parse_fw

Loic Pallardy (12):
      remoteproc: create vdev subdevice with specific dma memory pool
      remoteproc: st: add reserved memory support
      rpmsg: virtio: allocate buffer from parent
      rpmsg: virtio: change header file sort style
      remoteproc: fix recovery procedure
      remoteproc: correct rproc_mem_entry_init() comments
      remoteproc: fix rproc_da_to_va in case of unallocated carveout
      remoteproc: fix rproc_alloc_carveout() bad variable cast
      remoteproc: add warning on resource table cast
      remoteproc: fix rproc_alloc_carveout() for rproc with iommu domain
      remoteproc: fix trace buffer va initialization
      remoteproc: fix rproc_check_carveout_da() returned error and comments

Rajendra Nayak (1):
      remoteproc: q6v5-mss: Vote for rpmh power domains

Ramon Fried (1):
      remoteproc: qcom_q6v5: don't auto boot remote processor

Rohit kumar (2):
      dt-binding: remoteproc: Remove lpass_aon clock from adsp pil clock list
      remoteproc: q6v5_adsp: Remove voting for lpass_aon clock

Sibi Sankar (11):
      dt-bindings: remoteproc: qcom: Add missing clocks for SDM845
      dt-bindings: remoteproc: qcom: Add missing clocks for MSM8996
      remoteproc: qcom: q6v5-mss: Add missing clocks for MSM8996
      dt-bindings: remoteproc: qcom: Fixup regulator dependencies
      remoteproc: qcom: q6v5-mss: Add missing regulator for MSM8996
      dt-bindings: remoteproc: qcom: Add power-domain bindings for Q6V5
      dt-bindings: remoteproc: qcom: Add firmware bindings for Q6V5
      dt-bindings: remoteproc: qcom: Introduce shutdown-ack irq for Q6V5
      remoteproc: qcom: Add shutdown-ack irq
      remoteproc: qcom: Wait for shutdown-ack/ind on sysmon shutdown
      remoteproc: qcom: Add support for parsing fw dt bindings

Stephen Rothwell (1):
      remoteproc: fix for "dma-mapping: remove the DMA_MEMORY_EXCLUSIVE flag"

Xiang Xiao (1):
      remoteproc: debug: add crash debugfs node

 .../bindings/remoteproc/qcom,adsp-pil.txt          |   5 +-
 .../devicetree/bindings/remoteproc/qcom,adsp.txt   |  23 ++-
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |  79 +++++++-
 drivers/remoteproc/qcom_q6v5_adsp.c                |   6 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 | 209 +++++++++++++++++++--
 drivers/remoteproc/qcom_q6v5_pas.c                 |  13 +-
 drivers/remoteproc/qcom_sysmon.c                   |  82 +++++++-
 drivers/remoteproc/qcom_wcnss.c                    |   6 +-
 drivers/remoteproc/remoteproc_core.c               | 160 +++++++++++-----
 drivers/remoteproc/remoteproc_debugfs.c            |  47 ++++-
 drivers/remoteproc/remoteproc_internal.h           |  12 +-
 drivers/remoteproc/remoteproc_virtio.c             |  61 +++++-
 drivers/remoteproc/st_remoteproc.c                 |  91 +++++++--
 drivers/rpmsg/virtio_rpmsg_bus.c                   |  24 +--
 include/linux/remoteproc.h                         |   8 +-
 15 files changed, 706 insertions(+), 120 deletions(-)
