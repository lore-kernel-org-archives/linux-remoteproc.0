Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE05CC433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 21:09:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1BEE61052
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 21:09:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237121AbhI0VKy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Sep 2021 17:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237115AbhI0VKx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Sep 2021 17:10:53 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EBD0C061604
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 14:09:14 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 77-20020a9d0ed3000000b00546e10e6699so26291575otj.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 14:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=grE/QCgUPZomgAa82Baf4sqrNJQIrutG83y4os53Po0=;
        b=oIjdg4rdeHFaTWkSFkv7r27Mw1ApU0OhaRY5ZEooHEBnmKhUItDHaPZjaFO1HWnBE+
         gGA9jxLVQw9d8thRbErz6hqVo1Ej+RKxrYRsoW0XBg4kcIoJsDdXCJt+ykWDONiRSQOM
         /l+Kmk/uQrlVN+vOdVaU+6B6RcjGOHHAAH4Cjpe+ooKeij3vU21ZiDLtBk5+s8YwyULj
         BycRWA9rxAjoqIaTbey8iFYTDQEyLLnFkhK6U5+9zbuQgfDkoLWHR+3RnlwhZ3u4OU99
         kXbvGZpcNFgQdS6aRpDh+XYhiiYB7PGtFp6iSEyIKnptMu16xxi4YwQFSzXFAXsl8UvR
         pbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=grE/QCgUPZomgAa82Baf4sqrNJQIrutG83y4os53Po0=;
        b=soh5+khD8g3/5iNxM/vNOnL3qVGOJ+8n5prLhXHTRt086apwrXJKTr9k/ZsFKA/Ofh
         TvUVNF8SxTY+/mlGUN+5trJUi6tNuS3OiOKUOlhtEjPs4obnBoIYR8PZF3OayIJE2ZVL
         x55o8WyyeKtHH9KsOw97GEZEN+W2B1oryBgAcuZVDmqrmhTRSbzWcDBbN2I/1/GSHRTz
         D/WfXNqhNamaIJ4RuckJiHbWYmSIPeN8BRGkdB/xBo2wES0u1v/99ofGiNAiQ8Wf+8wD
         NMM80c5UUNHN40OLS3Rvz6Bf5QKFfml2mlik7S7QtXPxeXuREGTq+zq9pUNuaGX/460C
         AXYA==
X-Gm-Message-State: AOAM532mJKmFFslkihZF8a/annkgEp5qCRxzSpAzHF3fLQxWwcU9VnQh
        rK43Q/qEWTu+r8NEvrKh/D8rDw==
X-Google-Smtp-Source: ABdhPJyXeF7vQujghOoksF4uKMTC4XwnidezuOSOqHxkklyPUSzl/VVHyx+mF/W4Xji8LQvZuQOubw==
X-Received: by 2002:a9d:7f12:: with SMTP id j18mr1790463otq.365.1632776953523;
        Mon, 27 Sep 2021 14:09:13 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u26sm2180977oic.51.2021.09.27.14.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 14:09:13 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Update remoteproc repo url
Date:   Mon, 27 Sep 2021 14:09:46 -0700
Message-Id: <20210927210946.3746116-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The remoteproc and rpmsg repos are moving from my personal namespace to
allow Mathieu to push to the projects as well.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f28fb4b4e5c..dfc93b8e4f28 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15987,7 +15987,7 @@ M:	Bjorn Andersson <bjorn.andersson@linaro.org>
 M:	Mathieu Poirier <mathieu.poirier@linaro.org>
 L:	linux-remoteproc@vger.kernel.org
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git rproc-next
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
 F:	Documentation/ABI/testing/sysfs-class-remoteproc
 F:	Documentation/devicetree/bindings/remoteproc/
 F:	Documentation/staging/remoteproc.rst
@@ -16001,7 +16001,7 @@ M:	Bjorn Andersson <bjorn.andersson@linaro.org>
 M:	Mathieu Poirier <mathieu.poirier@linaro.org>
 L:	linux-remoteproc@vger.kernel.org
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git rpmsg-next
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-next
 F:	Documentation/ABI/testing/sysfs-bus-rpmsg
 F:	Documentation/staging/rpmsg.rst
 F:	drivers/rpmsg/
-- 
2.29.2

