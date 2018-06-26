Return-Path: <elder@linaro.org>
Return-Path: <elder@linaro.org>
From: Alex Elder <elder@linaro.org>
Subject: [PATCH v2 0/5] remoteproc: updates for new events
Date: Tue, 26 Jun 2018 07:11:54 -0500
Message-Id: <20180626121159.7267-1-elder@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

This series changes the prototype for rproc_add_subdev().  The
caller is now responsible for populating the function pointers
recorded in the rproc_subdev structure, rather than having them be
passed as arguments.  These two existing function pointers have been
renamed ("probe" is now "start" and "remove" is now "stop"), and
they are now optional.  Callback functions may now also be assigned
for two new events (prior to start and after stop).

					-Alex

v2: Adjusted signoff sections of patches as requested by Bjorn.

Alex Elder (1):
  remoteproc: rename subdev probe and remove functions

Bjorn Andersson (4):
  remoteproc: Rename subdev functions to start/stop
  remoteproc: Make start and stop in subdev optional
  remoteproc: Make client initialize ops in rproc_subdev
  remoteproc: Introduce prepare and unprepare for subdevices

 drivers/remoteproc/qcom_common.c     |  26 ++++---
 drivers/remoteproc/qcom_sysmon.c     |   5 +-
 drivers/remoteproc/remoteproc_core.c | 110 ++++++++++++++++++++-------
 include/linux/remoteproc.h           |  19 ++---
 4 files changed, 109 insertions(+), 51 deletions(-)

-- 
2.17.1
