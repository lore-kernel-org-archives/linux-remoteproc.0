Return-Path: <SRS0=NYIK=EC=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB52C61DD8
	for <linux-remoteproc@archiver.kernel.org>; Tue, 27 Oct 2020 00:32:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F1BC20882
	for <linux-remoteproc@archiver.kernel.org>; Tue, 27 Oct 2020 00:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603758742;
	bh=dqa6JtxLJRn8iT3a/4dQdhFUK2GrFl4nkpI3gzWfnGc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=Boy0gObVJ82okYkPu+9LxI508L5G4TQ6CvvmQCM5psleKsywU7nDObT6DHfBjwqYC
	 KJs6dHtVg7A1537GS+5WNLIrGXpilvW3gLCvjDSIItz/o5PiDzhGFhoAq0QeVJoCXX
	 PgvSbzNQ9vrUyCKiH9VhpYNmgZ0yHoVkeFgqcphA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409515AbgJ0AcM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 26 Oct 2020 20:32:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:51912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2409373AbgJZXvT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 26 Oct 2020 19:51:19 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D94F620874;
        Mon, 26 Oct 2020 23:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603756278;
        bh=dqa6JtxLJRn8iT3a/4dQdhFUK2GrFl4nkpI3gzWfnGc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VIdT1FoC0o+dCqIPM3dyRFvBKMJtX9slY0QRu8uOVcgZGGkzvQfXVNwuXMZ+0L0fd
         GdzeY0lB8fDFNuTPYe2Tnf0xbLzbov5n5gTBX4yiQqD5zLhZGCcefg/0WWucWjn6ba
         tbo8WkZgeC4Em1h+co7/1UcLLAmtIAXC3vmJYGlc=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Chris Lew <clew@codeaurora.org>,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Deepak Kumar Singh <deesin@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 109/147] rpmsg: glink: Use complete_all for open states
Date:   Mon, 26 Oct 2020 19:48:27 -0400
Message-Id: <20201026234905.1022767-109-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026234905.1022767-1-sashal@kernel.org>
References: <20201026234905.1022767-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Chris Lew <clew@codeaurora.org>

[ Upstream commit 4fcdaf6e28d11e2f3820d54dd23cd12a47ddd44e ]

The open_req and open_ack completion variables are the state variables
to represet a remote channel as open. Use complete_all so there are no
races with waiters and using completion_done.

Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
Link: https://lore.kernel.org/r/1593017121-7953-2-git-send-email-deesin@codeaurora.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/rpmsg/qcom_glink_native.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index f40312b16da06..b5570c83a28c6 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -970,7 +970,7 @@ static int qcom_glink_rx_open_ack(struct qcom_glink *glink, unsigned int lcid)
 		return -EINVAL;
 	}
 
-	complete(&channel->open_ack);
+	complete_all(&channel->open_ack);
 
 	return 0;
 }
@@ -1178,7 +1178,7 @@ static int qcom_glink_announce_create(struct rpmsg_device *rpdev)
 	__be32 *val = defaults;
 	int size;
 
-	if (glink->intentless)
+	if (glink->intentless || !completion_done(&channel->open_ack))
 		return 0;
 
 	prop = of_find_property(np, "qcom,intents", NULL);
@@ -1413,7 +1413,7 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
 	channel->rcid = ret;
 	spin_unlock_irqrestore(&glink->idr_lock, flags);
 
-	complete(&channel->open_req);
+	complete_all(&channel->open_req);
 
 	if (create_device) {
 		rpdev = kzalloc(sizeof(*rpdev), GFP_KERNEL);
-- 
2.25.1

