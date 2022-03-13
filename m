Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF4AC433F5
	for <linux-remoteproc@archiver.kernel.org>; Sun, 13 Mar 2022 02:46:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233445AbiCMCrO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 12 Mar 2022 21:47:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232810AbiCMCrN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 12 Mar 2022 21:47:13 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31F7100768
        for <linux-remoteproc@vger.kernel.org>; Sat, 12 Mar 2022 18:46:05 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id 6so10829917pgg.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 12 Mar 2022 18:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PtE66+8Xg6M+GwZIzpubSaWEJLD5uRZKLrEr1DpXlU8=;
        b=e4CMyiicp57JDYrXM9lw/gUkfRpptMUZDkojn28SgT/FYz33qTyDoojxIHcokziizw
         5OfxW0H4VgaqDdqEsOsDHvxu6ZYATTGdyyvpM8P/3PtdIjir6HGtQXIGcq6PFkPqNqgO
         s8CXWvg6cW1QtlLaS8wfK6iY5/TJHxOuAE7vF0he78DkTt7A8dAwCLAxJMp7+AXCKAjP
         acTJcUaOHueMfdPAaeyr0pbXUoyMYDo/g9w8x1+kO5zqq9y5KnSuVet4WNaWukdGWG3+
         7hLTIPLeqD4Mt5TEAtDS3ds8AxLGtPySer5zhBVejNbeeUvVelYjmBbveur4t4Eo+5pq
         OdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PtE66+8Xg6M+GwZIzpubSaWEJLD5uRZKLrEr1DpXlU8=;
        b=lAsLUoJRrXVOixhwH+kaZ4b/rNsnhwyJX2NBqchJsaz0dICOmYgm4DJryYCg2hrau3
         dlvu2HCRB0toTX4Cp8VCjg7UiBiPmmVcX35aQUXdKiO91V4Jl9LjnrWhnY+TRWZsZ2DJ
         TSFGvAHeruYmervJg0YlDw0bc/HrryW31ee1FNijeWlrBh06NKndl/uVrdqgL0Kna4lj
         uweyJYySm9jyGg3hxKkHEuBAHWR9i5JpVGwDm/USrgxRnkzQgBGnPE7vGK+FgN90yZ5n
         LZxJeoDy0kXndv6aQf2dghQKAR1bho9d+zoHXgJ8F/mcsiKs4E9zOKHYnc2djxoPN76V
         lydQ==
X-Gm-Message-State: AOAM532Yu5+F62qStlPWk1AW7/l1C9WhTxoO5rVTjaVMHHzBFXXe7PWa
        kcSRYPB9UPalE6/9VKiefkA=
X-Google-Smtp-Source: ABdhPJwujozTvOOL0kcCM8GULSiuQEC2zGqdkgHvMsdScckIWRihvIXBkLLgkXJGbWg2eFyzlQwdkw==
X-Received: by 2002:a63:4d15:0:b0:37f:f622:fe0f with SMTP id a21-20020a634d15000000b0037ff622fe0fmr14585083pgb.68.1647139565093;
        Sat, 12 Mar 2022 18:46:05 -0800 (PST)
Received: from localhost.localdomain ([2001:f40:906:26d6:1e16:d3e6:5bef:9507])
        by smtp.googlemail.com with ESMTPSA id k4-20020a17090a910400b001bd171c7fd4sm16499924pjo.25.2022.03.12.18.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 18:46:04 -0800 (PST)
From:   tim.blechmann@gmail.com
X-Google-Original-From: tim@klingt.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, Tim Blechmann <tim@klingt.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 1/1] rpmsg: char - treat ENOMEM as EAGAIN
Date:   Sun, 13 Mar 2022 10:45:41 +0800
Message-Id: <20220313024541.1579848-2-tim@klingt.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220313024541.1579848-1-tim@klingt.org>
References: <Yiy42BBHJO11GGhG@builder.lan>
 <20220313024541.1579848-1-tim@klingt.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Tim Blechmann <tim@klingt.org>

rpmsg_trysend() returns -ENOMEM when no rpmsg buffer can be allocated.
this causes write to fail with this error as opposed to -EAGAIN.
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

