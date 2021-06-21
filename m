Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02E3C48BE5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Jun 2021 12:58:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8B786112D
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Jun 2021 12:58:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhFUNA2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Jun 2021 09:00:28 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:44003 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229640AbhFUNA1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Jun 2021 09:00:27 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15LCvdmc005554;
        Mon, 21 Jun 2021 14:58:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=xZenHtyJUIK3Jd8YfDY8+5e0esoKzch1be763fqXWKY=;
 b=EltBVEyjIMOpwbEfiFBW0M6nIoNwnIOOlQDSdt6qp0QzWCCLLdC5wqbKe1Ie4/V6zMgK
 yBwIdedLhYJ15J9Yd/y0n6mWPF9/av2eW/MYpYeX3T1EC6sh4mEeBihWfbgx2xusvp+6
 eIINUQdSzL+j1nF+MO+I4zAO+/ULg0m5GQKwxBL39UwdNUEHL7666mv1urFEWwgEwHxo
 ZyH0UZGlasT6+yFwYFeNrbPFzXRx1VhnLse8VKAL7l/ONjORIbj/fQedoSBMM6mY4p0b
 vPMNWgFX4o7u856BO3ePXR0hdKYxg1VYrxUkISEERDmE8D1dAg3TQGvqcRjkbxogooYx ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39amg22dsj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 21 Jun 2021 14:58:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F1739100034;
        Mon, 21 Jun 2021 14:58:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DBF0F22B9C4;
        Mon, 21 Jun 2021 14:58:10 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 21 Jun 2021 14:58:10
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 0/1] rpmsg: ctrl: Add ability to instantiate rpmsg device locally
Date:   Mon, 21 Jun 2021 14:57:59 +0200
Message-ID: <20210621125800.27696-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-21_06:2021-06-21,2021-06-21 signatures=0
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


Delta vs V1 [1]
- Squah patches 1/4(rpmsg: ctrl: Introduce RPMSG_CREATE_DEV_IOCTL) and
  2/4 (rpmsg: ctrl: Introduce RPMSG_RELEASE_DEV_IOCTL).
- Remove the rpmsg device attribue to check if a rpmg device can be released, choose to trust
  the application (a similar trust already exists for the bind/unbind interface).

[1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=494021

How to test it:
  - This series can be applied on git/andersson/remoteproc.git for-next branch (dc0e14fa833b)
    + the "Restructure the rpmsg char to decorrelate the control part" series[2]
  - to test the ioctrl, a rpmsgexportdev tool is available here:
     https://github.com/arnopo/rpmsgexport

[2]https://patchwork.kernel.org/project/linux-remoteproc/list/?series=483793

Arnaud Pouliquen (1):
  rpmsg: ctrl: Introduce new RPMSG_CREATE/RELEASE_DEV_IOCTL controls

 drivers/rpmsg/rpmsg_ctrl.c | 37 +++++++++++++++++++++++++++++++++----
 include/uapi/linux/rpmsg.h | 10 ++++++++++
 2 files changed, 43 insertions(+), 4 deletions(-)

-- 
2.17.1

