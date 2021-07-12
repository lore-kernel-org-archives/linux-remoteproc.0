Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE4EC07E99
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 12:38:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34FA261003
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 12:38:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbhGLMku (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 12 Jul 2021 08:40:50 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:48778 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233805AbhGLMkt (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 12 Jul 2021 08:40:49 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16CCVvb2001640;
        Mon, 12 Jul 2021 14:37:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=HCZjONQoZYVrr53FxdG/lOzoX4QNWY5wjwPiTbLr+VE=;
 b=qFoGW61xnpDrJBkTrlFwCqX0z9sLJa5cru99kgAYm/VprGQuiTB+1eqA+uO0cqj8volA
 GKxe/LQUi2mRN8LC++u4o3Ot9USdrdSUzoG+BoPnxoo04lkABOzzCIJfSBHc8Ys44Pa4
 EQzhDR2+eK7mA+pbwSe3L7+P2yt1bwbTnf0jNE6d9CWvrkc6DBdWtFudTyeQ+q2vgxA2
 CW4jdnS8AoKRnbIyNgCx0myFVciRk6K2V3Av8iXYD8rGGytbNSuOv+J34g6OIc5nRohv
 6VoDReeWP2aJ034s5vf92gBa9hQabPEpVQxPuDGNrI14r8OOKRIakfvFq0Dkbqq9jEHa Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39rm34ghte-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Jul 2021 14:37:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7EB3910002A;
        Mon, 12 Jul 2021 14:37:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 59C662248B0;
        Mon, 12 Jul 2021 14:37:57 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Jul 2021 14:37:56
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v5 0/4] Restructure the rpmsg char to decorrelate the control part.
Date:   Mon, 12 Jul 2021 14:37:48 +0200
Message-ID: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-12_07:2021-07-12,2021-07-12 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Main update from V4 [1] 
 - complete commit messages with Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
 - rebased on kernel V.14-rc1.

This series can be applied and tested on "Linux 5.14-rc1"(e73f0f0ee754) branch

Series description:
This series is the second step in the division of the series [2]: 
"Introducing a Generic IOCTL Interface for RPMsg Channel Management".

The purpose of this patchset is to split the code related to the control
and the endpoint. The code related to the control part is moved in the rpmsg_ctrl.c.
This split is an intermediate step to extend the controls to allow user applications to
instantiate rpmsg devices.
    
Notice that this patchset does not modify the behavior for using the RPMSG_CREATE_EPT_IOCTL
and RPMSG_DESTROY_EPT_IOCTL controls.
  
The next step should be to add the capability to:
- instantiate rpmsg_chrdev from the remote side (NS announcement),
- instantiate rpmsg_chrdev from local user application by introducing the
  IOCTLs RPMSG_CREATE_DEV_IOCTL and RPMSG_DESTROY_DEV_IOCTL to instantiate the rpmsg devices,
- send a NS announcement to the remote side on rpmsg_chrdev local instantiation.

[1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=483793
[2]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=435523

Arnaud Pouliquen (4):
  rpmsg: char: Remove useless include
  rpmsg: char: Export eptdev create an destroy functions
  rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl
  rpmsg: Update rpmsg_chrdev_register_device function

 drivers/rpmsg/Kconfig             |   9 ++
 drivers/rpmsg/Makefile            |   1 +
 drivers/rpmsg/qcom_glink_native.c |   2 +-
 drivers/rpmsg/qcom_smd.c          |   2 +-
 drivers/rpmsg/rpmsg_char.c        | 184 ++-----------------------
 drivers/rpmsg/rpmsg_char.h        |  51 +++++++
 drivers/rpmsg/rpmsg_ctrl.c        | 215 ++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h    |   8 +-
 drivers/rpmsg/virtio_rpmsg_bus.c  |   2 +-
 9 files changed, 293 insertions(+), 181 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_char.h
 create mode 100644 drivers/rpmsg/rpmsg_ctrl.c

-- 
2.17.1

