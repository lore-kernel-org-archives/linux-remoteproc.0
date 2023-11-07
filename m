Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535B5C4332F
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Nov 2023 03:07:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232527AbjKGDHN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 6 Nov 2023 22:07:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbjKGDHN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 6 Nov 2023 22:07:13 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E48E184;
        Mon,  6 Nov 2023 19:07:10 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB1FC433C7;
        Tue,  7 Nov 2023 03:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699326430;
        bh=NOinsZ7Wjy931CSkONVle5Fgh9kilYV976Z3wUwAzAs=;
        h=From:To:Cc:Subject:Date:From;
        b=KpBR7jpEqA8AHp7JQiCKtEFWuyFPFAd+60PoWTSjJtMnM9qtmQuO5mIZnmAk2g7f9
         ElGBQlofqVUe8Jp8nS8JSrFDV8HTFj6+a/dwNpMRPcShye3rIYbYn+xC86tS81MdLY
         D4N7ADzt4BTddYlmjVcR0A3HhHhwrnebbuczbL0r6PwGjcD7dR1zgX8fg3Fv1YbciU
         gu+5xEv0PTsOcCqFfe9ecFeGIHJoh+2A3oBxIssmgtEa14CzAa2yEjk1483ETzYAYc
         6lL5RqEGilKmjE1TgCKe0WPlXN1GsrMavTysNLXRfO5yZGkPZbGmqHyWFlPUe/Gtf5
         r6MUPxX3eP+aQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Justin Stitt <justinstitt@google.com>
Subject: [GIT PULL] rpmsg updates for v6.7
Date:   Mon,  6 Nov 2023 19:11:09 -0800
Message-ID: <20231107031112.2563663-1-andersson@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.7

for you to fetch changes up to 2a6e483ad047654a220c798080d0fc861ead2e07:

  rpmsg: virtio: Replace deprecated strncpy with strscpy/_pad (2023-10-23 13:11:07 -0600)

----------------------------------------------------------------
rpmsg updates for v6.7

This replaces a number of strncpy() instances with strscpy()
strscpy_pad() through the rpmsg core and virtio implementation.

----------------------------------------------------------------
Justin Stitt (3):
      rpmsg: core: Replace deprecated strncpy with strscpy
      rpmsg: Replace deprecated strncpy with strscpy_pad
      rpmsg: virtio: Replace deprecated strncpy with strscpy/_pad

 drivers/rpmsg/rpmsg_core.c       | 2 +-
 drivers/rpmsg/rpmsg_ns.c         | 2 +-
 drivers/rpmsg/virtio_rpmsg_bus.c | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)
