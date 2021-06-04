Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF04FC47098
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Jun 2021 09:14:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4C636140B
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Jun 2021 09:14:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbhFDJQH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Jun 2021 05:16:07 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:57380 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229959AbhFDJQG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Jun 2021 05:16:06 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15496stS028635;
        Fri, 4 Jun 2021 11:14:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=EohvLLi/iGWwChJWs40a6J2SceXgPMqxbBWZsq2O7Hc=;
 b=GS1IIk8GSTX7QIDj+6dqIk/oizRBSph9varKDyYKW4+MyM7CJc2a42WRiSTj0IpIhdUW
 ZHY7pijSePDe5Nkou/h2BevQMmLH9fSguUVbJ5znlo1uBaCtQRqL6dz5LkiO2rN+1WaB
 sWUEKx6Ij6ydPe6ZbMNIwi/gyzUgOHPPBvgjcUdo+0N895fmVGq3OYuqQNJNDMwb791A
 2SErsnwyYI2oK4ST8kU24maN+IavY/VKKb4nmN0hHVzqTXiGEEyB8rLC0Ywmb1RnNhmy
 UpJFcmeHBwahqc6tL27XGSnS0WA3LwUl6nfTOmmq/zyl34N68u+rbhM+j76MFcE2PrIw eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38yg960gr9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 04 Jun 2021 11:14:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D07B610002A;
        Fri,  4 Jun 2021 11:14:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C0793216EEF;
        Fri,  4 Jun 2021 11:14:16 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Jun 2021 11:14:16
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 0/4] rpmsg: ctrl: Add ability to instantiate rpmsg device locally
Date:   Fri, 4 Jun 2021 11:14:02 +0200
Message-ID: <20210604091406.15901-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-04_05:2021-06-04,2021-06-04 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Purpose:
  Allow the user space application to create and release an rpmsg device by adding
  rpmsg ioctrl to the /dev/rpmsg_ctrl interface
    
Aim:
  The current implementation is based on the enumeration of services by the 
  remote processor to create a new channel and instantiate associated rpmsg device.
  There is no solution to create a rpmsg channel on user application request.
  If the rpmsg char driver allows adding a new endpoint over an existing channel, it
  does not offer the ability to create a new one.
  Adding the IOCTRL to instantiate rpmsg channels from the user application will allow
  to dynamically create and destroy rpmsg devices. Some examples of use are:
  - activate the service at the initiative of the application,
  - remove the communication on a specific channel before entering the suspend mode,
  - creating a temporary channel for debugging purposes.

Concerns:
  This implementation is very simple but allows the user application to create rpmsg devices
  without any limitations.
  - A device can be created even if there is no match with the driver (and it is difficult to
    check a match with module drivers).
  - It is not really possible to add a counter to limit the number of devices, because a device
    can be released by the remote side.
  
  The question is: should we add protection? Notice that there is no protection for RPMSG_CREATE_EPT_IOCTL.

  If this is not considered safe, another approach could be to create an rpmsg_ctrl API to add controls.
  This API would be used by a rpmsg driver to add is own user controls, such as creating/deleting devices.

How to test it:
  - This series can be applied on git/andersson/remoteproc.git for-next branch (dc0e14fa833b)
    + the "Restructure the rpmsg char to decorrelate the control part" series[1]
  - to test the ioctrl, a rpmsgexportdev tool is available here: https://github.com/arnopo/rpmsgexport

[1]https://patchwork.kernel.org/project/linux-remoteproc/list/?series=483793

Arnaud Pouliquen (4):
  rpmsg: ctrl: Introduce RPMSG_CREATE_DEV_IOCTL
  rpmsg: ctrl: Introduce RPMSG_RELEASE_DEV_IOCTL
  rpmsg: ctrl: Add check on rpmsg device removability from user space
  rpmsg: Add a removable attribute to the rpmsg device

 drivers/rpmsg/rpmsg_core.c |  2 ++
 drivers/rpmsg/rpmsg_ctrl.c | 52 +++++++++++++++++++++++++++++++++++---
 include/linux/rpmsg.h      |  2 ++
 include/uapi/linux/rpmsg.h | 10 ++++++++
 4 files changed, 62 insertions(+), 4 deletions(-)

-- 
2.17.1

