Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FE7C4332F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Feb 2022 09:32:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbiBNJcL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 14 Feb 2022 04:32:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243530AbiBNJbw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Feb 2022 04:31:52 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0692E1AD94
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Feb 2022 01:30:35 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id n19-20020a17090ade9300b001b9892a7bf9so5893183pjv.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Feb 2022 01:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eRzgDh/HvA+RrdqXMGe3jUAicAPEKdFG7rbJc7QV9dc=;
        b=bYlGV88NpFY7N65s82hhymVZ6Z8af2rSbDsS5wxfVGG/7dcHvmNENylUMRVSdVx9dD
         88YtbZpebSO9Osb4aILuHXfJN6L2ugSCZfA45zUAhzno2aLTEaWYFF4vFHh7uwPYydM6
         UbBray7tp7CW4pxg7RnesCyx2N88/Ydes37FABY9SgeVCKB9PSTHkE7QsBHBQRSFnZgZ
         dUkJT9S+kFD152dKyscNSuQ/BQF/6BD/2HQWR76DxkCYP8Y4Uf2YnTYYYuYHjjS4O7OL
         pACdDol298Mb7WZzT4UtVAphil2wwp1Btc0bKtIADuLH2DjtdVRdisr4tTIr3YbdZoT3
         tsgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eRzgDh/HvA+RrdqXMGe3jUAicAPEKdFG7rbJc7QV9dc=;
        b=XZNxTSHRIiAqBiGCW41YsQ9rOREZ55OM7HTYdyYqBKoCLGNdRalcU7zagpPeQ6o35y
         7xBoDpU6XKPIDuv074uV5SbDnyCRQ++7fo1xBJjMJDePvgpbINP6EyugYQX1TIIkhh57
         24eE5lahAt2iDjor3pLLf3y80+EGAPH4+kdETl7m9fH4mnJZXmZ+aepscPmS2roEgRGJ
         hmEEyDNb6q1nYmE8ozu5paHTv4pb7eKg3rOsfI34ePpYREl+2u2H62LsjL3MBU3KAY5U
         m5vBHqFzzKAcK+4hn3RZRFvMz+BPflmt1AZefzFB62xqh9bug/weiR7KM4Wn6i6S6KbP
         eJVg==
X-Gm-Message-State: AOAM532Qt3lJ55MDGPgCulNnKbpyUT71MdAeCBHsP4sWGVJQMudwKe5D
        h3ZmwYUKDbJ8UgCOyvIFitsy26zXdfyjOmFC
X-Google-Smtp-Source: ABdhPJyI5LfJarjt1I4dJm2Oi7A4pLNtG5jHgm4hC7+yRQG7cXWgsnvBaSN1h6QDPgzhphP+LqoaPA==
X-Received: by 2002:a17:90b:2342:: with SMTP id ms2mr13619111pjb.109.1644831034247;
        Mon, 14 Feb 2022 01:30:34 -0800 (PST)
Received: from localhost.localdomain ([2001:f40:906:26d6:f1ad:2f40:58c6:fd2f])
        by smtp.googlemail.com with ESMTPSA id v10sm1720310pfu.38.2022.02.14.01.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 01:30:33 -0800 (PST)
From:   Tim Blechmann <tim.blechmann@gmail.com>
X-Google-Original-From: Tim Blechmann <tim@klingt.org>
To:     linux-remoteproc@vger.kernel.org
Cc:     Tim Blechmann <tim@klingt.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 1/1] rpmsg: char - treat `ENOMEM` as `EAGAIN`
Date:   Mon, 14 Feb 2022 17:30:20 +0800
Message-Id: <20220214093020.1765833-2-tim@klingt.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220214093020.1765833-1-tim@klingt.org>
References: <20220214093020.1765833-1-tim@klingt.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

`rpmsg_trysend` returns `-ENOMEM` when no rpmsg buffer can be allocated.
this causes `::write` to fail with this error as opposed to `-EAGAIN`.
this is what user space applications (and libraries like boost.asio)
would expect when using normal character devices.

Signed-off-by: Tim Blechmann <tim@klingt.org>
CC: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_char.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 5663cf799c95..5b9e708d595a 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -239,14 +239,17 @@ static ssize_t rpmsg_eptdev_write_iter(struct kiocb *iocb,
 
 	if (!eptdev->ept) {
 		ret = -EPIPE;
 		goto unlock_eptdev;
 	}
 
-	if (filp->f_flags & O_NONBLOCK)
+	if (filp->f_flags & O_NONBLOCK) {
 		ret = rpmsg_trysendto(eptdev->ept, kbuf, len, eptdev->chinfo.dst);
+		if (ret == -ENOMEM)
+			ret = -EAGAIN;
+	}
 	else
 		ret = rpmsg_sendto(eptdev->ept, kbuf, len, eptdev->chinfo.dst);
 
 unlock_eptdev:
 	mutex_unlock(&eptdev->ept_lock);
 
-- 
2.35.1

