Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B540AC433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 Oct 2022 01:57:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbiJGB5N (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 6 Oct 2022 21:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiJGB5M (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 6 Oct 2022 21:57:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E21B48BC;
        Thu,  6 Oct 2022 18:57:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6D269B8213D;
        Fri,  7 Oct 2022 01:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C43C433D6;
        Fri,  7 Oct 2022 01:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665107829;
        bh=Nbtxh6Kp8eMH/KHQ/XdCwo6T8ahCTWFYnsV8cpTj8/s=;
        h=From:To:Cc:Subject:Date:From;
        b=q3CWFFaX4XTUrQ3Ha+k7KN+7SbFkb20lut0sFzGSKEfeSBCCeipcLczM9CiUO8NUi
         oQyzQZ29RvgSUZVLtKTwqTgfjuwmWo7soyqSPHMDN29XMztcTtZLap+MlxqMhXXGP/
         fU9n/Bnge6cgQr43ibXE5Ub3C8XfyGYkNIOKWPLrerQYuWXUOyan0dfa17ecH4rBrl
         sN5KrAkwJML0F90GeVpSpnW61HpjGpogkWtpWZzNYZXQuKprjSBupcg5OxXG1ENKiM
         2W4l/7/wUKC3keWxx2g4GW0u2Np0PPQMU/gpqadJI2ya36lHfqhEm7uupap6h+ypIj
         sH1WufNjqGJnw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        ye xingchen <ye.xingchen@zte.com.cn>
Subject: [GIT PULL] rpmsg updates for v6.1
Date:   Thu,  6 Oct 2022 20:57:07 -0500
Message-Id: <20221007015707.2583858-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:

  Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.1

for you to fetch changes up to 467233a4ac29b215d492843d067a9f091e6bf0c5:

  rpmsg: char: Avoid double destroy of default endpoint (2022-09-21 11:21:33 -0600)

----------------------------------------------------------------
rpmsg updates for v6.1

This fixes a double free/destroy and drops an unnecessary local variable
in the rpmsg char driver.

----------------------------------------------------------------
Shengjiu Wang (1):
      rpmsg: char: Avoid double destroy of default endpoint

ye xingchen (1):
      rpmsg: char: Remove the unneeded result variable

 drivers/rpmsg/rpmsg_char.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
