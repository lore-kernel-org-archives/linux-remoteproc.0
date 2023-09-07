Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610DDEE14D6
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Sep 2023 04:52:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232412AbjIGEwe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 7 Sep 2023 00:52:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbjIGEwd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 7 Sep 2023 00:52:33 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 735AF19B5
        for <linux-remoteproc@vger.kernel.org>; Wed,  6 Sep 2023 21:52:30 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1bc8a2f71eeso4774555ad.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Sep 2023 21:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694062349; x=1694667149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1EYEWcjaY4nx2xSlU4W17DpuXjxYNQYHKMQBHrUQ9oc=;
        b=Dyehd4LFv2EbRu+h41fdXaSgSQddWTH4fhNow69KjM5umE8gkN+C4dQ4teeedhl1YJ
         J0yoO9t0CDkceyMXB3Ko+fWcrjYo1xhPPXg82AkL7SkGVMV2pWUGSDKVxjRUwxs0krlu
         pVfJg4L1Tv+GIpvZfUH8RMEDBzQftmSTVKan+M4MwQuMqSDxh372jpwi68mxISeJfZYU
         /dJ3uYAC+0XSYYlChcbyDsgnHlPu7GkP7uYg6z0fsRNqj5gPDSEn3yllKz1m/uJZI/Hw
         ZKVBTsVbEp0Lm8wi0Nmswb8IhCw/3DDpMw/ySeFHYJXMlHSBbwF+GdR8c/gBJIHaVaiG
         VR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694062349; x=1694667149;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EYEWcjaY4nx2xSlU4W17DpuXjxYNQYHKMQBHrUQ9oc=;
        b=GvUisIZTHY2/ReeaGbRrjHfKIKVRQFss1EVLNaH6qcG23cmu6QS12pF5W0y6ByUEKd
         0e0MD+D4DrMFw7OCLfJNqfKDsjwI0iUdUonoL7I2e/3G7yL1HgRFg7TgSYeMTo4bghyp
         oZCNOIyMm465x34jLU4OnCrkIzzt63EpG0oP3Fn2VNHHvvXnu/BSZIieCrdETkWEeQ2v
         zaHGm4sznWoltk5CPqKcxPmaebbHgzlJj2CmBYlu2Isltt3BfiUXTAc9fbFDpoluKXXt
         ZQuxpp4SDDk+eRk9qqFGlEek32HjKwvK3WRpJCCnA/71HrYr6htPP5MU8lidNuqaZian
         ZtnQ==
X-Gm-Message-State: AOJu0YwJxnvkhEpWuqxVpadoOR15nQEzwrj1609wyc56oc5YVYBABRWd
        Ft2Et0z1s9iPIRoqXcFYfZv7w0vV7RA=
X-Google-Smtp-Source: AGHT+IFP84KAdNLQvHdRhpfQkPdv8/ywN6SrGW4I57n5RGemCsLwsl+qKDDMLJV3UmqEThB4nkBKwg==
X-Received: by 2002:a17:903:32cf:b0:1bc:3944:9391 with SMTP id i15-20020a17090332cf00b001bc39449391mr17566941plr.25.1694062349334;
        Wed, 06 Sep 2023 21:52:29 -0700 (PDT)
Received: from P330.. ([2001:f40:904:5cee:ad2b:9ccb:5263:6a01])
        by smtp.googlemail.com with ESMTPSA id x18-20020a17090300d200b001b2069072ccsm11933704plc.18.2023.09.06.21.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 21:52:28 -0700 (PDT)
From:   Tim Blechmann <tim.blechmann@gmail.com>
X-Google-Original-From: Tim Blechmann <tim@klingt.org>
To:     linux-remoteproc@vger.kernel.org
Cc:     Tim Blechmann <tim@klingt.org>
Subject: [PATCH 1/1] rpmsg: virtio_rpmsg_bus - prevent possible race condition
Date:   Thu,  7 Sep 2023 12:51:52 +0800
Message-Id: <20230907045152.22935-1-tim@klingt.org>
X-Mailer: git-send-email 2.34.1
Reply-To: <ZPZBVS3R/oZuUmk5@p14s>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

When we cannot get a tx buffer (`get_a_tx_buf`) `rpmsg_upref_sleepers`
enables tx-complete interrupt.
However if the interrupt is executed after `get_a_tx_buf` and before
`rpmsg_upref_sleepers` we may miss the tx-complete interrupt and sleep
for the full 15 seconds. To avoid this race condition, we re-try once
before we really start to sleep.

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

