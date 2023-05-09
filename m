Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911BDC77B7C
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 May 2023 13:52:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234641AbjEINwT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 9 May 2023 09:52:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234919AbjEINwT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 May 2023 09:52:19 -0400
X-Greylist: delayed 587 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 09 May 2023 06:52:18 PDT
Received: from mail.maurer.systems (mail.maurer.systems [IPv6:2a01:488:67:1000:5bfa:57e6:0:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC143C33
        for <linux-remoteproc@vger.kernel.org>; Tue,  9 May 2023 06:52:18 -0700 (PDT)
Received: from [192.168.253.174] (mob-194-230-144-226.cgn.sunrise.net [194.230.144.226])
        by mail.maurer.systems (Postfix) with ESMTPSA id A9CF623983F8
        for <linux-remoteproc@vger.kernel.org>; Tue,  9 May 2023 15:42:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=maurer.systems;
        s=mail; t=1683639748;
        bh=oaa/RK5zVxe6WAJ6U58zdbgbXfqyUcUtJC2yUKFUz0c=;
        h=Date:From:Subject:To:From;
        b=joQKPunDQqkflx3h6ub3yeGJSXCsVMm9Bg1Dxi7Cc6xXkqUXrIt9jUq/cHnt61kdZ
         sUn4h1AZ8i5NFzBsKnoB4EpUyqCxuQfl5DxywMwonsM95xhFflz5NBgx6r71A1txsT
         3b4r6EsKiiXmtqiHLEWBYysQ/48ZBNR1lDGRC2AY=
Message-ID: <72ff39f1-b966-a089-0f3c-9216d8a38e77@maurer.systems>
Date:   Tue, 9 May 2023 15:42:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
From:   Simon Maurer <mail@maurer.systems>
Subject: remoteproc over PCIe
To:     linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,
I've got a "Zynq PCIe FMC Carrier Evaluation Board" with a x86 host. The 
Zynq 7000 is an FPGA with 2x Cortex-A9, on which ZephyrOS with the 
OpenAMP framework is running. The VirtIO ring and the buffer for the 
RPMSGs are located in the nocache memory section of the ZephyrOS. The 
card DDR-RAM and the CPU control registers are mapped into PCIe BARs. On 
the FPGA the "AXI Memory Mapped To PCI Express" IP core is used, so the 
kernel has mmio access to the card DDR-RAM.
Besides the kernel module, I had to do a few modifications elsewhere in 
the kernel. In remoteproc_virtio.c I implemented the get_shm_region 
function for the rproc_virtio_config_ops. This gives access to the rpmsg 
buffer, that is already mapped. In virtio_rpmsg_bus.c this function is 
used instead of allocating a new region. This is just a proof of 
concept, but it seems to be working, ttyRPMSG is created and I can send 
and receive messages.
But what would be the clean way to do this? I'm thinking about 
implementing dma_map_ops for the vdev, but maybe there is a better solution?

Best regards,
Simon
