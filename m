Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCF8C4361B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Dec 2020 17:33:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05EEC23B6B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 18 Dec 2020 17:33:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732035AbgLRRdL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 18 Dec 2020 12:33:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728056AbgLRRdL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 18 Dec 2020 12:33:11 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0392FC06138C
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Dec 2020 09:32:30 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id e2so1748689pgi.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Dec 2020 09:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0fPY+6zn3CRK+yrW/S/jc5rhwI6oFcz+6g11nN4QUqk=;
        b=X+DPUFxUuphTyYgif05i8n82F6RIxnwTf4JXGkS9hGnWQWAFLPD7Y5fsHygSK1UX6t
         cj4ZeDM6VXKPRhjJw2c44KiwUaJB/rwosxHYAahLWap0fxYqIFDpJg9xiBKbPoCO8FD2
         0iNn/LAfKrXBj5hWu6RxjZt0H7n4s06KV/hj2I+bb63HoyjfFlbD+NuUWygSlhnWqynV
         B/y2JvZClwUQyB8suxNXZAhcewXDNKUFmWnvIdEKv821HY1JVMMAVvv7x4NwurqZqLXA
         1xzc4+QxzdKRfAJA9kyf72QZvpDctJnaNEtvS4T4lARxsjS0he9WIW9kghxR3Rn1GBDN
         T+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0fPY+6zn3CRK+yrW/S/jc5rhwI6oFcz+6g11nN4QUqk=;
        b=HU/DpwDsWi5ikn5emilbi1VzrKHq6kDBC1IBn1x5Jtg2vZoWHjUb3v0+conqa5a9o2
         QjLa/itjy7f+MowxioNhkcHbBvSgCwv3gbOoOcVgtnzytq1GB4gZijxvTnHY9BK3AL6P
         s+He7Ep2tzEoQ+BzDiyyUac/XlkcpGEXkuEsnnCGytiGVGaNqzpiHCF5qL41sD6wmM3z
         ILyjWBsO/5Y2U8DU0Q7TEKLHdblKzF32zl8lN4iEUAVBpImGiav7nc/aMlBsujIVmVY8
         IQRliga55Tb6ehcT/ywpywi+qYfboeWtSZgO/kzz51D1coLKnx0rMC9Y8Rj8ypF6wjU7
         m8tg==
X-Gm-Message-State: AOAM533Ed88bPVLENZUO6jHF54eC+Xk7IBY/RmfdpTj+tbpqabFZ/qZO
        qpHiW03prHtdqgAKY2/vr7THuQ==
X-Google-Smtp-Source: ABdhPJyEi49San20wggF2PHMhE+7t1PfPlTsjiQdxh+omJKbTyHygaUcY7nupQpPU31caUpyahH/Kg==
X-Received: by 2002:a05:6a00:2384:b029:19a:eed3:7f42 with SMTP id f4-20020a056a002384b029019aeed37f42mr4976255pfc.4.1608312750240;
        Fri, 18 Dec 2020 09:32:30 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id l11sm9892957pgt.79.2020.12.18.09.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 09:32:29 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     arnaud.pouliquen@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/17] remoteproc: Add support for detaching a rproc 
Date:   Fri, 18 Dec 2020 10:32:11 -0700
Message-Id: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Following the work done here [1], this set provides support for the
remoteproc core to release resources associated with a remote processor
without having to switch it off. That way a platform driver can be removed
or the application processor power cycled while the remote processor is
still operating.

Of special interest in this series are patches 5 and 6 where getting the
address of the resource table installed by an eternal entity if moved to
the core.  This is to support scenarios where a remote process has been
booted by the core but is being detached.  To re-attach the remote
processor, the address of the resource table needs to be known at a later
time than the platform driver's probe() function.

Applies cleanly on v5.10

Thanks,
Mathieu

[1]. https://lkml.org/lkml/2020/7/14/1600

----
New for v4:
- Made binding description OS agnostic (Rob)
- Added functionality to set the external resource table in the core
- Fixed a crash when detaching (Arnaud)
- Fixed error code propagation in rproc_cdev_relase() and rproc_del() (Arnaud)
- Added RB tags

Mathieu Poirier (17):
  dt-bindings: remoteproc: Add bindind to support autonomous processors
  remoteproc: Re-check state in rproc_shutdown()
  remoteproc: Remove useless check in rproc_del()
  remoteproc: Rename function rproc_actuate()
  remoteproc: Add new get_loaded_rsc_table() remoteproc operation
  remoteproc: stm32: Move resource table setup to rproc_ops
  remoteproc: Add new RPROC_ATTACHED state
  remoteproc: Properly represent the attached state
  remoteproc: Properly deal with a kernel panic when attached
  remoteproc: Add new detach() remoteproc operation
  remoteproc: Introduce function __rproc_detach()
  remoteproc: Introduce function rproc_detach()
  remoteproc: Add return value to function rproc_shutdown()
  remoteproc: Properly deal with a stop request when attached
  remoteproc: Properly deal with a start request when attached
  remoteproc: Properly deal with detach request
  remoteproc: Refactor rproc delete and cdev release path

 .../bindings/remoteproc/remoteproc-core.yaml  |  27 +++
 drivers/remoteproc/remoteproc_cdev.c          |  32 ++-
 drivers/remoteproc/remoteproc_core.c          | 211 +++++++++++++++---
 drivers/remoteproc/remoteproc_internal.h      |   8 +
 drivers/remoteproc/remoteproc_sysfs.c         |  20 +-
 drivers/remoteproc/stm32_rproc.c              | 147 ++++++------
 include/linux/remoteproc.h                    |  24 +-
 7 files changed, 344 insertions(+), 125 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml

-- 
2.25.1

