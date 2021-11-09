Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5244BC433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Nov 2021 08:39:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36F29611BD
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Nov 2021 08:39:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242139AbhKIImR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 9 Nov 2021 03:42:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237880AbhKIImR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 Nov 2021 03:42:17 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE40EC061764;
        Tue,  9 Nov 2021 00:39:31 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id d72-20020a1c1d4b000000b00331140f3dc8so1667322wmd.1;
        Tue, 09 Nov 2021 00:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xUMx2SzpISmAUmDxXrL4U6V2fvsKDrKV28VBdFMbGfg=;
        b=ADYGiTOE7NGgfZHzddoLpEL6GrE0faIPVBEeuNA21DoSVt0YcjI59y+htJSOiGzFS9
         ug+z/lYhUCeLiPQhMoNVDVTjMMO1e+mqg8SYc7AI7Y/cuBoDH9S5yYN9u/5iG+PLyErH
         cXGyAXy/zg93FE6s1J4mknvJA0GkaIc4zV9AAdLU5CxWWrAEyq1OfeiKvSRnuJd9b4KG
         PWcSF95FTSRl0915eWGv0KyBmztybe7JyXy4qpnvFZ0lV6O5mMIUqMsXyVjYJLAkstv1
         juX9PoZXOmaijSVCtMKY9b9ewLol3NmFtCwYyaT4GjxXOUEBp/h4cssA7fyNIO43xDWG
         ONOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xUMx2SzpISmAUmDxXrL4U6V2fvsKDrKV28VBdFMbGfg=;
        b=2LMVnR+wquE7QJ00KWUosDg9iBViTRrpTDOBcMsiG7rdlfOM11qXGfxK98OcJtQykx
         pXqdQ4z9dfCczE3iBbtDVGb5/cwooP4Iv/BZnM0ZqCFSXuqPfJEhKB7y7n6teTz7SEyD
         T9SXy1yHoFd0j0IVSYxCIsbwyHR6dtPVNA8rb0ok0ebtYT1ZkLVZm0hDmbNmeXpoQ03x
         rJkaKh1dqZdJSW7BjMjfq1fYz+Fw4w4Z5aIqPybBbhAgqwvxwqw2TPuXh9MfrKZmRnaA
         BY7eicvlpgZsVq+P4WaTr6OEGHRbcL/zXs+mBitNrJKFqW4r7ApFHe/Awtw1rmKLFMQe
         LyhA==
X-Gm-Message-State: AOAM533oZw4NKNMt0Btnzxw+PTFSAaXmeUUP+eeOGr7Ij9IHMNeHCpUb
        l4U59sebcc86Gag/RG+0fJOB28XYJV0=
X-Google-Smtp-Source: ABdhPJyA3t1YVxqVxH31o6CjuvgwZfEowYNuxeTZ4ETu3zQHqok2lhkQ8lLGk20DIi9ynDYP3iIsPg==
X-Received: by 2002:a1c:cc09:: with SMTP id h9mr5417541wmb.191.1636447170290;
        Tue, 09 Nov 2021 00:39:30 -0800 (PST)
Received: from localhost.localdomain.at (62-178-82-229.cable.dynamic.surfer.at. [62.178.82.229])
        by smtp.gmail.com with ESMTPSA id q26sm19086055wrc.39.2021.11.09.00.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 00:39:29 -0800 (PST)
From:   Christian Gmeiner <christian.gmeiner@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Christian Gmeiner <christian.gmeiner@gmail.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH v2 0/1] rpmsg: syslog driver
Date:   Tue,  9 Nov 2021 09:39:20 +0100
Message-Id: <20211109083926.32052-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

I am sending this patch as RFC I am am aware that this is
not ready for inclusion. I am however want to get some
feedback on this choosen approach. In the end I want to be
able to get log messages from the remote firmware into syslog.

Christian Gmeiner (1):
  rpmsg: add syslog driver

 drivers/rpmsg/Kconfig        |  8 +++++
 drivers/rpmsg/Makefile       |  1 +
 drivers/rpmsg/rpmsg_syslog.c | 65 ++++++++++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+)
 create mode 100644 drivers/rpmsg/rpmsg_syslog.c

-- 
2.33.1

