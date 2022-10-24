Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96470C67871
	for <linux-remoteproc@archiver.kernel.org>; Mon, 24 Oct 2022 19:33:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233260AbiJXTdX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 24 Oct 2022 15:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233259AbiJXTdF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 24 Oct 2022 15:33:05 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7C2ADFC27
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Oct 2022 11:03:33 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id h4so8642994vsr.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Oct 2022 11:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pja81Rhvf+nc30IgGNzM8/t/SC1TJPZW1TXOrzNAkS8=;
        b=qTJiWOwtCxymrtgegTu8qvv9CQdcqJAnAFOAwO7MQXk/GJaub7uJ/Eo9q0C48PrnUu
         MP1ShQyQApNeVovj42GXJkeeh9mmItsIVuPzDTI+LHQ5WRp6ygqy9areYbnXiLM3SGSt
         p+M6IUYlNMaExbgkJQuay/n9YOqKV6WFhB3LE/DHQMMT5CAPrrqNeqhnUkJmrcDPrtZ1
         TeRE6P2w9J2z7wd55BWM/8Awft62HD7Bx3ERnWveVIDnFrXRrgCHS4PFrFhe4cgCVXTZ
         yQLdVet5mUrGLpG3cE6+4IwzzqcS+CYMaAbTIp4yUFB5oGmS1Kyb+/7sWyhx1VvAWJQy
         fySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pja81Rhvf+nc30IgGNzM8/t/SC1TJPZW1TXOrzNAkS8=;
        b=RnQ1h6xzNpod0pVoJWUIeBtqDib8FJC5iajUy1oW3EuYGcMy3JFChr7fjqNbjcxj3m
         6Jhf8XxHllWTDD/HpORAb4PlzsWyZ+C4G09/jBAiMonSEM09AKPR5jNFwc7SXiHAjFnJ
         oCE9OIkP8I9lMyItdiXPhp9CREJzcS1Hl4VL4HVWuQejHpwCBqey0kxvz3TwhFQiJ6xb
         KxP3woXUC+nCWVlVChce28fy+Kv0op5O5JFJhkTFQnY9+Ae6RmNQtM98/G3GhntIDiMe
         e4Rur09IFoHxD+0jFhrMBuXpCc99xlEd8aRueDfV1wS8lA6Mjcr95fwTvv3rOJHu+wao
         tgEA==
X-Gm-Message-State: ACrzQf3EG6quWUJPd8NtxQOibLB3tGifw6ExIKhH7N31CV9s0w3prVsR
        Ii5oiDm45kTcs1jsmRL+7UogFVs6cM3d6A==
X-Google-Smtp-Source: AMsMyM7eLs7/zR87TlE5CHm/Vgtm5DIknIDhVY1qdoVER2IP3IgEtQwxxU6jlkqJcxhX1/uU6N02qQ==
X-Received: by 2002:a17:902:bf46:b0:179:eba5:90ba with SMTP id u6-20020a170902bf4600b00179eba590bamr34424895pls.16.1666629540969;
        Mon, 24 Oct 2022 09:39:00 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id g5-20020a170902e38500b0017ca9f4d22fsm6103522ple.209.2022.10.24.09.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 09:38:59 -0700 (PDT)
Date:   Mon, 24 Oct 2022 10:38:58 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Daniel Kestrel <kestrelseventyfour@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] Add support for WASP SoC on AVM router boards
Message-ID: <20221024163858.GB626419@p14s>
References: <20220804210806.4053-1-kestrelseventyfour@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804210806.4053-1-kestrelseventyfour@gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Daniel,

I have started to review this patchset.  I expect the process to take several
days and will clearly let you know when I am done.

Thanks,
Mathieu

