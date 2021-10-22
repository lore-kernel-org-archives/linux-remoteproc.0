Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F51C433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 22 Oct 2021 12:54:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1295B6101C
	for <linux-remoteproc@archiver.kernel.org>; Fri, 22 Oct 2021 12:54:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231868AbhJVM5G (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 22 Oct 2021 08:57:06 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:55298 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231739AbhJVM5F (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 22 Oct 2021 08:57:05 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19M8o97r015566;
        Fri, 22 Oct 2021 14:54:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=4545gzfZpCF9d4g2LqSdYVerquj8M+OCHoiQEKzehvo=;
 b=11Sm4BRyGAwYvbbovptqZlLDfmiq6cqlJMw3KNOM3HIqLkevMpvD2bpnSa0qdzJbvXib
 2w1UZCamUq4uvRgrvM/YXel2WOd+/sPcSrroLDUxAL69LFptZ0J2BL+FZaoDwg+hfe82
 j5PET/MvVgbLl1T/sof0zj+mTVXMe4KMIWkn0a6z3v/Qvc9SFn0hEvTmHpxe+vtpb8y1
 WMXDLSGOH5e+je5sVisScElNpESn/oM/GzgJre2WnNlfWfFmV5/Bin94YcOkYPMM5vTi
 f866Ns+rVXy5oVd+Uqi6B8dmYtn8XlJ1PIVLN5a3Q8uW/o4cWGloyLll0l126JyCBq06 fQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3but4y1eu8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Oct 2021 14:54:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9541A10002A;
        Fri, 22 Oct 2021 14:54:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8705221A226;
        Fri, 22 Oct 2021 14:54:38 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 22 Oct 2021 14:54:38
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v6 00/10] Restructure the rpmsg_char driver and introduce rpmsg_ctrl driver.
Date:   Fri, 22 Oct 2021 14:54:16 +0200
Message-ID: <20211022125426.2579-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-22_03,2021-10-22_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Main update from V5 [1] 
This series is a re-merging of 3 series in one (I increased patchset version based on the first one):

- Restructure the rpmsg char to decorrelate the control part (v5) [1].
- Introduce a generic IOCTL interface for RPMsg channels management (V4) [2].
- rpmsg: ctrl: Introduce new RPMSG_CREATE/RELEASE_DEV_IOCTL controls (V3) [3]

With update based on Bjorn Andersson comments:
 - comment the use of the IS_REACHABLE macro
 - Migrate the creation of the rpmsg class from the rpmsg_char.c to rpmsg_core.c
 - refactor the rpmsg_chrdev_eptdev_create in two sub function to address potential race
   condition reported by Bjorn in rpmsg_chrdev_probe[4].

And a new patch to fix ns announcement on default endpoint creation.

Patchset description:

The current rpmsg_char module implements a /dev/rpmsg_ctrl interface that provides the ability to
instantiate char devices (/dev/rpmsgX) associated with an rpmsg endpoint for communication with the
remote processor.
This implementation fit with QCOM rpmsg backend but not with themagement by chanel implemented in 
the generic rpmsg virtio backend.
This series restructures the rpmsg_char driver to decorrelate the control part from the data part
in order to improve its compatible with the rpmsg virtio backend.

Objective:
- Expose a /dev/rpmsg_ctrlX interface for the application that is no longer dedicated to the
  rpmsg_char but generalized to all rpmsg services. This offers capability to create and destroy
  rpmsg channels from a user's application initiative (using the new RPMSG_CREATE_DEV_IOCTL and
  RPMSG_DESTROY_DEV_IOCTL controls).
  An application will be able to create/establish an rpmsg communication channel to communicate
  with the remote processor, and not only wait the remote processor initiative.
  This is interesting for example to establish a temporary communication link for diagnosis,
  calibration, debugging... or instantiate  new data flows on some user actions.
- Add capability to probe the rpmsg_char device at the initiative of the remote processor
 (rpmsg service announcement mechanism).
  This allows platforms based on the rpmsg virtio backend to create the /dev/rpmgX interface with
  a rpmsg name service announcement.

Subsets:
  - Extract the control part of the char dev and create the rpmsg_ctrl.c file (patches 1 to 4)
  - Introduce the "rpmsg-raw" channel in rpmsg_char(patches 5 to 8)
  - Introduce the RPMSG_CREATE_DEV_IOCTL IOCTL and RPMSG_DESTROY_DEV_IOCTL to instantiate RPMsg
    devices (patch 9)
    The application can then create or release a channel by specifying:
       - the name service of the device to instantiate.   
       - the source address.
       - the destination address.
  - Send a ns announcement to the remote processor on default endpoint creation (patche 10)

This series can be applied and tested on git/remoteproc/linux.git[5] for-next branch (6ee5808de074).

[1] https://lore.kernel.org/all/20210712123752.10449-1-arnaud.pouliquen@foss.st.com/
[2] https://lore.kernel.org/all/20210217132905.1485-1-arnaud.pouliquen@foss.st.com/
[3] https://lore.kernel.org/all/20210712132303.25058-1-arnaud.pouliquen@foss.st.com/
[4] https://lkml.org/lkml/2021/10/8/1158
[5] https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git 

Arnaud Pouliquen (10):
  rpmsg: char: Export eptdev create an destroy functions
  rpmsg: create the rpmsg class in core instead of in rpmsg char
  rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl
  rpmsg: Update rpmsg_chrdev_register_device function
  rpmsg: char: Refactor rpmsg_chrdev_eptdev_create function
  rpmsg: Introduce rpmsg_create_default_ept function
  rpmsg: char: Add possibility to use default endpoint of the rpmsg
    device.
  rpmsg: char: Introduce the "rpmsg-raw" channel
  rpmsg: ctrl: Introduce new RPMSG_CREATE/RELEASE_DEV_IOCTL controls
  rpmsg: core: send a ns announcement when a default endpoint is created

 drivers/rpmsg/Kconfig             |   9 ++
 drivers/rpmsg/Makefile            |   1 +
 drivers/rpmsg/qcom_glink_native.c |   2 +-
 drivers/rpmsg/qcom_smd.c          |   2 +-
 drivers/rpmsg/rpmsg_char.c        | 247 +++++++++++-------------------
 drivers/rpmsg/rpmsg_char.h        |  59 +++++++
 drivers/rpmsg/rpmsg_core.c        |  88 ++++++++++-
 drivers/rpmsg/rpmsg_ctrl.c        | 245 +++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h    |   8 +-
 drivers/rpmsg/virtio_rpmsg_bus.c  |   2 +-
 include/linux/rpmsg.h             |  23 +++
 include/uapi/linux/rpmsg.h        |  10 ++
 12 files changed, 530 insertions(+), 166 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_char.h
 create mode 100644 drivers/rpmsg/rpmsg_ctrl.c

-- 
2.17.1

