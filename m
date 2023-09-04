Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B8DFC83F33
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Sep 2023 08:36:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234305AbjIDIgU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Sep 2023 04:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbjIDIgT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Sep 2023 04:36:19 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35CD094
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 Sep 2023 01:36:16 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-26b41112708so868056a91.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Sep 2023 01:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693816575; x=1694421375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+3966bf9rQiKoqPyh1NC8jqcm0Ko8oR0KMChC4Hs7HI=;
        b=eImOvceLwZBfG5x0ki2O35DWgNFZaKBYNrzTbLzqHHhn1mJZ1tWhKPTOfc0aDzjmqv
         AjWn75r9G+4t/UMu0G3lTpy7BbDDxlftcHwKYJu1GoCYUl1FqQ/LoqY63EMdk2PKXd41
         AZe70KXOxLTCB5K8YgpBgMCr/OF21tGeGw7s84Ji9Zr/7HiwTk6nqBhacO9QCmeZrvyg
         hgmVNHJZjH1/pSW+gQUem1O5IwS4smlNTuHBcPSp1TCVKfSDZJAg3TvtzGkrkKoDxQiz
         pWuVTLbM/C5kNU/PumR7fLvx/8LHVFNrbwQuhogx0DSn6/FKE5HUJSvKaqNqJ190qBfP
         CB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693816575; x=1694421375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3966bf9rQiKoqPyh1NC8jqcm0Ko8oR0KMChC4Hs7HI=;
        b=JBGiWWwhDhykyWytVGRH60lb5Hm6MP5M373gLNFvNckzkqZwyfqThQuzwJsFLgkqf7
         6MH1S+qTRo2hhWqFY1qqB6jQXg01FhMaAcdabPfTKCLq+/ekvZ+5tvKF4qs5qUdjY6LF
         G22ZkWe2Nv2zIjkqFxnhXil0elwDk0errWCnFze92UKAZPU7qyiIK9jKQk7zbPrDm69G
         Epv0x0UE0a7Igow2uq2FoHV8aeWhoJMhPu9dYAWpNuXFb2FhFtDHb32nkCPWuENxJgO5
         eVzyr6wiUaV5508OR4b7Mcqfr+uqUcet5EDyK0JNqnOg8lk/V95dwrCkATZ9n4IFGYyK
         s0vA==
X-Gm-Message-State: AOJu0YyAQO5rifSqxv2LbR/9g/iOrGg4LWSkuGmslI9lTfRlMwsKen1V
        zQSGpFAHzaKduI3lYVXJW9YKr6IhiF4=
X-Google-Smtp-Source: AGHT+IFHkT6CNHV3Iz1DrRuaHRXYxuUWie+pqIZrY98iXWE70Erh0ysCyNp1VBIYlN/siIbfcCCFlg==
X-Received: by 2002:a17:90a:840a:b0:26d:17d6:399d with SMTP id j10-20020a17090a840a00b0026d17d6399dmr9032243pjn.38.1693816575007;
        Mon, 04 Sep 2023 01:36:15 -0700 (PDT)
Received: from P330.. ([2001:f40:904:5cee:864f:138a:5ee:e73b])
        by smtp.googlemail.com with ESMTPSA id f20-20020a17090aa79400b00262e604724dsm8487871pjq.50.2023.09.04.01.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 01:36:14 -0700 (PDT)
From:   Tim Blechmann <tim.blechmann@gmail.com>
X-Google-Original-From: Tim Blechmann <tim@klingt.org>
To:     linux-remoteproc@vger.kernel.org
Cc:     Tim Blechmann <tim@klingt.org>
Subject: [PATCH 1/1] rpmsg: virtio_rpmsg_bus - prevent possible race condition
Date:   Mon,  4 Sep 2023 16:36:02 +0800
Message-Id: <20230904083602.106703-1-tim@klingt.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

when we cannot get a tx buffer (`get_a_tx_buf`) `rpmsg_upref_sleepers`
enables tx-complete interrupt.
however if the interrupt is executed after `get_a_tx_buf` and before
`rpmsg_upref_sleepers` we may mis the tx-complete interrupt and sleep
for the full 15 seconds.

in this case, so we re-try once before we really start to sleep

Signed-off-by: Tim Blechmann <tim@klingt.org>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 905ac7910c98..2a9d42225e60 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -587,21 +587,27 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
 
 	/* no free buffer ? wait for one (but bail after 15 seconds) */
 	while (!msg) {
 		/* enable "tx-complete" interrupts, if not already enabled */
 		rpmsg_upref_sleepers(vrp);
 
-		/*
-		 * sleep until a free buffer is available or 15 secs elapse.
-		 * the timeout period is not configurable because there's
-		 * little point in asking drivers to specify that.
-		 * if later this happens to be required, it'd be easy to add.
-		 */
-		err = wait_event_interruptible_timeout(vrp->sendq,
-					(msg = get_a_tx_buf(vrp)),
-					msecs_to_jiffies(15000));
+		/* make sure to retry to grab tx buffer before we start waiting */
+		msg = get_a_tx_buf(vrp);
+		if (msg) {
+			err = 0;
+		} else {
+			/*
+			 * sleep until a free buffer is available or 15 secs elapse.
+			 * the timeout period is not configurable because there's
+			 * little point in asking drivers to specify that.
+			 * if later this happens to be required, it'd be easy to add.
+			 */
+			err = wait_event_interruptible_timeout(vrp->sendq,
+						(msg = get_a_tx_buf(vrp)),
+						msecs_to_jiffies(15000));
+		}
 
 		/* disable "tx-complete" interrupts if we're the last sleeper */
 		rpmsg_downref_sleepers(vrp);
 
 		/* timeout ? */
 		if (!err) {
-- 
2.34.1

