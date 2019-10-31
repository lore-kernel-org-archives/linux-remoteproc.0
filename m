Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 0/2] remoteproc: mss: Improve memory assignment
Date: Thu, 31 Oct 2019 11:46:30 -0700
Message-Id: <20191031184632.2938295-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Two things came up in the effort of figuring out why the modem crashed the
entire system when being restarted; the first one solves the actual problem, in
that it's not possible to reclaim the main modem firmware region unless the
modem subsystem is running - causing the crash.

The second patch aligns the firmware loading process to that of the downstream
driver, which seems to be a requirement in 8974 as well.

Bjorn Andersson (2):
  remoteproc: qcom_q6v5_mss: Don't reassign mpss region on shutdown
  remoteproc: qcom_q6v5_mss: Validate each segment during loading

 drivers/remoteproc/qcom_q6v5_mss.c | 85 +++++++++++++++++++-----------
 1 file changed, 53 insertions(+), 32 deletions(-)

-- 
2.23.0
