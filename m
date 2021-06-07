Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD475C47082
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Jun 2021 17:30:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93ACE61090
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Jun 2021 17:30:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbhFGRcn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 7 Jun 2021 13:32:43 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:51841 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230409AbhFGRcn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 7 Jun 2021 13:32:43 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 157HLnSP016433;
        Mon, 7 Jun 2021 19:30:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=4K7B8Tgo+sUqb2EMy3lz5Ixcq5OEwNr88+4MnIdV1OM=;
 b=Co4w9wRz4lQ8dPql6Jf/sS3j5kNCWIHCMTGf6vFHRemZ9SsofaOXUS8S2QJ/2EuYtB+X
 vu6PKuSRNDhST08xVh9nH6Gconbt2JYyW64zsYP49lTXwwIcfVa5mO2ogJ/bNzE6w/jM
 Vtg6hhlhDNu0rGo/WQjkyapyvQhGOs8G2vqNkOhtGbp241qH34hudnm/cP6BIZaoFWER
 9mL/Wm39IKu/xQ1inAoj2UPDivmZGK5ccg0qbR9ML3ibzDw0u3Hdnn2NO26ZQItXMZpt
 CuAdrJPKrlp6Qbeluu+A8vf9fvSm7aQfiXHCcpzz9jQhAKA8zJgRkyyrDnrwbfYEQWpC Hw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 391evfbb29-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Jun 2021 19:30:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4D49E10002A;
        Mon,  7 Jun 2021 19:30:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 120102142B6;
        Mon,  7 Jun 2021 19:30:37 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 7 Jun 2021 19:30:36
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <julien.massot@iot.bzh>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 0/4] rpmsg: char: introduce the rpmsg-raw channel
Date:   Mon, 7 Jun 2021 19:30:28 +0200
Message-ID: <20210607173032.30133-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-07_14:2021-06-04,2021-06-07 signatures=0
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

How to test it:
  - This series can be applied on git/andersson/remoteproc.git for-next branch (dc0e14fa833b)
    + the "Restructure the rpmsg char to decorrelate the control part" series[2]

[1] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=475217
[2] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=483793



Arnaud Pouliquen (4):
  rpmsg: Introduce rpmsg_create_default_ept function
  rpmsg: char: Add possibility to create and reuse default endpoint
  rpmsg: char: Introduce the "rpmsg-raw" channel
  rpmsg: char: Return error if user tries to destroy a default endpoint.

 drivers/rpmsg/rpmsg_char.c | 92 +++++++++++++++++++++++++++++++++++---
 drivers/rpmsg/rpmsg_core.c | 51 +++++++++++++++++++++
 include/linux/rpmsg.h      | 14 ++++++
 3 files changed, 151 insertions(+), 6 deletions(-)

-- 
2.17.1

