Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C74C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Nov 2021 14:19:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E261961076
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Nov 2021 14:19:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240354AbhKHOWf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Nov 2021 09:22:35 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:38924 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S237790AbhKHOWe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Nov 2021 09:22:34 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A8Ds7cM012060;
        Mon, 8 Nov 2021 15:19:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=lmF5oPPLeXyqn8t5sWIyEw/YfHGjBm/0hY8o/n1uANg=;
 b=QaaNXw5c130TSXa+G4RoyDAGINd6ILwFT2SezLJnfeSQ8AVKjX0Lg2sMY94pyp3y/7tk
 qiHSMzusRpqdIjATIJDuG+HsQWgR1FOk/DxIoLLLIcf4mF+zibmgQE3eWQQNpElTXQgo
 wxnWCIhRPvPEJ1KCAg43e064zjDd33ehfRn45eDsAZwezEF97iO3E0wZXNfhaHLimL+U
 rtRRNyb1EaFanF0KhrLuv0Ya07mq0Yn6IymVQJLDSdshVvToqpeO/60HqWKq+X9HPVqq
 VJHY8XGidghfrRHkLtwL7R6OuEkixHiNX9Gd35ivK2qYDCUqFlKi6WOLbAHzlmKjYDgH 2w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c70ym2bpr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 Nov 2021 15:19:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1219010002A;
        Mon,  8 Nov 2021 15:19:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DCD1E21BF6B;
        Mon,  8 Nov 2021 15:19:41 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 8 Nov 2021 15:19:41
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v7 00/12] Restructure the rpmsg_char driver and introduce rpmsg_ctrl driver
Date:   Mon, 8 Nov 2021 15:19:25 +0100
Message-ID: <20211108141937.13016-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_05,2021-11-08_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Update from V6 [1] based on Bjorn Andersson comments:
- rework rpmsg class: suppress API in rpmsg.h and expose directly the variable in rpmsg_internal.h
- move rpmsg_create_default_ept declaration from rpmsg.h to rpmsg_internal.h
- rework the configs dependencies between RPMSG_CTRL and RPMSG_CHAR

Remaining discussion from V6:
-  use of the rpmsg_create_default_ept API (proposal is to put it in rpmsg_internal.h).

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
  - Extract the control part of the char dev and create the rpmsg_ctrl.c file (patches 1 to 6)
  - Introduce the "rpmsg-raw" channel in rpmsg_char(patches 7 to 10)
  - Introduce the RPMSG_CREATE_DEV_IOCTL IOCTL and RPMSG_DESTROY_DEV_IOCTL to instantiate RPMsg
    devices (patch 11)
    The application can then create or release a channel by specifying:
       - the name service of the device to instantiate.   
       - the source address.
       - the destination address.
  - Send a ns announcement to the remote processor on default endpoint creation (patche 12)

This series has be applied and tested on 5.15 branch (6ee5808de074)[2].

[1] https://lkml.org/lkml/2021/10/22/431
[2] https://github.com/torvalds/linux.git

Arnaud Pouliquen (10):
  rpmsg: char: Export eptdev create an destroy functions
  rpmsg: create the rpmsg class in core instead of in rpmsg char
  rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl
  ARM: configs: Configs that had RPMSG_CHAR now gets RPMSG_CTRL
  RISCV: configs: Configs that had RPMSG_CHAR now gets RPMSG_CTRL
  rpmsg: Update rpmsg_chrdev_register_device function
  rpmsg: char: Refactor rpmsg_chrdev_eptdev_create function
  rpmsg: Introduce rpmsg_create_default_ept function
  rpmsg: char: Add possibility to use default endpoint of the rpmsg
    device.
  rpmsg: char: Introduce the "rpmsg-raw" channel
  rpmsg: ctrl: Introduce new RPMSG_CREATE/RELEASE_DEV_IOCTL controls
  rpmsg: core: send a ns announcement when a default endpoint is created

 arch/arm/configs/qcom_defconfig   |   1 +
 arch/riscv/configs/defconfig      |   1 +
 arch/riscv/configs/rv32_defconfig |   1 +
 drivers/rpmsg/Kconfig             |   8 +
 drivers/rpmsg/Makefile            |   1 +
 drivers/rpmsg/qcom_glink_native.c |   2 +-
 drivers/rpmsg/qcom_smd.c          |   2 +-
 drivers/rpmsg/rpmsg_char.c        | 244 +++++++++++------------------
 drivers/rpmsg/rpmsg_char.h        |  51 ++++++
 drivers/rpmsg/rpmsg_core.c        |  83 +++++++++-
 drivers/rpmsg/rpmsg_ctrl.c        | 250 ++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h    |  14 +-
 drivers/rpmsg/virtio_rpmsg_bus.c  |   2 +-
 include/uapi/linux/rpmsg.h        |  10 ++
 14 files changed, 506 insertions(+), 164 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_char.h
 create mode 100644 drivers/rpmsg/rpmsg_ctrl.c

-- 
2.17.1

