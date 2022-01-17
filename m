Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CABEC433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 17 Jan 2022 22:02:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235099AbiAQWCH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 17 Jan 2022 17:02:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235042AbiAQWCH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 17 Jan 2022 17:02:07 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30CC3C06161C
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jan 2022 14:02:07 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id r131so25614282oig.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jan 2022 14:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kDfvv0+tY35JNDrKBjJ8BayJ66UM4QFTM++Wd1PtAb0=;
        b=W99zbOA9w/hL8mt7mFd9rQpQklLVKVmL99kDuwnudCpNIWgcGcbJyR/hAIou8IO5ds
         EOfJX8Kx3uVllCh6BRdq0nVfqeOXPfjom9UjKhsB2gCb2Kwbds2JOnp29f3aAVoAzxBX
         56s+y74+k03aO4cVputblcGJUC20M4FCVP8Z1DxdSIwNcCtpa0lreqDtWwiIp5imWDRi
         AkhZu4evCK/oFNmRrnedJNs7IoEvxcQBZi643WtgtNZ2fvrzCcubpzpE0qM3E2+vKj9X
         rjtmY1TydL/hx93g+O7jubiRkYQPthemU6yFae5NaI87oPKvWHNfUnifRV98dNf2qhEp
         grBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kDfvv0+tY35JNDrKBjJ8BayJ66UM4QFTM++Wd1PtAb0=;
        b=8CKpCWWCIspyQAJbMci2JclsJbHN13tCdAdtEqwa9dmVpMXuh/vEDmPyTcrKfZm5rO
         ayNA1/pKiCggZmxRV8xkIU0UDKgM1cbFTaJz7wiBFS8M5cyQQuoFWhXrYo4No3lnsgTB
         l/o9enfKZNyIaDHxJZ03XJtJrsJ4iAfQW79b1ogDCnNLWhkGP6iTF1HYp9EdSEJlQ8Q2
         lCDFLOeSouTd8ywMfZkSJ4RA8YPjxpHOLYD7MyBkjHZQh/yrEduM7SM9W1yMmZIVNxWe
         9P+dtrhByoUwit1apVT/+YGep4HNhnvb+V74b1LZWeKCtf4rghpDnPnmiWe42SKRmCBF
         0bDw==
X-Gm-Message-State: AOAM531tVcDqYGzJ/uHAHk1BoaAUNKyfHI6loZATy5KLmSG26mQjqrEi
        ONZyoQl0217G2RaMzgKETKOA1oLUrM8IWw==
X-Google-Smtp-Source: ABdhPJxK1M6/8O4svPQiIEI9blipZnwLxjT0quab5/rXeBDLQm3t36JVLPgdYfeFBdtUQ0ICIySneA==
X-Received: by 2002:a54:4802:: with SMTP id j2mr8140654oij.160.1642456926541;
        Mon, 17 Jan 2022 14:02:06 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a23sm5743819oob.3.2022.01.17.14.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 14:02:06 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [GIT PULL] rpmsg updates for v5.17
Date:   Mon, 17 Jan 2022 16:02:04 -0600
Message-Id: <20220117220204.1694313-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v5.17

for you to fetch changes up to 8066c615cb69b7da8a94f59379847b037b3a5e46:

  rpmsg: core: Clean up resources on announce_create failure. (2021-12-08 10:16:50 -0700)

----------------------------------------------------------------
rpmsg updates for v5.17

This adds pr_fmt for the rpmsg_char driver, fixes error handling in
rpmsg_dev_probe() and corrects the spelling of "Return:" in various
places, in order to correct kerneldoc.

----------------------------------------------------------------
Arnaud Pouliquen (3):
      rpmsg: char: Add pr_fmt() to prefix messages
      rpmsg: Fix documentation return formatting
      rpmsg: core: Clean up resources on announce_create failure.

 drivers/rpmsg/qcom_glink_native.c |  2 +-
 drivers/rpmsg/qcom_smd.c          |  2 +-
 drivers/rpmsg/rpmsg_char.c        |  7 +++++--
 drivers/rpmsg/rpmsg_core.c        | 44 +++++++++++++++++++++++++--------------
 drivers/rpmsg/virtio_rpmsg_bus.c  |  2 +-
 5 files changed, 36 insertions(+), 21 deletions(-)
