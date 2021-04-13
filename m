Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B741CC433B4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Apr 2021 13:45:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97CBA61019
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Apr 2021 13:45:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346082AbhDMNpp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 13 Apr 2021 09:45:45 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:47844 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1346076AbhDMNpo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Apr 2021 09:45:44 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13DDhRDN031750;
        Tue, 13 Apr 2021 15:45:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=MYBqS1kHklA7I7PbkLW0VJrCIpl2g8/kyjPjrVAuLD8=;
 b=1DappFPlpJ7sThdMdwIrvROpDT6SWL7DhgUWd7B2GAbz4XlVwJQg+qIL6QD2kBBg8a7h
 A5Zb5WnTJx8Tw8XUtEVdTVlkXH6fvuWCqB8U40M225ZlrO71sY2V7NPU3bxLkTOmp7IY
 VlIphPC21OD66IFNvlPTPu8paOn/OIcRGb9qK44LgXSRDKcHgmaSWRwEoYeDvh/NB1lf
 KxbO76sKfv2cGRwYmr6noc+m1oE/w0xGDZFXijS28td72qoRXJvsfl2JBVzoYcE0xioF
 sYpqK885awukJ9Ox3wj8Ty1qkOnjc50SwiAX3iEFe6pEJDKKAjqbmGfxEPac+43iW5KA 5A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37vu4e52sf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Apr 2021 15:45:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E70F110002A;
        Tue, 13 Apr 2021 15:45:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D59A3226C5A;
        Tue, 13 Apr 2021 15:45:18 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 15:45:18
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 0/7] Restructure the rpmsg char and introduce the rpmsg-raw channel
Date:   Tue, 13 Apr 2021 15:44:51 +0200
Message-ID: <20210413134458.17912-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-13_07:2021-04-13,2021-04-13 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


update from V1 [1]
 - fix issues reported by Mathieu Poirier

This series is the second step in the division of the series [2]: 
"Introducing a Generic IOCTL Interface for RPMsg Channel Management".

The purpose of this patchset is to:
- split the control code related to the control
  and the endpoint. 
- define the rpmsg-raw channel, associated with the rpmsg char device to
  allow it to be instantiated using a name service announcement.
    
An important point to keep in mind for this patchset is that the concept of
channel is associated with a default endpoint. To facilitate communication
with the remote side, this default endpoint must have a fixed address.

Consequently, for this series, I made a design choice to fix the endpoint
on the "rpmsg-raw" channel probe, and not allow to create/destroy an endpoint
on FS open/close.

This is only applicable for channels probed by the rpmsg bus. The behavior,
using the RPMSG_CREATE_EPT_IOCTL and RPMSG_DESTROY_EPT_IOCTL controls, is
preserved.
  
The next steps should be to correct this:
Introduce the IOCTLs RPMSG_CREATE_DEV_IOCTL and RPMSG_DESTROY_DEV_IOCTL
to instantiate the rpmsg devices

[1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=453805
[2]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=435523

Arnaud Pouliquen (7):
  rpmsg: char: Export eptdev create an destroy functions
  rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl
  rpmsg: Update rpmsg_chrdev_register_device function
  rpmsg: char: Introduce __rpmsg_chrdev_create_eptdev function
  rpmsg: char: Introduce a rpmsg driver for the rpmsg char device
  rpmsg: char: No dynamic endpoint management for the default one
  rpmsg: char: Return error if user tries to destroy a default endpoint.

 drivers/rpmsg/Kconfig             |   9 ++
 drivers/rpmsg/Makefile            |   1 +
 drivers/rpmsg/qcom_glink_native.c |   2 +-
 drivers/rpmsg/qcom_smd.c          |   2 +-
 drivers/rpmsg/rpmsg_char.c        | 222 +++++++++-------------------
 drivers/rpmsg/rpmsg_char.h        |  52 +++++++
 drivers/rpmsg/rpmsg_ctrl.c        | 231 ++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h    |   8 +-
 drivers/rpmsg/virtio_rpmsg_bus.c  |   2 +-
 9 files changed, 368 insertions(+), 161 deletions(-)
 create mode 100644 drivers/rpmsg/rpmsg_char.h
 create mode 100644 drivers/rpmsg/rpmsg_ctrl.c

-- 
2.17.1

