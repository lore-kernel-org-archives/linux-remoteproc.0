Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56FA8C63777
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 Nov 2020 21:07:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3B7620643
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 Nov 2020 21:07:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WCLVMJKo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733182AbgKZVGq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 26 Nov 2020 16:06:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733051AbgKZVGp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 Nov 2020 16:06:45 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5961C061A04
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:44 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id o4so305971pgj.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2020 13:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2RSwp2FaxZrOvHsikh11ndH236WC9DHwtvvMtCMsWVE=;
        b=WCLVMJKohk7tpNgIMveowBplgnFQVZhH9HgOvahmn7+xrODcXctJrrgY00/CccPGwv
         tyHt5rAF9C2NJvufmc4ZCVcsi8b0UawM/TuHOQjjI4FtHr3jR5w8bh/oirrMYUDsHDpN
         ttzBDqiYOftZrygCewF/fu1BtQR2MNTVBG+AXFYw2zZMgPEHXiLqxIXeAW1cqORmDjEJ
         s2mtIMeS+Swup/wHX+wnCOJLH9tsLxVMn+QHdREOG7Hg3WxIJxW72uYkzsIOTdnMSz5Q
         Rg7Vybd1CsCBms8ONBejFbYhdfccvDBXuCjEBN0zJOGUPhFwp0GlyaXINylnEKYgf8B/
         fYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2RSwp2FaxZrOvHsikh11ndH236WC9DHwtvvMtCMsWVE=;
        b=Yt1M6/LR5mzqyyXZM4bU7RdsaIr1nC9R4gph4od/UVzgvWmOgOaDvSdA2H2d4jMYAK
         P4W/RImz0RfXWGiJYkeMMZju+AeU9neFcZoABebogW/mDlS56bW3yoYBOcQGUOOdNRTI
         W1eKxcpXxEVplCIKY+W8lbw13SwBw2oibre2wg5O5SKZBgwJsHHqGofZnpBhuO+Bnx6M
         68B0dVdwRhKNPZ4hU57z8m/oOuZtsCfDnYSuGQyQiRuTsgvuZATqS1rddVvjUxRhSz5q
         WU2UIJk4eANuT+PDW7xAGO0EwFPgP7cT+ekiTo7NYzxeeFgBJVJMspxviAFw52n732BV
         edLg==
X-Gm-Message-State: AOAM532Kqdb4xrrW6a5Jbgh2k4RIIw0lygsRNCYAQFP4gmiCXj8uZW2d
        XZ9X+8Li8dkIVcSlEeGbL38zzg==
X-Google-Smtp-Source: ABdhPJwxeEQIjKpTn0OagaY59ueQhB39UvCG8dzpWHbg09mghBOlddWBx1rNZdnGkC3DTz6y4QOb0g==
X-Received: by 2002:a63:7b55:: with SMTP id k21mr3901924pgn.256.1606424803641;
        Thu, 26 Nov 2020 13:06:43 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id c203sm5612676pfc.10.2020.11.26.13.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 13:06:43 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com
Subject: [PATCH v3 00/15] remoteproc: Add support for detaching from rproc
Date:   Thu, 26 Nov 2020 14:06:27 -0700
Message-Id: <20201126210642.897302-1-mathieu.poirier@linaro.org>
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

Applies cleanly on rproc-next (c3c21b356505).

Thanks,
Mathieu

[1]. https://lkml.org/lkml/2020/7/14/1600

----
New for V3:
- Added RB from Arnaud where applicable.
- Reformatted comments about "detach" operation in struct rproc_ops.
- Fixed error path in rproc_shutdown().
- Fixed processing of "start" command in state_store() and rproc_cdev_write().
- Changed binding from "autonomous-on-core-reboot" to
  "autonomous-on-core-shutdown".
- Wrote a proper YAML file for the binding.

Mathieu Poirier (15):
  dt-bindings: remoteproc: Add bindind to support autonomous processors
  remoteproc: Re-check state in rproc_shutdown()
  remoteproc: Remove useless check in rproc_del()
  remoteproc: Add new RPROC_ATTACHED state
  remoteproc: Properly represent the attached state
  remoteproc: Properly deal with a kernel panic when attached
  remoteproc: Add new detach() remoteproc operation
  remoteproc: Introduce function __rproc_detach()
  remoteproc: Introduce function rproc_detach()
  remoteproc: Rename function rproc_actuate()
  remoteproc: Add return value to function rproc_shutdown()
  remoteproc: Properly deal with a stop request when attached
  remoteproc: Properly deal with a start request when attached
  remoteproc: Properly deal with detach request
  remoteproc: Refactor rproc delete and cdev release path

 .../bindings/remoteproc/remoteproc-core.yaml  |  25 +++
 drivers/remoteproc/remoteproc_cdev.c          |  27 ++-
 drivers/remoteproc/remoteproc_core.c          | 182 +++++++++++++++---
 drivers/remoteproc/remoteproc_sysfs.c         |  20 +-
 include/linux/remoteproc.h                    |  18 +-
 5 files changed, 225 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml

-- 
2.25.1

