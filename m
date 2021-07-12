Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427C9C07E99
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 13:19:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C6D16100B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 12 Jul 2021 13:19:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbhGLNW2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 12 Jul 2021 09:22:28 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:6504 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229479AbhGLNW2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 12 Jul 2021 09:22:28 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16CDHlpo024628;
        Mon, 12 Jul 2021 15:19:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=gwVx0e9bF4mpE4juE3HjRfUvca3Xplg3oe0uE8gGxtc=;
 b=07OfkduQFJJbkZbNR6cwf2IG87kXrsTtWIsy0K931IcZMQsHitivJXgI3EerFYgBP92N
 YAghubr0tl/LeMAgQX+r2pxIu0760TnTSdwP4VGnLh0kA4xgGzMvBsl7ptODZcUGi0EC
 BdcS+TjiYvEOkDPabeaXcRiDmdZy+SpQvkMcJIVgqcu6Das4eFL4yK20VmC3rqWkSLmd
 vR/WqrKqVvfKhYYK6FlxX2h7yAMVXymYRZn+dcz9VCRdy+ewdU6nvpT2pjguElRdYBA2
 EpoRLQt6dxh944lygDxACKXNOFvf68V5QAPAP5RiZY35G5wqlvMTYE70XHoxJoJudzJe HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39rh6w9vn2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Jul 2021 15:19:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D7E3310002A;
        Mon, 12 Jul 2021 15:19:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BB4812291D5;
        Mon, 12 Jul 2021 15:19:33 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Jul 2021 15:19:33
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v4 0/4] rpmsg: char: introduce the rpmsg-raw channel
Date:   Mon, 12 Jul 2021 15:18:56 +0200
Message-ID: <20210712131900.24752-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-12_08:2021-07-12,2021-07-12 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


Purpose:
  Allow the remote processor to instantiate a /dev/rpmsgX interface relying on the NS announcement
  of the "rpmsg-raw" service.
  This patchet is extracted from  the series [1] with rework to add rpmsg_create_default_ept helper.

  
Aim:
  There is no generic sysfs interface based on RPMsg that allows a user application to communicate
  with a remote processor in a simple way.
  The rpmsg_char dev solves a part of this problem by allowing an endpoint to be created on the
  local side. But it does not take advantage of the NS announcement mechanism implemented for some
  backends such as the virtio backend. So it is not possible to probe it from  a remote initiative.
  Extending the char rpmsg device to support NS announcement makes the rpmsg_char more generic.
  By announcing a "rpmg-raw" service, the firmware of a remote processor will be able to
  instantiate a /dev/rpmsgX interface providing to the user application a basic link to communicate
  with it without any knowledge of the rpmsg protocol.

Implementation details:
  - Register a rpmsg driver for the rpmsg_char driver, associated to the "rpmsg-raw" channel service.
  - In case of rpmsg char device instantiated by the rpmsg bus (on NS announcement) manage the 
    channel default endpoint to ensure a stable default endpoint address, for communication with 
    the remote processor.

delta vs V3:
- add Tested-by: Julien Massot <julien.massot@iot.bzh>
- rebased on kernel V.14-rc1 + 
   patchset V5: Restructure the rpmsg char to decorrelate the control part [2]


How to test it:
  - This series can be applied on e73f0f0ee754kernel V.14-rc1 (e73f0f0ee754)
    + the "Restructure the rpmsg char to decorrelate the control part" series[2]

[1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=475217
[2] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=514017



Arnaud Pouliquen (4):
  rpmsg: Introduce rpmsg_create_default_ept function
  rpmsg: char: Introduce __rpmsg_chrdev_create_eptdev function
  rpmsg: char: Add possibility to use default endpoint of the rpmsg
    device.
  rpmsg: char: Introduce the "rpmsg-raw" channel

 drivers/rpmsg/rpmsg_char.c | 120 ++++++++++++++++++++++++++++++++++---
 drivers/rpmsg/rpmsg_core.c |  51 ++++++++++++++++
 include/linux/rpmsg.h      |  13 ++++
 3 files changed, 175 insertions(+), 9 deletions(-)

-- 
2.17.1