On Thu, Aug 04, 2022 at 11:08:03PM +0200, Daniel Kestrel wrote:
> There is a popular set of Lantiq xrx200 router boards by AVM in
> Germany (AVM Fritzbox 3390, 3490, 5490, 5491 and 7490) which
> have the strange implementation of having the wifi cards
> connected to a separate memory only ATH79 based SoC. It has no
> persistent storage and no access to any resource on the Lantiq
> host, but is connect to the Lantiq GSWIP switch on an additional
> fixed internal network port.
> This kernel module is to support booting the secondary SoC called
> Wireless Assistant Support Processor (WASP).
> After turning it on, a small network boot firmware is sent to
> the SoC by using mdio and when it is started, an initramfs
> linux image is sent to the SoC using raw ethernet frames.
> 
> The whole procedure takes about 6 seconds, if there is no error.
> So far tested on 3490, 5490 and 7490 devices based on OpenWrt, 3390
> takes about 20 seconds.
> 
> Patch 1/3 adds the vendor name
> Patch 2/3 adds the dt-bindings
> Patch 3/3 adds the remoteproc driver
> 
> To build and run, there is OpenWrt PR 5075.
> 
> Please review.
> 
> Changes in v5:
>   - Replace names for properties and descriptions as requested in the
>     device tree documentation and change the driver to accept them
>   - Change example in the device tree documentation
>   - Restructure constants and defines in the beginning of the driver
>     source for better readability
>   - Combine m_start_addr and m_exec_addr into a single constant and
>     change avm_wasp_netboot_write_header to use only this one constant
>   - Change variable startup_gpio to power_gpio in driver
> 
> Changes in v4:
>   - Fix compiler warnings with W=2 option
> 
> Changes in v3:
>   - Replace generic avm,fritzboxx490-wasp with actual device names for
>     device tree documentation and change the driver to accept them
>   - Add maxItems to device tree documentation
>   - Change example in the device tree documentation
>   - Fix wait time to make the Wasp upload work for 3390 more reliable
>   - Enable the SOC on driver load, use reset instead of disable/enable
>     while driver is loaded and disable on unloading the driver
>   - Change some messages printed to adhere to standards (e.g. remove !)
> 
> Changes in v2:
>   - Remove firmware names from dt-binding and add as kmod parameters
>   - Rename other bindings with vender prefix and fix gpios suffix
>   - Change descriptions in dt-binding
>   - Replace/Remove asynch load of firmware with request_firmware_direct
>   - Fix comments to use the errno define instead of the number
>   - Implement wait loops with read_poll_timeout() macro
>   - Wrap read_poll_timeout() macro in function saving 6k module size
>   - Return -ETIMEDOUT for all errors returned by read_poll_timeout
>   - Replace mdio writes/reads with mdiobus_write and mdiobus_read and add
>     return codes and their handling
>   - Remove mutex for mdiobus_lock and add return code checking for mdio ops
>   - Replaced the mdio register array with directly specifying registers
>   - As a result of the previous 3 changes remove the functions for mdio
>   - Consolidate error messages for mdio writes into a single one saved 1k
>     for module size
>   - Replaced mdelay with usleep_range saved 0,7k module size
>   - Remove unneeded include <linux/interrupt.h> and <linux/error.h>
>   - Wrap all blocks with {} and fix some indentation errors
>   - Change const len in to size_t in avm_wasp_netboot_write_chunk
>   - Make all methods static to fix kernel bot warning
>   - Change read variable name in avm_wasp_load_initramfs_image
>   - Change ssize_t variables to size_t in avm_wasp_load_initramfs_image
>   - avm_wasp_netboot_write_chunk change for loop for 2 byte divisibility
>   - Change uint32_t to u32
>   - Change int count = -1 to u32 with U32_MAX initialisation
>   - Add check for firmware len divisable by 4
>   - Replace big endian bit shift operations with be32_to_cpu
>   - Change loop to write 14 byte firmware chuncks like suggested
>   - Change WASP_CHUNK_SIZE to ARRAY_SIZE(mac_data) for readability
>   - Change int done to boolean
>   - Change unsigned ints to u32
>   - Change int to size_t for send_len
>   - Use int for numbytes because kernel_recvmsg returns error or number
>   - Two sockets are not needed, so reduce to one socket usage
>   - Remove struct timeval definition, replace with __kernel_old_timeval
>   - __kernel_old_timeval is depracated, but arch mips is 32bit platform
>   - Replace &avmwasp->pdev->dev with local dev
>   - Check if wasp network interface is up and fail if not in start method
>   - Remove setsockopt for SO_REUSEADDR and SO_BINDTODEVICE
>   - Remove packet_counter
>   - Move firmware and firmware_end out of RESP_DISCOVER to make sure that
>     they are initialized if RESP_DISCOVER is not happening first
>   - indend break;
>   - Move second half of the send/receive paket while loop to RESP_OK and
>     let RESP_DISCOVER fall through
>   - Remove bringing up the wasp network interface
>   - Check if wasp network interface is up in probe and defer if not
>   - Remove the check for the root device and replace it with match data
>     for WASP device identification
>   - Move of_read and find of mdio bus to rproc_start but delete reference
>     after using it in the rproc_start method
>   - Replace dev_set_drvdata with platform_set_drvdata
>   - Remove avm_wasp_rproc_boot_addr because its not needed and move
>     setting the fw struct pointer to avm_wasp_rproc_load
>   - Move avm_wasp.h definitions to kernel module
> 
> Reported-by: kernel test robot <lkp@intel.com>
> 
> Daniel Kestrel (3):
>   dt-bindings: vendor-prefixes: Add AVM
>   dt-bindings: remoteproc: Add AVM WASP
>   remoteproc: Add AVM WASP driver
> 
>  .../bindings/remoteproc/avm,wasp-rproc.yaml   |   61 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
>  drivers/remoteproc/Kconfig                    |   10 +
>  drivers/remoteproc/Makefile                   |    1 +
>  drivers/remoteproc/avm_wasp.c                 | 1051 +++++++++++++++++
>  5 files changed, 1125 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/avm,wasp-rproc.yaml
>  create mode 100644 drivers/remoteproc/avm_wasp.c
> 
> -- 
> 2.17.1
> 
