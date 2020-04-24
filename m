Return-Path: <SRS0=nfGK=6I=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4304DC54FD0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Apr 2020 20:02:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21032216FD
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Apr 2020 20:02:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HmiyDdp1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729486AbgDXUCD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 24 Apr 2020 16:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729449AbgDXUB5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Apr 2020 16:01:57 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C700C09B048
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:56 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id g6so5113685pgs.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eewTcbuSLQRCFeSiAoYYX0+XB7BDJvlp2EU0H6eGjY4=;
        b=HmiyDdp1jKoJRJ08HAwnGFrLp2BqyTXeVlxNgf+lTmmyTS8yOuVzEJl6XmSBvWkAS/
         v/JwQlGdlmMeH1Xd2BZ21I5FEC/BV6wHAGRCVgAcB1lwzZxKnZIpNlLZKOWVsyGJbyoC
         KtPcO3HbrrJWEEOr6guTSb+qPCw8jozVoSA/MrrMeuM6iNlHvF1jx3hXzlHEcdZn6hpj
         5NatL9qSFglUvtASP78GysB2bsqBosJIQfd3d0g1fkisR7rgNut1AfGdF+fffrUNEz71
         r6AvQvD/tP1ZkkRjfAX8kAyamS0lQCLChUKc9kr/vLDxhkPNWR10WS1BDEXYXm6d3zVP
         kBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eewTcbuSLQRCFeSiAoYYX0+XB7BDJvlp2EU0H6eGjY4=;
        b=p3b+V0JPn2U4Ax/gszxeTPxKQ4UMr339Pz8fih0MlhSyLvy8ztK1UmShSJlkw9UOtx
         3UFY/0uAmBSe5qsYsbS04OwHCjZVPIbOhzwzdGvr7Gi5PxF93tu38nMPe/5OB3ISTz5G
         Lox3OlDLswj05KHFnHfY+PUwLOp1m+P8/ntGW2X+Lzty334guOFIppVh46ADJQDhHyYg
         M+YAIRon001Tiqa/Gwhi9enJeD8wbKiSC6Bpxy5sysj14mu4+jf1ksJtrYWjwvMVTgEe
         uYugE42fdz93kR20qHNBd7UU32SIe98P3IZm9FIWdHDW3bBdRvpLLzlH8SMJm8iveN4Q
         p11A==
X-Gm-Message-State: AGi0PuYUtBiAWYhdcCk0SwhQvGPpcnnzP9/Wn256NTjvQXOQz0M4sIO0
        5/sVDDlXYQqo2ZODyN9ipeN7lA==
X-Google-Smtp-Source: APiQypKrHJCG5PxycsdeNY28g4yilDbLzXrizVM7n33WA5yRahh5tr3biAmtw3GGMoaVwRFNakd1jA==
X-Received: by 2002:a62:2b06:: with SMTP id r6mr11126923pfr.249.1587758515825;
        Fri, 24 Apr 2020 13:01:55 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o11sm5532224pgd.58.2020.04.24.13.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:01:55 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/14] remoteproc: Expose synchronisation flags via debugfs
Date:   Fri, 24 Apr 2020 14:01:35 -0600
Message-Id: <20200424200135.28825-15-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424200135.28825-1-mathieu.poirier@linaro.org>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a debugfs entry that reflects the value of the current
synchronisation flags used by the remoteproc core.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_debugfs.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index 732770e92b99..3dde24e62cd8 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -291,6 +291,25 @@ static int rproc_carveouts_show(struct seq_file *seq, void *p)
 
 DEFINE_SHOW_ATTRIBUTE(rproc_carveouts);
 
+ /* Expose synchronisation states via debugfs */
+static int rproc_sync_flags_show(struct seq_file *seq, void *p)
+{
+	struct rproc *rproc = seq->private;
+
+	seq_printf(seq, "Sync with rproc: %s\n",
+		   rproc->sync_with_rproc ? "true" : "false");
+	seq_printf(seq, "On init: %s\n",
+		   rproc->sync_flags.on_init ? "true" : "false");
+	seq_printf(seq, "After stop: %s\n",
+		   rproc->sync_flags.after_stop ? "true" : "false");
+	seq_printf(seq, "After crash: %s\n",
+		   rproc->sync_flags.after_crash ? "true" : "false");
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(rproc_sync_flags);
+
 void rproc_remove_trace_file(struct dentry *tfile)
 {
 	debugfs_remove(tfile);
@@ -337,6 +356,8 @@ void rproc_create_debug_dir(struct rproc *rproc)
 			    rproc, &rproc_rsc_table_fops);
 	debugfs_create_file("carveout_memories", 0400, rproc->dbg_dir,
 			    rproc, &rproc_carveouts_fops);
+	debugfs_create_file("sync_flags", 0400, rproc->dbg_dir,
+			    rproc, &rproc_sync_flags_fops);
 }
 
 void __init rproc_init_debugfs(void)
-- 
2.20.1

