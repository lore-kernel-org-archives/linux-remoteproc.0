Return-Path: <javier@osg.samsung.com>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 0/3] remoteproc: Fix module autoload for qcom platform drivers
Date: Tue, 18 Oct 2016 18:24:18 -0300
Message-Id: <1476825861-7880-1-git-send-email-javier@osg.samsung.com>
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello,

I noticed that module autoload won't be working in some of the qcom
remoteproc drivers. This patch series contains the fixes for these.

Best regards,
Javier


Javier Martinez Canillas (3):
  remoteproc: qcom: q6v5_pil: Fix module autoload
  remoteproc: qcom: wcnss: Fix module autoload
  remoteproc: qcom: wcnss_iris: Fix module autoload

 drivers/remoteproc/qcom_q6v5_pil.c   | 1 +
 drivers/remoteproc/qcom_wcnss.c      | 1 +
 drivers/remoteproc/qcom_wcnss_iris.c | 1 +
 3 files changed, 3 insertions(+)

-- 
2.7.4
