Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D914C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 Oct 2021 10:12:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61A0061A58
	for <linux-remoteproc@archiver.kernel.org>; Fri,  1 Oct 2021 10:12:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbhJAKOg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 1 Oct 2021 06:14:36 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:45660 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353235AbhJAKOf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 1 Oct 2021 06:14:35 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19187LnB030509;
        Fri, 1 Oct 2021 12:12:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=/LjfXOmKXk+IaitYDOXv8APKqHjvEbNKq7xnKRqVamg=;
 b=hsZe6d0YU8hqw710UUVLzsYb3ReGh7pfXKxiY5eOnjOk8JNj+Zsp6OyLfCUlXWRLSgG4
 TapsD0E7XgiL789Jh40QyAyk8DBU+tgK2qgLt8taYnMSf5CFEYmXi/7shMPA5kv7LBYi
 dyo7PE4XCOWJTJCGhCPdnMQ8Nzh4Tks8+MGeduSkAtGNCJSPkrXxFbUmczxTkwjsu9aY
 keW6o1tm74qeG9OsHme2PGbkDYC3cBKVur4Dap7OpWoTFjQ83jLh8lMPLIEvkDImR31z
 P2lRqBu2GjoxXOzsN/5+b7oJlrgS0lPYm+yUBMQEdSSjCULtfp22fNkIswNaENVAlR6H Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bds9njb4t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 01 Oct 2021 12:12:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 01A6410002A;
        Fri,  1 Oct 2021 12:12:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E657F226FDD;
        Fri,  1 Oct 2021 12:12:43 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 1 Oct 2021 12:12:43
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Bruce Ashfield <bruce.ashfield@xilinx.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [RFC PATCH 0/7] remoteproc: restructure the remoteproc VirtIO device
Date:   Fri, 1 Oct 2021 12:12:27 +0200
Message-ID: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-01_01,2021-09-30_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This series is a part of the work initiate a long time ago in 
the series "remoteproc: Decorelate virtio from core"[1]


Objective of the work:
- Update the remoteproc VirtIO device creation (use platform device)
- Allow to declare remoteproc VirtIO device in DT
    - declare resources associated to a remote proc VirtIO
    - declare a list of VirtIO supported by the platform.
- Prepare the enhancement to more VirtIO devices (e.g audio, video, ...)
- Keep the legacy working!
- Try to improve the picture about concerns reported by Christoph Hellwing [2][3]

[1] https://lkml.org/lkml/2020/4/16/1817
[2] https://lkml.org/lkml/2021/6/23/607
[3] https://patchwork.kernel.org/project/linux-remoteproc/patch/AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch/

In term of device tree this would result in such hiearchy (stm32mp1 example with 2 virtio RPMSG):

	m4_rproc: m4@10000000 {
		compatible = "st,stm32mp1-m4";
		reg = <0x10000000 0x40000>,
		      <0x30000000 0x40000>,
		      <0x38000000 0x10000>;
        memory-region = <&retram>, <&mcuram>,<&mcuram2>;
        mboxes = <&ipcc 2>, <&ipcc 3>;
        mbox-names = "shutdown", "detach";
        status = "okay";

        #address-cells = <1>;
        #size-cells = <0>;
        
        vdev@0 {
		compatible = "rproc-virtio";
		reg = <0>;
		virtio,id = <7>;  /* RPMSG */
		memory-region = <&vdev0vring0>, <&vdev0vring1>, <&vdev0buffer>;
		mboxes = <&ipcc 0>, <&ipcc 1>;
		mbox-names = "vq0", "vq1";
		status = "okay";
        };

        vdev@1 {
		compatible = "rproc-virtio";
		reg = <1>;
		virtio,id = <7>;  /*RPMSG */
		memory-region = <&vdev1vring0>, <&vdev1vring1>, <&vdev1buffer>;
		mboxes = <&ipcc 4>, <&ipcc 5>;
		mbox-names = "vq0", "vq1";
		status = "okay";
        };
};

I have divided the work in 4 steps to simplify the review, This series implements only
the step 1:
step 1:  redefine the remoteproc VirtIO device as a platform device
  - migrate rvdev management in remoteproc virtio.c,
  - create a remotproc virtio config ( can be disabled for platform that not use VirtIO IPC.
step 2: add possibility to declare and prob a VirtIO sub node
  - VirtIO bindings declaration,
  - multi DT VirtIO devices support,
  - introduction of a remote proc virtio bind device mechanism ,
=> https://github.com/arnopo/linux/commits/step2-virtio-in-DT
step 3: Add memory declaration in VirtIO subnode
=> https://github.com/arnopo/linux/commits/step3-virtio-memories
step 4: Add mailbox declaration in VirtIO subnode
=> https://github.com/arnopo/linux/commits/step4-virtio-mailboxes

Arnaud Pouliquen (7):
  remoteproc: core: Introduce virtio device add/remove functions
  remoteproc: Move rvdev management in rproc_virtio
  remoteproc: Remove vdev_to_rvdev and vdev_to_rproc from remoteproc API
  remoteproc: create the REMOTEPROC_VIRTIO config
  remoteproc: virtio: Create platform device for the remoteproc_virtio
  remoteproc: virtio: Add helper to create platform device
  remoteproc: Instantiate the new remoteproc virtio platform device

 drivers/remoteproc/Kconfig               |  11 +-
 drivers/remoteproc/Makefile              |   2 +-
 drivers/remoteproc/remoteproc_core.c     | 142 +++-------------
 drivers/remoteproc/remoteproc_internal.h |  52 +++++-
 drivers/remoteproc/remoteproc_virtio.c   | 207 +++++++++++++++++++++--
 include/linux/remoteproc.h               |  18 +-
 6 files changed, 282 insertions(+), 150 deletions(-)

-- 
2.17.1

