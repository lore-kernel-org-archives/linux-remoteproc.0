Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3276CC55ABD
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 08:40:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C60A8208C7
	for <linux-remoteproc@archiver.kernel.org>; Mon, 16 Nov 2020 08:40:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S7uDoqrv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgKPI0G (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 16 Nov 2020 03:26:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgKPI0F (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 16 Nov 2020 03:26:05 -0500
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAD3BC0613CF
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 00:26:05 -0800 (PST)
Received: by mail-pg1-x54a.google.com with SMTP id 33so11113719pgt.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2020 00:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=ieHGkGRGyMdjgkXkpWPtxPSWBoXQa69qr+BlvKJmlkI=;
        b=S7uDoqrvoR2gVxti30a+oVyBmIvj/UvS+hOdo5wM9+0Q6usbayIkL/GyvZ5Qbbm0OT
         ahRTVk8S7mANO8ygQTdb6lOmKMmBOK/pmsW2Zb9vqssmgfNEuetYxDfxN7RRsz0IdL7i
         21yFE6lUhr5wjjmKJ700J8rDjd4EUmqTY9ncWvUn1G+zZadSrMZOQfYmba9ty+Xamo+x
         R/5yzRBzyXZFYwpejKG52vjBtjZqhKE0TWnan4x9E30+9uZpkW3h4GMrg11V2wJEU/mc
         BsCL3WqY14OTlFNbsanLBsMKJfL4NHXjFp4J0ZGSEIOBuROaepHVIYQUvrRV1cP9x9W9
         eAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=ieHGkGRGyMdjgkXkpWPtxPSWBoXQa69qr+BlvKJmlkI=;
        b=jxFuyFE2YJxIn7diITwFK0oGgO+zAgvPk5x4DW+JPJz9sQ/GlsUWUdz5+Jj3FZ+B9B
         mu8z5BmGY51a+PjpjyYTpWGxnvmmb7Cia4zwPyDHVS5PYFkEeClTSilT+jVWvpEqVuQK
         gJeJbfnJQGNSumWOHSd1xEpVOYnlMqI8ZAvQIX4+zcriq6pBweCe+5i+mi2wdcaf7ZsJ
         KtQBuuICrxG7nu6Zf+CrjtyH9gHLmu47sW2kgKGOgybqeKK9DSn66s6eONzdyMYf/Qpw
         kBXJmZin29N6sd1xQsJ+uTyYd5YUHx271bnOQRxwAb7Q3AEiMB1xKsfG/KuQC7LwKPln
         d4Wg==
X-Gm-Message-State: AOAM531e9KvB5wx74EpAJ/fBr0YgOujiJhUhTar0mLVZ19smaD+vHnLs
        MMlpoiLkX0VMCf1EBHj7r10ZS0H2BKC/
X-Google-Smtp-Source: ABdhPJw4PjfyU2KX+9OP/xtXaBN0zBFbu0Nb3Lxto3kM6HwtJJoC0wB9RtMBLKlJvbnRyutigI4ka8AQcEHY
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a17:902:aa83:b029:d8:c97d:9c2e with SMTP
 id d3-20020a170902aa83b02900d8c97d9c2emr12698410plr.44.1605515164929; Mon, 16
 Nov 2020 00:26:04 -0800 (PST)
Date:   Mon, 16 Nov 2020 16:25:35 +0800
Message-Id: <20201116082537.3287009-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH v2 0/2] remoteproc/mediatek: fix sparse errors
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, groeck@chromium.org,
        drinkcat@chromium.org, pihsun@chromium.org, tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Changes from v1:
(https://patchwork.kernel.org/project/linux-arm-kernel/patch/20201116044121.2457272-1-tzungbi@google.com/)
- separate into 2 patches
- provide the line numbers in commit messages

The series bases on https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/log/?h=for-next

Tzung-Bi Shih (2):
  remoteproc/mediatek: fix sparse errors on sram power on and off
  remoteproc/mediatek: fix sparse errors on dma_alloc and dma_free

 drivers/remoteproc/mtk_common.h | 2 +-
 drivers/remoteproc/mtk_scp.c    | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.29.2.299.gdc1121823c-goog

