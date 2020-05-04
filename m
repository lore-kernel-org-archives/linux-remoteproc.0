Return-Path: <SRS0=vOkv=6S=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECAEC47257
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 May 2020 21:58:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40E1C20721
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 May 2020 21:58:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BaoD9rRb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbgEDV6e (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 May 2020 17:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727842AbgEDV6d (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 May 2020 17:58:33 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE7EC061A0E
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 May 2020 14:58:32 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id u10so172767pls.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 May 2020 14:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ARI43q2s+ol+d5piZ2f6Y6I2+7yuQO0A3PHvzfY/Pos=;
        b=BaoD9rRbXJRAHUtH1cBtOwK8o5RqfsVJhUUS4qId0ycwMCq9vzlpacqv7pLh/S016W
         ZkmA0DP8bDpRu1ISc2ZQ0dEAXX+dUZY1KzOZm4lp3guUR7UMVfFTwIjud+NJl8VEMfpf
         /eARcLg7PJg6zTtgLUhl19XnZIqW+bu7Isl1UxN952CNCIQOZFOJXv6dxw81YFKBg3/0
         +priE2A4FgQjTEACFi3ZyIPLo+qJGIFxCSaG62ZLSS6E1NRitq7Lo1PLhskPMoRfFA/S
         xrERBEet5PlbTz7IVJu9PMLZ9WMPM0P++xKAwiBc31OyBpRCKh18DfxMGQRDl1FRV8WH
         z/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ARI43q2s+ol+d5piZ2f6Y6I2+7yuQO0A3PHvzfY/Pos=;
        b=AMHBc1VNYp9ZRYO64qeXVtULa1Dni06o2O8aT9/DaXwXr1+hCX2wwWEERktEcz5uD7
         RnDaHY1jqJr02H8fSYHwwt/hSVIFLSiMv6OMWdflYqroYVyS35vDFoWw0plA0GkS5Y32
         nfXKd2I75ff9iveX5zJOlfqAedrzB7OLeRFxq1OjR4N1ltX/5edtV7uzcX7hDc4gAd18
         MjjgVpjN3bz/ldUnyU6CPgNIpGeeB/9gsnvbrowtONXsSGzLGXAujyFDz7ytpOLNn8vk
         3xpQozDCMgl71IJOPIRzIUKCIagSaXSQJoyI4G266+uZTdqNNMghnd0kQevF7kzF64lJ
         8uhw==
X-Gm-Message-State: AGi0PubDnfLm/85mzZCQ8zL07ri4c8jLLKs/pI/xVD/R1jK3TvpfyUF3
        gEIkqGrLXApnvI78ekwJbz0Yyg==
X-Google-Smtp-Source: APiQypIXS4KWunsaIRNV3AXfQEZ2DlkFL0JoA1zP0YQc80I4xU8VxBd+uks8Zdr647F50wU3RWvn4Q==
X-Received: by 2002:a17:902:fe09:: with SMTP id g9mr31719plj.65.1588629511693;
        Mon, 04 May 2020 14:58:31 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id g10sm60185pfk.103.2020.05.04.14.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 14:58:31 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] pmsg: core: Add support for name extension 
Date:   Mon,  4 May 2020 15:58:28 -0600
Message-Id: <20200504215830.31394-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patchset adds the capability to supplement the base definition
published by an rpmsg_driver with a postfix description so that it
is easy to differentiate entities that use the same name service.

Offers the same functionality as v3[1] but was tweaked to keep the
robot happy[2].

Applies cleanly on rpmsg-next (4a3c6e2327e6).

Thanks,
Mathieu

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=281005
[2]. https://patchwork.kernel.org/patch/11523237/ 

Mathieu Poirier (2):
  rpmsg: core: Add wildcard match for name service
  rpmsg: core: Add support to retrieve name extension

 drivers/rpmsg/rpmsg_core.c | 112 ++++++++++++++++++++++++++++++++++++-
 include/linux/rpmsg.h      |  13 +++++
 2 files changed, 124 insertions(+), 1 deletion(-)

-- 
2.20.1

