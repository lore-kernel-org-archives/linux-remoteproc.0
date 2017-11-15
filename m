Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 0/5]  In-kernel QMI helpers and sysmon
Date: Wed, 15 Nov 2017 12:10:07 -0800
Message-Id: <20171115201012.25892-1-bjorn.andersson@linaro.org>
To: Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Arun Kumar Neelakantam <aneela@codeaurora.org>, Chris Lew <clew@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This series introduces a helper library for drivers that needs to implement
clients or services in the kernel for communicating with QMI encoded messages.

This is used by a set of drivers in order to implement control signaling that
needs to happen between a driver and a service on a remote processor, such as
the synchronization of states during a remoteproc shutdown/restart; as seen in
the sysmon implementation.

Finally a sample driver provides an implementation of the "test" protocol,
which is a service typically implemented by Qualcomm remoteproc firmware.

Changes since v2:
- Fix reported typos
- Checkpatch fixes
- Use non-gpl EXPORT_SYMBOL

Changes since v1:
- Lot of modifications to QMI interface, from feedback and implementation and
  testing of sysmon.
- Added sysmon driver.
- Added patch for remoteproc to pass gracefulness on subdev remove.
- QRTR patches part of v1 was merged separately

Bjorn Andersson (5):
  soc: qcom: Introduce QMI encoder/decoder
  soc: qcom: Introduce QMI helpers
  remoteproc: Pass type of shutdown to subdev remove
  remoteproc: qcom: Introduce sysmon
  samples: Introduce Qualcomm QMI sample client

 drivers/remoteproc/Kconfig           |  17 +
 drivers/remoteproc/Makefile          |   1 +
 drivers/remoteproc/qcom_adsp_pil.c   |  12 +
 drivers/remoteproc/qcom_common.c     |   6 +-
 drivers/remoteproc/qcom_common.h     |  21 +
 drivers/remoteproc/qcom_q6v5_pil.c   |   3 +
 drivers/remoteproc/qcom_sysmon.c     | 585 ++++++++++++++++++++++++
 drivers/remoteproc/qcom_wcnss.c      |   4 +
 drivers/remoteproc/remoteproc_core.c |  18 +-
 drivers/soc/qcom/Kconfig             |   9 +
 drivers/soc/qcom/Makefile            |   3 +
 drivers/soc/qcom/qmi_encdec.c        | 821 +++++++++++++++++++++++++++++++++
 drivers/soc/qcom/qmi_interface.c     | 849 +++++++++++++++++++++++++++++++++++
 include/linux/remoteproc.h           |   4 +-
 include/linux/soc/qcom/qmi.h         | 272 +++++++++++
 samples/Kconfig                      |   9 +
 samples/Makefile                     |   2 +-
 samples/qmi/Makefile                 |   1 +
 samples/qmi/qmi_sample_client.c      | 631 ++++++++++++++++++++++++++
 19 files changed, 3253 insertions(+), 15 deletions(-)
 create mode 100644 drivers/remoteproc/qcom_sysmon.c
 create mode 100644 drivers/soc/qcom/qmi_encdec.c
 create mode 100644 drivers/soc/qcom/qmi_interface.c
 create mode 100644 include/linux/soc/qcom/qmi.h
 create mode 100644 samples/qmi/Makefile
 create mode 100644 samples/qmi/qmi_sample_client.c

-- 
2.15.0
