Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8294FC4361B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 11 Dec 2020 20:35:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21FDE2404C
	for <linux-remoteproc@archiver.kernel.org>; Fri, 11 Dec 2020 20:35:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392302AbgLKSto (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 11 Dec 2020 13:49:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391150AbgLKStD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 11 Dec 2020 13:49:03 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02943C0613D6
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Dec 2020 10:48:31 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id o17so11790334lfg.4
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Dec 2020 10:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wMhTDsg70Yk7T7X6CYibQwNaCnRI/oxGvYkjMkZKbJ8=;
        b=DaV9D4/FqG17M7EXWFR471nJTqUGOj/F0eo2+aMEbbmv7/mnjFvgixtxEqLl/b23d4
         O2IlW6ZhoQONLWTJ8k1wOY4zK65HJtMseKh1kpVibf717YL8HbFlzKSBf0mlTxAp7RKK
         EzZ5hj46G8ji1+RXN1oxW2x4RBZ/X7Lbram9oczoFknjgoC6StoYT2WWzN6183uHYx4s
         LLpTW284FQweuL5ejqIV1ySICnkIQijrk69ZOO4afvjn5IU95dVXmTDYThprbkPjXM9u
         vJgYWx7t547yjdC8cczuR/+UUGudsCut2rvADOZqlO3HLsYLA0SBgFbIy6pVMGIrOPPF
         YT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wMhTDsg70Yk7T7X6CYibQwNaCnRI/oxGvYkjMkZKbJ8=;
        b=PzI7nOs1A6RiEgmLyZtZo9HrXlgQV5BrwqC3SWJXB/GiUXI/RZ9KSk7nXsRleCAE+C
         caoWayDc2znViIfYW+n91SfpTKS3MRiEQRJ18JqQH9KmgBJkZKDGRfnix0FSJrHdonL2
         d3XyECc399YRZpqJ/ZzOQfP3Hw2DPA6r1PNTSjU/OeOrOQY/JSy9QfSBPLyBpWrTCDjn
         IUTwO/aGcfJ6dHd24iIfNMtgWdKAKgKTzsLVv2dfIZK+/sdQEpZhRBbwFxi9oamUTi+t
         Lw/pD2COsiSTxfbMaN2AZsGRrYq2AiFBXbN5XfqLSzQqOR5u4sHT73bf3MHiC9bHlPn+
         cb9Q==
X-Gm-Message-State: AOAM530jGyqliKsHBNLmgPOmgc39SNONQcwt+PmAcmiQIOP5er0ZtOQt
        IFu/dl5vua7GQB9FlA6HxeftTg==
X-Google-Smtp-Source: ABdhPJyXFvqmtAUTFC39BmGoE8MlvIHW8Q/xrmxlfynKVkXQdXT50P0xShNduRwJpeJYrg/XhQxZsg==
X-Received: by 2002:ac2:4ecd:: with SMTP id p13mr5541265lfr.430.1607712509514;
        Fri, 11 Dec 2020 10:48:29 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id b12sm903316lfb.139.2020.12.11.10.48.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Dec 2020 10:48:28 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ssantosh@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, santosh.shilimkar@oracle.com,
        lee.jones@linaro.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        praneeth@ti.com, tony@atomide.com,
        linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org
Subject: [PATCH 0/6] Introduce PRU platform consumer API
Date:   Fri, 11 Dec 2020 19:48:05 +0100
Message-Id: <20201211184811.6490-1-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi All,

The Programmable Real-Time Unit and Industrial Communication Subsystem (PRU-ICSS
or simply PRUSS) on various TI SoCs consists of dual 32-bit RISC cores
(Programmable Real-Time Units, or PRUs) for program execution.

There are 3 foundation components for TI PRUSS subsystem: the PRUSS platform
driver, the PRUSS INTC driver and the PRUSS remoteproc driver. Two first were
already merged and can be found under:
1) drivers/soc/ti/pruss.c
   Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
2) drivers/irqchip/irq-pruss-intc.c
   Documentation/devicetree/bindings/interrupt-controller/ti,pruss-intc.yaml

The third one [1] was accepted and applied to andersson/remoteproc.git
(refs/heads/for-next): [2] but is not merged yet.

The programmable nature of the PRUs provide flexibility to implement custom
peripheral interfaces, fast real-time responses, or specialized data handling.
Example of a PRU consumer drivers will be:
  - Software UART over PRUSS
  - PRU-ICSS Ethernet EMAC

In order to make usage of common PRU resources and allow the consumer drivers to
configure the PRU hardware for specific usage the PRU API is introduced.

This patch set depends on "Introduce PRU remoteproc consumer API" set [3], which
is complementary to this one but goes for different, remoteproc sub-system.

[1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20201208141002.17777-1-grzegorz.jaszczyk@linaro.org/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/commit/?h=for-next&id=b44786c9bdc46eac8388843f0a6116369cb18bca
[3] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20201211142933.25784-1-grzegorz.jaszczyk@linaro.org/

Best regards,
Grzegorz

Andrew F. Davis (1):
  soc: ti: pruss: Add pruss_{request,release}_mem_region() API

Suman Anna (3):
  soc: ti: pruss: Add pruss_cfg_read()/update() API
  soc: ti: pruss: Add helper functions to set GPI mode, MII_RT_event and
    XFR
  soc: ti: pruss: Add helper function to enable OCP master ports

Tero Kristo (2):
  soc: ti: pruss: Add pruss_get()/put() API
  soc: ti: pruss: Add helper functions to get/set PRUSS_CFG_GPMUX

 drivers/soc/ti/pruss.c       | 257 ++++++++++++++++++++++++++++++++++-
 include/linux/pruss.h        | 221 ++++++++++++++++++++++++++++++
 include/linux/pruss_driver.h |  72 +++++++---
 3 files changed, 526 insertions(+), 24 deletions(-)

-- 
2.29.0

