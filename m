Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8BFC433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Oct 2021 15:36:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6209F60FD7
	for <linux-remoteproc@archiver.kernel.org>; Fri,  8 Oct 2021 15:36:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243022AbhJHPhz (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 8 Oct 2021 11:37:55 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:37166 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231129AbhJHPhy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Oct 2021 11:37:54 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1989fqnV023368;
        Fri, 8 Oct 2021 17:35:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=QmQxNQufiV2GsuHqMFZOe4B4PMKFaz6wLa6CZ7V7C+s=;
 b=hSODOskKfdFbXZ8C0dDucIejQii9ipzIXg/DOTtsuS/il3p54JqBsND9ntlJRZ3DKdca
 uqx3zVfc9LyvzfzwHf09n+Rr4u5r7xwlFXqlraqGVv/mOE1X3VnwA0KYHJ/h3NnNmg5F
 /Uoi3OlZ6KU8XV52YgFYocUASDO1+9BCDgEP2om9l7eS/9lHq4K27vvkDpEF5myVDGmg
 bBEQOhor6UeJRxCxSNc6EciGAwWSmFbdybMQ5qj5zkMSgUbIFQxlH+qh29dq/PdoyCoM
 u7nuETV4CMQ8otVgfUsOhv/IF3xmP034cg6tikO1rcHPzDu/6kZnXrtp9NblbsliDo1o +Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bjkk79wja-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Oct 2021 17:35:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 05B5410002A;
        Fri,  8 Oct 2021 17:35:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC5AD237D9A;
        Fri,  8 Oct 2021 17:35:43 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct 2021 17:35:43
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
Subject: [PATCH v9 0/2] Add rpmsg tty driver
Date:   Fri, 8 Oct 2021 17:34:44 +0200
Message-ID: <20211008153446.23188-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_04,2021-10-07_02,2020-04-07_01
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

Update previous revision [1] based on Bjorn Andersson and Greg Kroah-Hartman comments.

Applied and tested on kernel V5.15-rc1

[1] https://lkml.org/lkml/2021/9/30/792 

Arnaud Pouliquen (2):
  rpmsg: core: add API to get MTU
  tty: add rpmsg driver

 drivers/rpmsg/rpmsg_core.c       |  21 +++
 drivers/rpmsg/rpmsg_internal.h   |   2 +
 drivers/rpmsg/virtio_rpmsg_bus.c |  10 ++
 drivers/tty/Kconfig              |  12 ++
 drivers/tty/Makefile             |   1 +
 drivers/tty/rpmsg_tty.c          | 275 +++++++++++++++++++++++++++++++
 include/linux/rpmsg.h            |  10 ++
 7 files changed, 331 insertions(+)
 create mode 100644 drivers/tty/rpmsg_tty.c

-- 
2.17.1

