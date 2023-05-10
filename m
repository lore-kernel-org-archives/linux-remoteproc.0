Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF903C77B7D
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 May 2023 13:06:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236415AbjEJNGa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 May 2023 09:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236355AbjEJNG2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 May 2023 09:06:28 -0400
X-Greylist: delayed 84237 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 10 May 2023 06:06:27 PDT
Received: from mail.maurer.systems (mail.maurer.systems [91.250.87.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C696E4C
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 May 2023 06:06:27 -0700 (PDT)
Received: from [192.168.253.174] (mob-194-230-158-211.cgn.sunrise.net [194.230.158.211])
        by mail.maurer.systems (Postfix) with ESMTPSA id B32222399DCE
        for <linux-remoteproc@vger.kernel.org>; Wed, 10 May 2023 15:06:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=maurer.systems;
        s=mail; t=1683723983;
        bh=ijj0MWZLzsHdXxXUrUasOSVU2jtOIEfKY/31VarqLo4=;
        h=Date:Subject:References:To:From:In-Reply-To:From;
        b=XB1jlPOT4bTNmlIyEkyJ9d1iA2SWYSi6ATYDqYVEIUOsdOjd31X825Y8J2YyxN2Ft
         +1XQA8LqN4dMT/fjl28NBtyxPSZCM89LiBc+PQ1qsNGKTry7qXY0RxZdYdHK94+J1+
         UaONTRWXcSjjnUGnSmwy4atUyBJNc5d3Ckr8Oqug=
Message-ID: <8a49666b-4509-1210-f8d5-fffd0a4cf855@maurer.systems>
Date:   Wed, 10 May 2023 15:06:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: remoteproc over PCIe
Content-Language: en-US
References: <72ff39f1-b966-a089-0f3c-9216d8a38e77@maurer.systems>
 <86dc39b0-61bf-5e83-e65d-1283fdf382b4@foss.st.com>
To:     linux-remoteproc@vger.kernel.org
From:   Simon Maurer <mail@maurer.systems>
In-Reply-To: <86dc39b0-61bf-5e83-e65d-1283fdf382b4@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Arnaud,

Thank you for your response.

On 5/9/23 19:08, Arnaud POULIQUEN wrote:
> Hi Simon,
> 
> On 5/9/23 15:42, Simon Maurer wrote:
>> Hi,
>> I've got a "Zynq PCIe FMC Carrier Evaluation Board" with a x86 host. The Zynq
>> 7000 is an FPGA with 2x Cortex-A9, on which ZephyrOS with the OpenAMP framework
>> is running. The VirtIO ring and the buffer for the RPMSGs are located in the
>> nocache memory section of the ZephyrOS. The card DDR-RAM and the CPU control
>> registers are mapped into PCIe BARs. On the FPGA the "AXI Memory Mapped To PCI
>> Express" IP core is used, so the kernel has mmio access to the card DDR-RAM.
>> Besides the kernel module, I had to do a few modifications elsewhere in the
>> kernel. In remoteproc_virtio.c I implemented the get_shm_region function for the
>> rproc_virtio_config_ops. This gives access to the rpmsg buffer, that is already
>> mapped.
> 
> + christopher Hellwig.
> 
> Nice proposal!
> 
> I've also had the same approach in mind for a while, to remove the use of
> dma_declare_coherent_memory in remoteproc_virtio[1][2].
> But I haven't found the time to implement it yet.
> 
> [1] https://lkml.org/lkml/2021/6/23/607
> [2]
> https://patchwork.kernel.org/project/linux-remoteproc/patch/AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch/
> 
> It would be nice to ensure same approach for the different virtio
> backend (remoteproc_virtio, virtio_mmio, ...) to be able to reuse the virtio
> drivers on top of.
> 
> The virtio_mmio seems the reference...
> 
>> In virtio_rpmsg_bus.c this function is used instead of allocating a new
>> region.
> 
> The DT seems to me a valid place to define memory regions associated.
> It can be one for vrings and buffers, or one unique pool.
> One reason is that the main processor can have to specify the memory mapping
> and to specify associated access right.
> 

I created a section in the linker script for ZephyrOS that is reserved 
for the host. The kernel module parses the ELF file and creates the 
vrings and the buffers in it. There is no device tree on my x86 host, 
there is just BIOS and ACPI magic.

>> This is just a proof of concept, but it seems to be working, ttyRPMSG is
>> created and I can send and receive messages.
> 
> Great!
> 
>> But what would be the clean way to do this? I'm thinking about implementing
>> dma_map_ops for the vdev, but maybe there is a better solution?
> 
> Good question...I don't have the answer.
> I have implemented something different but not fully satisfied. For instance how
> to manage the remoteproc address (DA) and CPU address(PA) conversion for vring
> descriptor?
> 
I forgot to mention this, the PA address (host) of the shared memory is 
written to a variable in the shared memory, so ZephyrOS/OpenAMP can 
translate back the buffer addresses to DA. But this is a hack I would 
really like to get rid of. This would be the reason for the dma_map_ops 
implementation, so the driver on the host has full control what 
addresses the vring writes into the descriptors.

> You can have a look to the work I started, described in the cover letter[3]] with
> links to my github for the code source.
> I have only up-streamed the step 1 yet.
> We have some discussions in the OpenAMP project to reuse the virtio MMIO. So I
> put on hold waiting more clues.
> 
> [3]https://www.spinics.net/lists/linux-remoteproc/msg13680.html
> 
>

Thanks, I will take a look at it.

Best Regards
Simon
