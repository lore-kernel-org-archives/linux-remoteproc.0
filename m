Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/4] rpmsg: Refactor Qualcomm glink_ssr
Date: Wed, 22 Apr 2020 17:37:32 -0700
Message-Id: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, Chris Lew <clew@codeaurora.org>, Sibi <sibis@codeaurora.org>, Siddharth Gupta <sidgup@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

In order to allow for wider use of the SSR notifier in remoteproc's qcom_common
this series internalizes the notifier chain used by glink_ssr. To simplify the
Kconfig dependencies it also moves the glink_ssr implementation to rpmsg and
merges it with qcom_glink_native, as these do go hand in hand.

Bjorn Andersson (4):
  remoteproc: qcom: Pass ssr_name to glink subdevice
  soc: qcom: glink_ssr: Internalize ssr_notifiers
  rpmsg: glink: Integrate glink_ssr in qcom_glink
  arm64: defconfig: Remove QCOM_GLINK_SSR

 arch/arm64/configs/defconfig                  |  1 -
 drivers/remoteproc/qcom_common.c              | 17 ++++++++++-
 drivers/remoteproc/qcom_common.h              |  5 +++-
 drivers/remoteproc/qcom_q6v5_adsp.c           |  2 +-
 drivers/remoteproc/qcom_q6v5_mss.c            |  2 +-
 drivers/remoteproc/qcom_q6v5_pas.c            |  2 +-
 drivers/rpmsg/Kconfig                         |  6 ++--
 drivers/rpmsg/Makefile                        |  3 +-
 .../glink_ssr.c => rpmsg/qcom_glink_ssr.c}    | 28 +++++++++++++------
 drivers/soc/qcom/Kconfig                      |  9 ------
 drivers/soc/qcom/Makefile                     |  1 -
 include/linux/rpmsg/qcom_glink.h              |  3 +-
 12 files changed, 49 insertions(+), 30 deletions(-)
 rename drivers/{soc/qcom/glink_ssr.c => rpmsg/qcom_glink_ssr.c} (83%)

-- 
2.24.0
