Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32733C1B0D8
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Dec 2020 05:06:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 032A12085B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Dec 2020 05:06:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgLNFGY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 14 Dec 2020 00:06:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbgLNFGY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Dec 2020 00:06:24 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A8FEC0613CF
        for <linux-remoteproc@vger.kernel.org>; Sun, 13 Dec 2020 21:05:44 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id h75so19477835ybg.18
        for <linux-remoteproc@vger.kernel.org>; Sun, 13 Dec 2020 21:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=4jvDXGubsRxhn2wRkLBIdD8iEb/d8966gxDD6ar7m8g=;
        b=KlDtMcMyuXTNxGUbetGWjtd3p7hpvDYcz1yB/r9pWRwYbw/uRunc0oLBIoTyedZka/
         +uuHMnhMMyBV7rLugg+K5pmhAH0HTPVj2ACp8VNveYiyt1bsViUM4EH5sbY46MFSXwBy
         gkSSUCqzVQeUMEG8jbZtx+UiCUAiJy/73YoqXfJA0oLwxQXS1Qv1d9081Dg4F162E95u
         XwQBFC5e5B18uSMlsZ+EUEcGl+d2tO6Y8wQSpjEl9ddpnAhw8OBOpVyYZNo+7VTezreg
         UVCGtaSnTN62Yf/xe9on+NX/47S1JMoMzXs4G20PMxuQkomLERygpELc1ZVfSv+Pn+sM
         60gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=4jvDXGubsRxhn2wRkLBIdD8iEb/d8966gxDD6ar7m8g=;
        b=VhvAuyjgJMtEFzH2bXyeh7ewjB3S6f0BycLV0wzDX2X8RdM7IiDwz62YKRthnC62V3
         qkMq/TaS9fp/F3mrmT7w/6Q2nO4WxPvaqFYJzjXNiMnCBxPUysImgMkErYmjZQJVxBjD
         TGrW1wdspsPiaw1+7+pUCEDh0AALzw3CSbOEBmKR19Z7bJxlIYRCbB7J7OL1Hsk4N098
         6MKVVJgTuRUKprTNR9tf+RhCCLW8ZTVJ1IwVhYYO0ns2y7k3p3ymAW2t3RsRgnJpJCS7
         Qj5jSdR40m38j9mxx0IBgLCjHo+365iCfNk1zbfiYG5fwtG2tgQMmuK5pFjvkvGoEXyo
         yI4Q==
X-Gm-Message-State: AOAM530Xjy8CM2NAKUOhxcw/fQ7vP1pq5myYlrFPKea16Ji3vEA7uOCY
        r6jlAs/1wD6kVG23mDYvKKyONn2pFrt5
X-Google-Smtp-Source: ABdhPJxUP6w2FBmL9+7gdOpsdC3JE0U//nSrm7jMotOm88ZfM8KsOD/SRblH+17axFBMDd5+7SSemS/Ft2pS
Sender: "tzungbi via sendgmr" <tzungbi@tzungbi-z840.tpe.corp.google.com>
X-Received: from tzungbi-z840.tpe.corp.google.com ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a25:25c7:: with SMTP id
 l190mr4045475ybl.177.1607922343460; Sun, 13 Dec 2020 21:05:43 -0800 (PST)
Date:   Mon, 14 Dec 2020 13:05:19 +0800
Message-Id: <20201214050521.845396-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH 0/2] remoteproc/mediatek: support L1TCM for MT8192 SCP
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The series supports L1TCM which is a high performance memory region in
MT8192 SCP.

The 1st patch adds a new reg-name "l1tcm" for L1TCM.

The 2nd patch supports L1TCM in the firmware loader.  Note that MT8192
SCP is still under development.  The 2nd patch breaks early MT8192 SCP
firmware which should only break our development environment.

Tzung-Bi Shih (2):
  dt-bindings: remoteproc: mediatek: add L1TCM memory region
  remoteproc/mediatek: support L1TCM

 .../bindings/remoteproc/mtk,scp.txt           |  8 +--
 drivers/remoteproc/mtk_common.h               |  5 ++
 drivers/remoteproc/mtk_scp.c                  | 54 ++++++++++++++++++-
 3 files changed, 61 insertions(+), 6 deletions(-)

-- 
2.29.2.684.gfbc64c5ab5-goog

