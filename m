Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36236C77B7C
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 May 2023 18:05:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjEISFy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 9 May 2023 14:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234795AbjEISFw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 May 2023 14:05:52 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5071E49F8
        for <linux-remoteproc@vger.kernel.org>; Tue,  9 May 2023 11:05:44 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 349GtqNJ019223;
        Tue, 9 May 2023 19:08:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=2FIYxZ7KjQ1GWn+MIOnGaA6m9oVE7UHzsGo2/bEkyZs=;
 b=k9j0JpX8ziwIoUwM1UfEEsGLKZd3VC/lDGy00giQwk+bprwJJQYT1sXM1Uo/AlO+vc1N
 4/8PJAWjPerHL3k+rXqElYePgyDyzCaJf9XLoOp6feZXfvZYjJMxqcOC0akc4HapdaMo
 Ak7Ycohy8+7e3Jv+rFkHbLnQVhmJH/X2ycF+uutLYvFD7C6gY0N74gw2H2BCY2CRNdQE
 HY8eMlnCP3uw4RqK9gcT2jPyrRCUHHvtrurBJ2f+xjiEisWcKt8i4toBRLHEVf5dRVIk
 wkC7j9O+4tCG4t498ZNIC+0xbZeGcst8/mG62AeBA1JGQOFhjG6OuX1JP6RK80X2e5Uk RQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qf790phcn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 May 2023 19:08:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3DBA110002A;
        Tue,  9 May 2023 19:08:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 29C102309FE;
        Tue,  9 May 2023 19:08:30 +0200 (CEST)
Received: from [10.252.28.195] (10.252.28.195) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 9 May
 2023 19:08:27 +0200
Message-ID: <86dc39b0-61bf-5e83-e65d-1283fdf382b4@foss.st.com>
Date:   Tue, 9 May 2023 19:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: remoteproc over PCIe
Content-Language: en-US
To:     Simon Maurer <mail@maurer.systems>,
        <linux-remoteproc@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
References: <72ff39f1-b966-a089-0f3c-9216d8a38e77@maurer.systems>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <72ff39f1-b966-a089-0f3c-9216d8a38e77@maurer.systems>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.28.195]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_10,2023-05-05_01,2023-02-09_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Simon,

On 5/9/23 15:42, Simon Maurer wrote:
> Hi,
> I've got a "Zynq PCIe FMC Carrier Evaluation Board" with a x86 host. The Zynq
> 7000 is an FPGA with 2x Cortex-A9, on which ZephyrOS with the OpenAMP framework
> is running. The VirtIO ring and the buffer for the RPMSGs are located in the
> nocache memory section of the ZephyrOS. The card DDR-RAM and the CPU control
> registers are mapped into PCIe BARs. On the FPGA the "AXI Memory Mapped To PCI
> Express" IP core is used, so the kernel has mmio access to the card DDR-RAM.
> Besides the kernel module, I had to do a few modifications elsewhere in the
> kernel. In remoteproc_virtio.c I implemented the get_shm_region function for the
> rproc_virtio_config_ops. This gives access to the rpmsg buffer, that is already
> mapped. 

+ christopher Hellwig.

Nice proposal!

I've also had the same approach in mind for a while, to remove the use of
dma_declare_coherent_memory in remoteproc_virtio[1][2].
But I haven't found the time to implement it yet.

[1] https://lkml.org/lkml/2021/6/23/607
[2]
https://patchwork.kernel.org/project/linux-remoteproc/patch/AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch/

It would be nice to ensure same approach for the different virtio
backend (remoteproc_virtio, virtio_mmio, ...) to be able to reuse the virtio
drivers on top of.

The virtio_mmio seems the reference...

> In virtio_rpmsg_bus.c this function is used instead of allocating a new
> region.

The DT seems to me a valid place to define memory regions associated.
It can be one for vrings and buffers, or one unique pool.
One reason is that the main processor can have to specify the memory mapping
and to specify associated access right.

> This is just a proof of concept, but it seems to be working, ttyRPMSG is
> created and I can send and receive messages.

Great!

> But what would be the clean way to do this? I'm thinking about implementing
> dma_map_ops for the vdev, but maybe there is a better solution?

Good question...I don't have the answer.
I have implemented something different but not fully satisfied. For instance how
to manage the remoteproc address (DA) and CPU address(PA) conversion for vring
descriptor?

You can have a look to the work I started, described in the cover letter[3]] with
links to my github for the code source.
I have only up-streamed the step 1 yet.
We have some discussions in the OpenAMP project to reuse the virtio MMIO. So I
put on hold waiting more clues.

[3]https://www.spinics.net/lists/linux-remoteproc/msg13680.html

Regards,
Arnaud

> 
> Best regards,
> Simon
