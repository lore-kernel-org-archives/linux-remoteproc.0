Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83769C49EA6
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Jun 2021 15:08:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E6C86115A
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Jun 2021 15:08:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhFWPKl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 23 Jun 2021 11:10:41 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:15010 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231262AbhFWPKj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 23 Jun 2021 11:10:39 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15NF3WaI024632;
        Wed, 23 Jun 2021 17:08:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=m4skZ/hqtzjeBBG9EAG0Kvykw65499WKDVjkEP1Fup0=;
 b=PiUXOHutnbtpeUNWR7AOif4AO7U2EDAUTvOC31Z99GFTzbhKj+z+VDP5MOc4bnepC/ly
 33qszvTsxkIycfd29f63/U/DFKRTrY5FacZFXzisoF3s1Ot0MnEXlp3HMTfOFcMDabcs
 E7XOw2nMSPkUzcxNcneGZCSF16MgZZd6qKhNybjGyzkqS2TpWgPY0SOBIkyYr59RnjJr
 MBexpBMmO5r70JKnMVUp2tigcSeI/1/i+5u7QZUtHF3jmTZoDTFWpkLb75Io1DhtXg1D
 J1RVq3IvjGEe/bC55SquxtgUOYOnMJMve2mGz9xhJcFdT01Dxwta/FACrORwnTzTAOA6 uQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 39c10btu2d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 23 Jun 2021 17:08:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CD48E10002A;
        Wed, 23 Jun 2021 17:08:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B0F0322D186;
        Wed, 23 Jun 2021 17:08:10 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 23 Jun 2021 17:08:10
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 0/4] rpmsg: char: introduce the rpmsg-raw channel
Date:   Wed, 23 Jun 2021 17:05:00 +0200
Message-ID: <20210623150504.14450-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-23_09:2021-06-23,2021-06-23 signatures=0
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

delta vs V1 [2]:
- Rework __rpmsg_chrdev_create_eptdev to return rpmsg_eptdev struct (to use it as private
  data parameter on the rpmsg_create_default_ept call).
- Create default endpoint in the rpmsg_eptdev_open instead of in the open function.
- Squash " rpmsg: char: Return error if user tries to destroy a default endpoint" patch in 
  "rpmsg: char: Add possibility to create and reuse default endpoint" patch.
- Suppress Tested-by: Julien Massot <julien.massot@iot.bzh>, as updates can impact the test result.


How to test it:
  - This series can be applied on git/andersson/remoteproc.git for-next branch (dc0e14fa833b)
    + the "Restructure the rpmsg char to decorrelate the control part" series[3]

[1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=475217
[2] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=495557
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

