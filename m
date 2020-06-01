Return-Path: <SRS0=OrS8=7O=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281B2C433DF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 19:01:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 085192074B
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 19:01:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PLoEnhny"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbgFATBt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 1 Jun 2020 15:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728377AbgFARzy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Jun 2020 13:55:54 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC679C05BD43
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2020 10:55:54 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id a127so1800216pfa.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2020 10:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zACkuhg/77H3zeO+PGHNh+9yMlSwDDWi/x5X1ISMcog=;
        b=PLoEnhnypIxdDYglWjZWdbmVY9O/3d/FXn7/fOGLX1J0QDbcyq5yORuXvRPyf69GmH
         bPmuZpFDZjpxs3BNlZhAHlyAgGtEMEaGUOkeX2GeG6uWEGH6IiHYN5iv6fgkoia729ic
         ukbV9fvbH6EccxPGYp4IcT2N++qdipIqSfWyHPUiwWylioQAnUx6SmnS0U5wt9sn7I2r
         UgI/3DvCL6guNdStmxOeftLH3GgBU0iz+2AdiElVirEa8e3vyBspGCr1Bhs4voehcJiU
         uexyoOA9cpespFyQz8k1bf0tB1pWLksPQnbJGucIYnyTYj7SR+jT1oVyu66oYWuZi+iR
         NJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zACkuhg/77H3zeO+PGHNh+9yMlSwDDWi/x5X1ISMcog=;
        b=DYrrf0VkSqN8a4K2QP+Sx8UijpDwcRWxQ3RtxzQSlB2GS1hAxuXtCuLICYyx64VrYI
         85+nwDp8hnO0XekIsm741rAMS8iMS8Jo8DQEFTjWsDXOTxzXWzjaEcvQI6JaLyBRhjBc
         zBWOxfiHaQqYmG+02W2IKBj1hxh4Gj6JSiaFvTP1HSnyRw6Gq1LR57xXt9exFfMSsaBh
         US3cfHiNtZrgEtxCp8vKm5QL7waxRuCc+CI73ktkBX5N6pU8Hg0czfuZcShP2lC/UIvt
         WH2YgihaSj32qAlV5dKHK8tlLfwzkqpJP9u8E4z1LzBzvhbEEDgovytZcNZEMaLxpmv0
         dRzA==
X-Gm-Message-State: AOAM531dkbM032b0QcCiNteNnFBUVBdY0TOVNVw7zoJoCS9jeAVG00/l
        S++7AtGkoBiS7zreS4vlawWAWg==
X-Google-Smtp-Source: ABdhPJx7mm5a3eTp+VHkriv3BjsSxvd0F8RrxXaATmZINzJsX7X4HNjbdTel9tb4XVNDl4GzAM/86Q==
X-Received: by 2002:a62:1681:: with SMTP id 123mr20422249pfw.306.1591034154312;
        Mon, 01 Jun 2020 10:55:54 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id p7sm64771pfq.184.2020.06.01.10.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 10:55:53 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 00/11] remoteproc: stm32: Add support for attaching to M4  
Date:   Mon,  1 Jun 2020 11:55:41 -0600
Message-Id: <20200601175552.22286-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This set applies on top of [1] and refactors the STM32 platform code in
order to attach to the M4 remote processor when it has been started by the
boot loader.

It carries the same functionatlity as the previeous revision but account
for changes in the remoteproc core to support attaching scenarios.  More
specifically patches 6 to 10 should be given special consideration.

Note that I skipped over v3 and went directly to v4 in order to synchronise
with the remoterproc core patchset[1] that is set at v4.

Tested on ST's mp157c development board.

Thanks,
Mathieu

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=296713

Mathieu Poirier (11):
  remoteproc: stm32: Decouple rproc from memory translation
  remoteproc: stm32: Request IRQ with platform device
  remoteproc: stm32: Decouple rproc from DT parsing
  remoteproc: stm32: Remove memory translation from DT parsing
  remoteproc: stm32: Parse syscon that will manage M4 synchronisation
  remoteproc: stm32: Properly set co-processor state when attaching
  remoteproc: Make function rproc_resource_cleanup() public
  remoteproc: stm32: Split function stm32_rproc_parse_fw()
  remoteproc: stm32: Properly handle the resource table when attaching
  remoteproc: stm32: Introduce new attach() operation
  remoteproc: stm32: Update M4 state in stm32_rproc_stop()

 drivers/remoteproc/remoteproc_core.c |   3 +-
 drivers/remoteproc/stm32_rproc.c     | 214 ++++++++++++++++++++++++---
 include/linux/remoteproc.h           |   1 +
 3 files changed, 198 insertions(+), 20 deletions(-)

-- 
2.20.1

