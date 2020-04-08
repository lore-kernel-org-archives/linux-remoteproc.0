Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sidgup=codeaurora.org@mg.codeaurora.org
From: Siddharth Gupta <sidgup@codeaurora.org>
Subject: [PATCH v2 0/6] remoteproc: qcom: Add callbacks for remoteproc events
Date: Wed,  8 Apr 2020 16:36:37 -0700
Message-Id: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: Siddharth Gupta <sidgup@codeaurora.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org, psodagud@codeaurora.org, rishabhb@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

This patch series adds the usecases for SSR and Sysmon subdevices which are
used by remoteprocs and kernel client drivers relying on those remoteprocs.

Patch 1-3 adds callbacks for prepare, start and unprepare events, and also type
          of sysmon notification.
Patch 4-6 adds a per subsystem notifier chain, callbacks for prepare, start
          and stop events for ssr subdevice.

Changes since v1:
- Patch 3 updated to add comments and check for sysmon ssctl_version, and
  updated commit text based on Mathieu's comments [1].

[1]: https://lkml.org/lkml/2020/2/27/1802

Rishabh Bhatnagar (1):
  remoteproc: qcom: Add name field for every subdevice

Siddharth Gupta (5):
  remoteproc: sysmon: Add ability to send type of notification
  remoteproc: sysmon: Add notifications for events
  remoteproc: sysmon: Inform current rproc about all active rprocs
  remoteproc: qcom: Add per subsystem SSR notification
  remoteproc: qcom: Add notification types to SSR

 drivers/remoteproc/qcom_common.c      |  86 +++++++++++++++++++++----
 drivers/remoteproc/qcom_common.h      |   1 +
 drivers/remoteproc/qcom_sysmon.c      | 116 +++++++++++++++++++++++++++++-----
 drivers/soc/qcom/glink_ssr.c          |  20 +++++-
 include/linux/remoteproc.h            |  17 +++++
 include/linux/remoteproc/qcom_rproc.h |  17 +++--
 6 files changed, 222 insertions(+), 35 deletions(-)

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
