Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F437C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Feb 2022 09:32:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243681AbiBNJcK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 14 Feb 2022 04:32:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243523AbiBNJbw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Feb 2022 04:31:52 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93446AE57
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Feb 2022 01:30:33 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id d187so28193771pfa.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Feb 2022 01:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oMccKlvHSTv2/XLdnihbR0kUurA2iu+qyWrXmp9OvIg=;
        b=ouAlZ1K54ZqGOYcrw3aW7NEHM0vrvrW8oO01WlyyblX5vSoL/UBr39pKCCALaa7dVu
         OjPGn5fzXtOnIk4SgMTqyQhX91zRQe1Db27GN/CfbY9IOB92ZBa+QIS+MOPKbq/mHtEA
         ZkcQu0y9JE1sxBLtnCxdtK0Fe1KGR1u0X6UpPbh/aZnLPqVtkg/4Yln0HRWTSAA7ZClU
         66C6rGz/aSLTHW2z8rD8wAh4rIEh7I5nT0xpxEyIa41dJYN0kBH278fRmjWwuKDZHmii
         DPXWHDFXTiATX3qgpwYJMGw8nOGpZgIbNdqPD6OB/xUCExOpEpSnXtDGmSpMfuOnZ0X1
         h76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oMccKlvHSTv2/XLdnihbR0kUurA2iu+qyWrXmp9OvIg=;
        b=a7+zJL0KSvTWdRkuIFoU+L/L28plsnF6qGLcsfB06rvn4G0fGi8L/B+ezrZ5BRi3T4
         /8pgPzjPaqP4kBqAYTJMF2JgcyQa6HBf0TrIQrik3Ngt0UCOfzNabv/GmtiYsB6fRXEs
         K3FfKRDOEK1l4Xx8j20S6DYqnS8BBP1lrywITP45OSrBa7heW9wg7i8p/sYDQAxy434X
         Y+TvGZacNqrNV4y4UQSI0z26B6E2+RHfapX/v4WtSlhEXvuHZhWE0coR3Zo/71q/mDTe
         EbioBAWw5aRme39Azo6ipoYfLFVsPw0hz1dNUouOO0zVmNP4drvWa/wffRoqhGESfOvg
         G+3Q==
X-Gm-Message-State: AOAM5320mShZnwZ32bgzNz3bR0gvZhA6Lx3mUliToPeF7Sfm1IJdmbNR
        P1+4gIlE1S95SnBELmUQWz/UYi2/IIsnNLUx
X-Google-Smtp-Source: ABdhPJwYf+nJUwueV28LW8gzTcVtRfa23+nn6GXHD6tkxC6Vw7cM35qhd5ynHXjlP0dqnUmGtH0bQg==
X-Received: by 2002:a63:a550:: with SMTP id r16mr4273608pgu.270.1644831032666;
        Mon, 14 Feb 2022 01:30:32 -0800 (PST)
Received: from localhost.localdomain ([2001:f40:906:26d6:f1ad:2f40:58c6:fd2f])
        by smtp.googlemail.com with ESMTPSA id v10sm1720310pfu.38.2022.02.14.01.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 01:30:32 -0800 (PST)
From:   Tim Blechmann <tim.blechmann@gmail.com>
X-Google-Original-From: Tim Blechmann <tim@klingt.org>
To:     linux-remoteproc@vger.kernel.org
Cc:     Tim Blechmann <tim@klingt.org>
Subject: [PATCH 0/1] rpmsg: char - treat `ENOMEM` as `EAGAIN`
Date:   Mon, 14 Feb 2022 17:30:19 +0800
Message-Id: <20220214093020.1765833-1-tim@klingt.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch should allow the use of `rpmsg_char` character devices with
libraries that do a `poll`/`write` loop and expect `EAGAIN` when sending
fails and the user space application needs to `poll` to wait for more
space to be available.
`boost::asio::write` is a notable example of a library, which implements
such a loop.


Tim Blechmann (1):
  rpmsg: char - treat `ENOMEM` as `EAGAIN`

 drivers/rpmsg/rpmsg_char.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.35.1

