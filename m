Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389EAC43334
	for <linux-remoteproc@archiver.kernel.org>; Mon,  6 Jun 2022 16:15:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241645AbiFFQPY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 6 Jun 2022 12:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241635AbiFFQPX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 6 Jun 2022 12:15:23 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C97A158F12
        for <linux-remoteproc@vger.kernel.org>; Mon,  6 Jun 2022 09:15:22 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id f65so3080596pgc.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Jun 2022 09:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Yc3d6f09An5Iup7HnFnq+YmtnLxXizu7JY/ZtB+fmYU=;
        b=bgidypdYCXahlWg67Jnr4ubl4uJixk0PWYtjDwcs3u5xJE0nvwIFqj7aCjjwNOiMvz
         9L9/vq/xwoEPAh3c1EVJpaJc3qB5EvVqnHlAqc+E1Pb4BoPVwJFeuuLsB8kL0Y5NYxY5
         +u50F+KOlu6kucbAAaG1q3yMKz27idq5V/1qICzsTjPfWVZ7EgTcgipFTw+mjl3KFKq8
         2b9wF1Fbx/jsinj/hE1XcHEW/SqkDw70ZLHnxeAdO5eDdR0DGd3QG5Fbou9J33AI8mrX
         sDURBwJYta4klrPdDpA4c/LylywEHj9RIBnVv6TKLt4/rgbZq5Qbgx0ciWFgtDIW81D3
         Ykrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Yc3d6f09An5Iup7HnFnq+YmtnLxXizu7JY/ZtB+fmYU=;
        b=5xortFYpbSjTuIZgkDryPq6OPDYH30xiPgsXBj35yDr/rRzxZRUA/iqCMlOwdFrsir
         FCwLmsJCzvNPEGnR0PwkfxWWB/gvZQyQWFxX6lWNvvWlbvg5EfsHgIcg1ydTvu7CUtV5
         NAD+PPsE9UsjUGIs9eNX0j1poYHCPjdrIPt1c8i6fnB2jiujcsNhGhTLbhVm9gSwa8iL
         +7WgrIYLPhPG1NQ7u/T1bGIg/tP3NOg9DB6F8pLReQZfq7l+6+VxClLWIW99uM85qpOg
         9KFHJ+ym2oCGPDA2Fq7DByff7olHAeaZXyaEcA1Hah8XAQuemNlgmsTU97IDDkaeaWuW
         +qbw==
X-Gm-Message-State: AOAM5303RmayyNmqTHekJNY0L7d43jttd/z5gIgzeHv7T4ufBSTtEltD
        cauM//wenghcUV6JMhDNKRfi5A==
X-Google-Smtp-Source: ABdhPJymBlKeJCj3tvmSxgMQ8W96PwRXnOWJMPIgOzJN40d5L4tl9aO20Ei3Hqzfn1EToQYphbdpOg==
X-Received: by 2002:a63:e905:0:b0:3fa:ec8c:9013 with SMTP id i5-20020a63e905000000b003faec8c9013mr21525731pgh.599.1654532121881;
        Mon, 06 Jun 2022 09:15:21 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id s4-20020aa78d44000000b0051c179895a0sm2547571pfe.212.2022.06.06.09.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 09:15:20 -0700 (PDT)
Date:   Mon, 6 Jun 2022 10:15:18 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Puranjay Mohan <p-mohan@ti.com>
Cc:     linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        nm@ti.com, ssantosh@kernel.org, s-anna@ti.com,
        linux-arm-kernel@lists.infradead.org, rogerq@kernel.org,
        grygorii.strashko@ti.com, vigneshr@ti.com, kishon@ti.com,
        robh@kernel.org
Subject: Re: [PATCH v4 0/6] Introduce PRU remoteproc consumer API
Message-ID: <20220606161518.GB809345@p14s>
References: <20220603121520.13730-1-p-mohan@ti.com>
 <20220606155612.GA809345@p14s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606155612.GA809345@p14s>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jun 06, 2022 at 09:56:12AM -0600, Mathieu Poirier wrote:
> I have started to review this set, comments will come over the next few days.  I
> will clearly inform you when I am done reviewing.

This patch is giving me several checkpatch warnings that should have been caught
before sending the patches out to the mailing list.  As such I will not review
this work and seriously considering adding your next revision at the very bottom
of my queue.

> 
> Thanks,
> Mathieu
> 
> On Fri, Jun 03, 2022 at 05:45:14PM +0530, Puranjay Mohan wrote:
> > This is the v4 of the patch series [1]. The v3 had some comments
> > on the DT patch that have been addressed here. The 6th patch in this
> > series was missed in the previous versions, so, it has been added now.
> > 
> > I have posted two more patch series that depend on this series, one to
> > the soc tree and another to the networking tree. I had sent all the 3
> > series, including this one as RFC [2] to get comments and to explain the
> > dependencies.
> > 
> > The Programmable Real-Time Unit and Industrial Communication Subsystem
> > (PRU-ICSS or simply PRUSS) on various TI SoCs consists of dual 32-bit
> > RISC cores (Programmable Real-Time Units, or PRUs) for program execution.
> > 
> > There are 3 foundation components for PRUSS subsystem: the PRUSS platform
> > driver, the PRUSS INTC driver and the PRUSS remoteproc driver. All were
> > already merged and can be found under:
> > 1) drivers/soc/ti/pruss.c
> >    Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
> > 2) drivers/irqchip/irq-pruss-intc.c
> >    Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml
> > 3) drivers/remoteproc/pru_rproc.c
> >    Documentation/devicetree/bindings/remoteproc/ti,pru-rproc.yaml
> > 
> > The programmable nature of the PRUs provide flexibility to implement custom
> > peripheral interfaces, fast real-time responses, or specialized data handling.
> > Example of a PRU consumer drivers will be:
> >   - Software UART over PRUSS
> >   - PRU-ICSS Ethernet EMAC
> > 
> > In order to make usage of common PRU resources and allow the consumer drivers to
> > configure the PRU hardware for specific usage the PRU API is introduced.
> > 
> > [1] https://patchwork.kernel.org/project/linux-remoteproc/cover/20220418104118.12878-1-p-mohan@ti.com/
> > [2] https://patchwork.kernel.org/project/linux-remoteproc/cover/20220406094358.7895-1-p-mohan@ti.com/
> > 
> > Thanks and Regards,
> > Puranjay Mohan
> > 
> > Roger Quadros (1):
> >   remoteproc: pru: Add pru_rproc_set_ctable() function
> > 
> > Suman Anna (2):
> >   dt-bindings: remoteproc: Add PRU consumer bindings
> >   remoteproc: pru: Make sysfs entries read-only for PRU client driven
> >     boots
> > 
> > Tero Kristo (3):
> >   remoteproc: pru: Add APIs to get and put the PRU cores
> >   remoteproc: pru: Configure firmware based on client setup
> >   remoteproc: pru: add support for configuring GPMUX based on client
> >     setup
> > 
> >  .../bindings/remoteproc/ti,pru-consumer.yaml  |  69 +++++
> >  drivers/remoteproc/pru_rproc.c                | 254 +++++++++++++++++-
> >  include/linux/pruss.h                         |  78 ++++++
> >  3 files changed, 396 insertions(+), 5 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> >  create mode 100644 include/linux/pruss.h
> > 
> > -- 
> > 2.17.1
> > 
