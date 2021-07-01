Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA40C11F64
	for <linux-remoteproc@archiver.kernel.org>; Thu,  1 Jul 2021 09:04:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DFE76145D
	for <linux-remoteproc@archiver.kernel.org>; Thu,  1 Jul 2021 09:04:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235643AbhGAJHA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 1 Jul 2021 05:07:00 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:3658 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235067AbhGAJHA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 1 Jul 2021 05:07:00 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16193GPo018054;
        Thu, 1 Jul 2021 11:04:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=PuCgOMVS+k9BdyTGiSWcQ42Ozxz0XMx82mro7FoPaW0=;
 b=r5apYu81ioi0MukLfvhpZ3bS2I5fl0+xuml7HRydVg7OKOkrvbjFyZXCyEh5BNTJhEB0
 SDYK2QSZIz4usYoPBXekIXT2UnL7G8y3KV1lm+mLzcqEzAjt3Oa6qgPwj/dAv0SFOX1P
 sPyE0FJNp6e7J2gBkcI19IkjByf9pViDhr6XBut9ootxo3h9OctFmZaZ+RiSH+u18ejw
 O9L+kfm8RdI9oWwi9K47zC0sbk7mXVxax0tHILysgPpRp+pVxEMva7fx97t2XWKuNBBx
 PPgaROttSyxSQCYAyRfuEpJ5DFiGL95zE1YOPeBaBjo3lh8X15cOLo5iPLBVMgwd5JzO hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39h9qe8j4d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 01 Jul 2021 11:04:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8E4E810002A;
        Thu,  1 Jul 2021 11:04:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 705702138C8;
        Thu,  1 Jul 2021 11:04:22 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul 2021 11:04:21
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v3 0/4] rpmsg: char: introduce the rpmsg-raw channel
Date:   Thu, 1 Jul 2021 11:04:09 +0200
Message-ID: <20210701090413.3104-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-01_06:2021-06-30,2021-07-01 signatures=0
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

delta vs V2 [2]:
- Fix typos.
- Suppress useless check on eptdev->rpdev, in rpmsg_eptdev_ioctl.
- Add the Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>.

How to test it:
  - This series can be applied on git/andersson/remoteproc.git for-next branch (7486f29e5e60)
    + the "Restructure the rpmsg char to decorrelate the control part" series[3]

[1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=475217
[2] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=505873
[3] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=483793



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

