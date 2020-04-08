Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sidgup=codeaurora.org@mg.codeaurora.org
From: Siddharth Gupta <sidgup@codeaurora.org>
Subject: [PATCH v2 0/2] remoteproc: core: Add core functionality to the remoteproc framework
Date: Wed,  8 Apr 2020 15:18:23 -0700
Message-Id: <1586384305-7825-1-git-send-email-sidgup@codeaurora.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: Siddharth Gupta <sidgup@codeaurora.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org, psodagud@codeaurora.org, rishabhb@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patch series adds core functionality to the remoteproc framework.

Patch 1 adds a new API to the framework which allows kernel clients to update
        the firmware name for the specified remoteproc.
Patch 2 intends to improve the user experience by preventing the system from
        going to sleep while the remoteproc is recovering from a crash.

Changes since v1:
- The API in patch 1 has been modified based on comments by Mathieu [1]. Since
  this patch cannot be merged in without a user this is more of a RFC for
  merging in later once a user is upstreamed.
- In patch 2 updated the device being used to the parent device of the rproc,
  based on comments from Mathieu [2] and Bjorn [3].

[1]: https://lore.kernel.org/linux-arm-msm/1582164713-6413-1-git-send-email-sidgup@codeaurora.org/T/#mc36cf66598238a67d1a3e77ab8362b90bd56882e
[2]: https://lore.kernel.org/linux-arm-msm/1582164713-6413-1-git-send-email-sidgup@codeaurora.org/T/#mbafae326ff7e0e5dd1ba5370355affe042a4e21f
[3]: https://lore.kernel.org/linux-arm-msm/1582164713-6413-1-git-send-email-sidgup@codeaurora.org/T/#m4694a60c2c6c720ff6eb3c83008373dfe18ea06b

Siddharth Gupta (2):
  remoteproc: core: Add an API for changing firmware name
  remoteproc: core: Prevent sleep when rproc crashes

 drivers/remoteproc/qcom_q6v5_pas.c   |  1 +
 drivers/remoteproc/remoteproc_core.c | 47 ++++++++++++++++++++++++++++++++++++
 include/linux/remoteproc.h           |  1 +
 3 files changed, 49 insertions(+)

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
