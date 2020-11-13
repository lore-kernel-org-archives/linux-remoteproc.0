Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 407F8C388F7
	for <linux-remoteproc@archiver.kernel.org>; Fri, 13 Nov 2020 07:02:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D903A20B80
	for <linux-remoteproc@archiver.kernel.org>; Fri, 13 Nov 2020 07:02:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XVooYVhL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgKMHCS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 13 Nov 2020 02:02:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbgKMHCS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 13 Nov 2020 02:02:18 -0500
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 096F9C0613D6
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2020 23:02:18 -0800 (PST)
Received: by mail-qt1-x849.google.com with SMTP id b10so5176839qtb.16
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2020 23:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=XMlqZ1InvxrZfrALPvBsxmrkxcxs/WzrYWfmoOXV5oQ=;
        b=XVooYVhLDc0Sxh+voEL4RI0ViDpiw3LQnqfijn6fkLxThdB9A6vVzVQcRsZqpDUyFM
         dnHB62ASfXZ8pUMj3/GbzQ+YLLKrGdcC3YFBzYxDX3mSqRew6CdnS/uT44zz1B9F5Vgb
         w4+pMDHs8L6/mnHsOjeopUVHtLkeS/CfTrzmKfFLfqYYbqNwb/Ad7TY1idDwNmQAPY+8
         WHUte8/sQIMOaRmim4QGRMqKqZvt7cQf9WHzsolz8BqalcAE7hCGl13bCR4J/m3IMofM
         FUk+HPr0KVKDZiyLURaZckuEdr18OLJK+GlWq/05Wu/ScICbOsfl6wC4cz0AWYVrvAgA
         ia4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=XMlqZ1InvxrZfrALPvBsxmrkxcxs/WzrYWfmoOXV5oQ=;
        b=MWQArEw/ZcEVEZ2CZFsrNr0SeKuvgDzz0JJINlk5Cc35j/HjCuXiHpnmfbdn3uty4O
         U82Jz21PLpPNnoleU2xz9wo32e8RqGpqWtJOzvvlNlQb7VQuh/h9WL5vaDnhUIsplNAA
         JsLMX7mpTUpTmM0iPa4EuBrOYKxfMUrzAbR6CpzuwiL+EEgVYUFnhvE0QShdqS88nutK
         ZeKAotbVdXTmVX8eM1Ah2uWs3RTTKf7dxDjcnZISP0L6DcgLaiBM9teZc38ahIx6umll
         gh0fxXX1PyEIyRMDETacnoGSmK8RhmkQojdorKIWIrp0NSJYh6R4a2/N99t49vUTn7Xt
         E3kw==
X-Gm-Message-State: AOAM530K6whTNWiyzoODewXArLvYz8DmloDW6dr5ttRmcFNDotBXwRjj
        2mwlADdnJhG5YmP/3MAoRaeN3v1PjXSb
X-Google-Smtp-Source: ABdhPJyr0GWZSCn20T2kweKfZDN3L/Gq3xDk5MyWTw/K0xIoS6FPcymwiRLJuEACC5/6JU5eFXQjNdpACT2h
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:90e4:: with SMTP id
 p91mr939345qvp.61.1605250937150; Thu, 12 Nov 2020 23:02:17 -0800 (PST)
Date:   Fri, 13 Nov 2020 15:02:04 +0800
Message-Id: <20201113070207.836613-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH 0/3] remoteproc/mediatek: read IPI buffer offset from FW binary
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, tzungbi@google.com,
        pihsun@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This series reads the address of IPI (inter-processor-interrupt) shared
buffer from the FW binary itself.

The 1st patch fixes a boundary check bug.

The 2nd patch skips a program header to parse if filesz is 0.

The 3rd patch parses the FW binary to find the shared buffer address.

The series bases on https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/log/?h=for-next

Tzung-Bi Shih (3):
  remoteproc/mediatek: fix boundary check
  remoteproc/mediatek: skip if filesz is 0
  remoteproc/mediatek: read IPI buffer offset from FW

 drivers/remoteproc/mtk_scp.c | 89 +++++++++++++++++++++++-------------
 1 file changed, 57 insertions(+), 32 deletions(-)

-- 
2.29.2.299.gdc1121823c-goog

