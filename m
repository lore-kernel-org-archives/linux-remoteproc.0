Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 29 Oct 2018 16:32:47 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [GIT PULL] remoteproc updates for v4.20
Message-ID: <20181029233247.GV12063@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>, Sibi Sankar <sibis@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Brian Norris <briannorris@chromium.org>, Rohit kumar <rohitkr@codeaurora.org>, Suman Anna <s-anna@ti.com>, Wei Yongjun <weiyongjun1@huawei.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the Git repository at:

  git://github.com/andersson/remoteproc tags/rproc-v4.20

for you to fetch changes up to f18b7e914fd2ed5e8b5733644cefcf62f7582679:

  remoteproc: qcom: q6v5-mss: Register segments/dumpfn for coredump (2018-10-19 12:54:03 -0700)

----------------------------------------------------------------
remoteproc updates for v4.20

This contains a series of patches that reworks the memory carveout
handling in remoteproc, in order to allow this to be reused for
statically allocated memory regions to be used for e.g. firmware.

It adds support for audio DSP (both TZ-assisted and non-TZ assisted) and
compute DSP on Qualcomm SDM845, TZ-assisted audio DSP, compute DSP and
WiFi processor on Qualcomm QCS404 and through some renaming of the
drivers cleans up the naming situation.

Finally support for custom coreudmp segment handlers is added and
is used in the Qualcomm modem remoteproc driver to gather memory dumps
of the firmware.

----------------------------------------------------------------
Bjorn Andersson (6):
      remoteproc/davinci: Use %zx for formating size_t
      remoteproc: qcom: adsp: Add SDM845 ADSP and CDSP support
      remoteproc: qcom: q6v5: Propagate EPROBE_DEFER
      remoteproc: qcom: Rename Hexagon v5 PAS driver
      remoteproc: qcom: Rename Hexagon v5 modem driver
      remoteproc: qcom: pas: Add QCS404 remoteprocs

Brian Norris (2):
      remoteproc: qcom: q6v5-mss: add SCM probe dependency
      remoteproc: qcom: q6v5: shore up resource probe handling

Loic Pallardy (12):
      remoteproc: configure IOMMU only if device address requested
      remoteproc: add rproc_va_to_pa function
      remoteproc: add release ops in rproc_mem_entry struct
      remoteproc: add name in rproc_mem_entry struct
      remoteproc: add helper function to allocate and init rproc_mem_entry struct
      remoteproc: introduce rproc_add_carveout function
      remoteproc: introduce rproc_find_carveout_by_name function
      remoteproc: add alloc ops in rproc_mem_entry struct
      remoteproc: add helper function to allocate rproc_mem_entry from reserved memory
      remoteproc: add helper function to check carveout device address
      remoteproc: modify rproc_handle_carveout to support pre-registered region
      remoteproc: modify vring allocation to rely on centralized carveout allocator

Rohit kumar (2):
      dt-binding: remoteproc: Add QTI ADSP PIL bindings
      remoteproc: qcom: Introduce Non-PAS ADSP PIL driver

Sibi Sankar (11):
      dt-bindings: remoteproc: qcom: Remove additional definition tag
      dt-bindings: remoteproc: Add PDC reset binding for Q6V5 PIL
      remoteproc: qcom: q6v5-pil: Explicitly get mss_restart line
      remoteproc: qcom: q6v5-pil: Add PDC reset for modem on SDM845 SoCs
      remoteproc: qcom: q6v5: Fix a race condition on fatal crash
      remoteproc: qcom: q6v5-pil: Assign the relocated address
      remoteproc: Introduce custom dump function for each remoteproc segment
      remoteproc: Add mechanism for custom dump function assignment
      remoteproc: qcom: q6v5-mss: Refactor mba load/unload sequence
      remoteproc: qcom: q6v5-mss: Add custom dump function for modem
      remoteproc: qcom: q6v5-mss: Register segments/dumpfn for coredump

Suman Anna (2):
      remoteproc: Check for NULL firmwares in sysfs interface
      remoteproc: Add missing kernel-doc comment for auto-boot

Wei Yongjun (1):
      remoteproc: qcom: qcom_q6v5_adsp: Fix some return value check

 .../bindings/remoteproc/qcom,adsp-pil.txt          | 126 +++++
 .../devicetree/bindings/remoteproc/qcom,adsp.txt   |   5 +
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |   8 +-
 drivers/remoteproc/Kconfig                         |  46 +-
 drivers/remoteproc/Makefile                        |   5 +-
 drivers/remoteproc/da8xx_remoteproc.c              |   2 +-
 drivers/remoteproc/qcom_q6v5.c                     |  43 +-
 drivers/remoteproc/qcom_q6v5_adsp.c                | 497 +++++++++++++++++
 .../{qcom_q6v5_pil.c => qcom_q6v5_mss.c}           | 420 ++++++++++-----
 .../{qcom_adsp_pil.c => qcom_q6v5_pas.c}           |  28 +-
 drivers/remoteproc/remoteproc_core.c               | 595 +++++++++++++++++----
 drivers/remoteproc/remoteproc_debugfs.c            |   1 +
 drivers/remoteproc/remoteproc_internal.h           |   2 +
 drivers/remoteproc/remoteproc_sysfs.c              |   5 +
 drivers/remoteproc/remoteproc_virtio.c             |  14 +-
 include/linux/remoteproc.h                         |  47 +-
 16 files changed, 1557 insertions(+), 287 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,adsp-pil.txt
 create mode 100644 drivers/remoteproc/qcom_q6v5_adsp.c
 rename drivers/remoteproc/{qcom_q6v5_pil.c => qcom_q6v5_mss.c} (90%)
 rename drivers/remoteproc/{qcom_adsp_pil.c => qcom_q6v5_pas.c} (90%)
