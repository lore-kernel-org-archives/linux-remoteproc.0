Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BCD9C433E6
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Jan 2021 17:17:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BCFA224DE
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Jan 2021 17:17:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbhADRRB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Jan 2021 12:17:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726896AbhADRRB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Jan 2021 12:17:01 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7A26C061793
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 Jan 2021 09:16:20 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id v19so19427116pgj.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Jan 2021 09:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jjOs6LGR9BzFtb9WyecLB0AUz/XSu0O5wA5oQbJ4FlM=;
        b=lOo/XzwqYMVGKsrTCZPlZXtQTRkReKeLcybKCge7YWK2zggLKwH3k6u6GW3L9CpWID
         iL95BzJHXXMHXpPQ4xJyCz6JeBOZRgjOkUaPMjqdpJhoTI6uK6wf4ssQAKYnp66Paj4T
         /7hzfwGHC1dQk5qIDdRWdRwdWivoYJ09z/s4ESi0GWfMyArTp6Qz2IM+Qq1KPl10Cbzk
         MnCJa1SxiWSwBr74CV8CSTgDTOWn13bPNH6Mr9WiN82MTAyqibiyc61MHzjzD9QK7Qoa
         uc5zkKW8mw6DZ817I82nBDXSK/08sRQL2hE2lrQ2isn8SdevqK8FwyvIcxeu7GJiwxIq
         0fKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jjOs6LGR9BzFtb9WyecLB0AUz/XSu0O5wA5oQbJ4FlM=;
        b=alhvshnQoAxx6ucjmkrdtTsq4rCAG+qRmLdawGIhmmiRI92WQO7AWNmDBKgIUhm0eX
         f/AN0qHPnVJtGKRx1bYye+CO8dOXkTm6AgHxQEc/ApfyMxTssqXtIeaVhF3fx1F9pzxw
         0FMXxtqiuW170LUZf0qqP9ALBiKwCS31+yfmQuxtyfwFGX5b/pLv8qFRqZ+K3Ui4DHD+
         B3SMiyugDGOSpFuiiWf7q2pOWez9o8vsdqIFBmn33PGOmzSzyAUiH1X2wCTcz+HFsWah
         YOpLx7PRadDdWVGmrymZ3jgWzlCrzNfJC0ovsA5opCJ9bo5w3ERwwD5l1xTR6njxdcEH
         QIAg==
X-Gm-Message-State: AOAM533PYqkn1bdBhHti8Pob0IHjy9ofxCodpWyFqXLrV8j8d7NGmwz5
        eABo6ulWgAym48HDpWeDBbTv1cqRUzYOUA==
X-Google-Smtp-Source: ABdhPJwEE5CG603nglRi/PhtwYgUwWCBOcj6TL6PDpX2sU/fBvE/ZNVz9xqabNiYEhnD507/ptg+Tw==
X-Received: by 2002:aa7:810a:0:b029:1a6:501b:19ed with SMTP id b10-20020aa7810a0000b02901a6501b19edmr45701657pfi.17.1609780580403;
        Mon, 04 Jan 2021 09:16:20 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id o140sm55920429pfd.26.2021.01.04.09.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 09:16:19 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add co-maintainer for remoteproc/RPMSG subsystems
Date:   Mon,  4 Jan 2021 10:16:18 -0700
Message-Id: <20210104171618.2702461-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

After discussing with Bjorn, stepping forward to help with the
maintenance of the remoteproc and RPMSG subsystems.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6eff4f720c72..6fa304038f2d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15087,6 +15087,7 @@ F:	fs/reiserfs/
 REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM
 M:	Ohad Ben-Cohen <ohad@wizery.com>
 M:	Bjorn Andersson <bjorn.andersson@linaro.org>
+M:	Mathieu Poirier <mathieu.poirier@linaro.org>
 L:	linux-remoteproc@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git rproc-next
@@ -15100,6 +15101,7 @@ F:	include/linux/remoteproc/
 REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM
 M:	Ohad Ben-Cohen <ohad@wizery.com>
 M:	Bjorn Andersson <bjorn.andersson@linaro.org>
+M:	Mathieu Poirier <mathieu.poirier@linaro.org>
 L:	linux-remoteproc@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git rpmsg-next
-- 
2.25.1

