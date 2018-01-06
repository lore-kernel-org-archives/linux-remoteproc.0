Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 0/4] Remoteproc core dump support
Date: Fri,  5 Jan 2018 16:04:16 -0800
Message-Id: <20180106000420.10070-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Suman Anna <s-anna@ti.com>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Picking up Sarangdhar's original patches for adding core dump support to
remoteproc.

Based on the recently proposed "load resources" hook this registers segments of
the Qualcomm MDT file as dump segments which are used to build an ELF file
representing the various memory segments in the case of a crash of the remote
processor.

Bjorn Andersson (2):
  remoteproc: Rename "load_rsc_table" to "parse_fw"
  soc: qcom: mdt-loader: Return relocation base

Sarangdhar Joshi (2):
  remoteproc: Add remote processor coredump support
  remoteproc: qcom: Register segments for core dump

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c        |   4 +-
 drivers/media/platform/qcom/venus/firmware.c |   2 +-
 drivers/remoteproc/Kconfig                   |   1 +
 drivers/remoteproc/qcom_adsp_pil.c           |   5 +-
 drivers/remoteproc/qcom_common.c             |  44 +++++++++
 drivers/remoteproc/qcom_common.h             |   2 +
 drivers/remoteproc/qcom_wcnss.c              |   4 +-
 drivers/remoteproc/remoteproc_core.c         | 134 ++++++++++++++++++++++++++-
 drivers/remoteproc/remoteproc_internal.h     |   7 +-
 drivers/soc/qcom/mdt_loader.c                |   7 +-
 include/linux/remoteproc.h                   |  20 +++-
 include/linux/soc/qcom/mdt_loader.h          |   3 +-
 12 files changed, 218 insertions(+), 15 deletions(-)

-- 
2.15.0
