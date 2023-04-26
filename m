Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDAEC77B7C
	for <linux-remoteproc@archiver.kernel.org>; Wed, 26 Apr 2023 00:50:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238991AbjDZAuO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 25 Apr 2023 20:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239032AbjDZAt7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 25 Apr 2023 20:49:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92122193E1;
        Tue, 25 Apr 2023 17:49:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CB3AB62E0D;
        Wed, 26 Apr 2023 00:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A81FC433EF;
        Wed, 26 Apr 2023 00:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682470171;
        bh=S2GMdo53A6ZmyF9BBrhmPbTXFtIVagtRorCymkZ1c+c=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=AHzY/7RgwmThFwIrExnl5NKxLD7uI1jX3q89GAukpfJxW4pB2ZQf7igXzspVPe2QK
         4f1Zpb0q4l0jK2MgswrwMzNSyYnYTUlfzRBtZV+DDtcEqz7cfqH2LkysDCvmAYaQGc
         L8UQir+ekhkFRAkKM9Ifl6fZEZIpKUearLxA1WobjWorENQDoOzC3GYli4TPhioFf5
         ktQlVxWtj9I9oSNcuuR2MpLYNMBS9tGmlj1NGlnuQae7qYQjVEpQwEeJLK5aoJ5SbQ
         OFmpPk14K91xPxcSPuR1/qL30nsRqQ+sQdX5b3xZFQzrXhRLWEKjhyAAZt/pM+ZKxS
         PbfvAXTzLS1TQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 234F6E5FFC6;
        Wed, 26 Apr 2023 00:49:31 +0000 (UTC)
Subject: Re: [GIT PULL] rpmsg updates for v6.4
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230424145902.277800-1-andersson@kernel.org>
References: <20230424145902.277800-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-remoteproc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230424145902.277800-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.4
X-PR-Tracked-Commit-Id: ba7a4754da1092decbeea3b29bf7d5946f1be400
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fe89e9b1af14794a4df9d45b958ff1adf0b98dc1
Message-Id: <168247017113.10866.13504213550079613895.pr-tracker-bot@kernel.org>
Date:   Wed, 26 Apr 2023 00:49:31 +0000
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Mon, 24 Apr 2023 07:59:02 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fe89e9b1af14794a4df9d45b958ff1adf0b98dc1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
