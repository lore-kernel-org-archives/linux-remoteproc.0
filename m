Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8AEC4332F
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Sep 2021 16:13:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5652761507
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Sep 2021 16:13:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349091AbhI3QPL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 30 Sep 2021 12:15:11 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:42636 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1349136AbhI3QPF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Sep 2021 12:15:05 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18UDFMr6004359;
        Thu, 30 Sep 2021 18:13:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=WA2LajeF8VZdGihemfmP2b2B7HQnkua+zsIiBEQnIes=;
 b=jqCwMr8hAUj3QE0DQ/lUL/U+cP3lJQ0ZpoEDXf/glIsUxSueryOwxbypgVlcZPoMxYi1
 cJQsVNEsurgQ+PGYqC/JHkBGurU/lK1bds2p6l9Suiw8fO79K5SLMdiP+rcfPRKX7Tz4
 8im7SSjQdCYjOPIXEPdQEdBz6OE7U8zL6bW5fBzUKg5guI/DE3ruuk5kTOJiwP+t8Tg2
 x4Zm352KZ6Kp9sFX+3DwkBKiq66krZ+HlPRO3d6teICQ3Rx0sZ1ySfbxZWrQJoBqWgsq
 FLzz/cdEqMIItXvVeDU50DDEKJ75bfwISVTIwt9l9ihVlZqz559PX1G1Sy+WYDV2ljNo Rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bddy9rymu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 30 Sep 2021 18:13:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0952E10002A;
        Thu, 30 Sep 2021 18:13:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EF521238687;
        Thu, 30 Sep 2021 18:13:04 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 30 Sep 2021 18:13:04
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        <arnaud.pouliquen@foss.st.com>, Suman Anna <s-anna@ti.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>
Subject: [PATCH v8 0/2] Add rpmsg tty driver
Date:   Thu, 30 Sep 2021 18:05:18 +0200
Message-ID: <20210930160520.19678-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_05,2021-09-30_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This new revision reopens subject started a long time ago. Previous revision discussions
available here [1]. 

This patchset introduces a TTY console on top of the RPMsg framework which
enables the following use cases:
- Provide a console to communicate easily with the remote processor application.
- Provide an interface to get the remote processor log traces without ring
  buffer limitation.
- Ease the migration from MPU + MCU processors to multi core processors
  (MPU and MCU integrated in one processor) by offering a virtual serial link.

An alternative of this proposed solution would consist in using the virtio
console:
The drawback with that solution is that it requires a specific virtio buffer
(in addition to the one already used for RPMsg) which does not fit with remote
processors with little memory. The proposed solution allows to multiplex the
console with the other rpmsg services, optimizing the memory.

The first patch adds an API to the rpmsg framework ('get max transmission unit')
and the second one is the rpmsg tty driver itself.

Update vs previous revision [1]:
  - simplify the patch by removing the control part(CTS) to keep only the stream part.
  - rebase on kernel V5.15-rc1
  - take into account v7 review comments.

Notice that I kept the Acked-by and Reviewed-by in "rpmsg: core: add API to get MTU" commit
even though I'm not sure if it's still relevant after such a long period...

[1] https://lkml.org/lkml/2020/3/24/1394 

Arnaud Pouliquen (2):
  rpmsg: core: add API to get MTU
  tty: add rpmsg driver

 Documentation/serial/tty_rpmsg.rst |  15 ++
 drivers/rpmsg/rpmsg_core.c         |  21 +++
 drivers/rpmsg/rpmsg_internal.h     |   2 +
 drivers/rpmsg/virtio_rpmsg_bus.c   |  10 ++
 drivers/tty/Kconfig                |   9 +
 drivers/tty/Makefile               |   1 +
 drivers/tty/rpmsg_tty.c            | 275 +++++++++++++++++++++++++++++
 include/linux/rpmsg.h              |  10 ++
 8 files changed, 343 insertions(+)
 create mode 100644 Documentation/serial/tty_rpmsg.rst
 create mode 100644 drivers/tty/rpmsg_tty.c

-- 
2.17.1

