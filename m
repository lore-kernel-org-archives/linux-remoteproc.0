Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC76AC83F2C
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Sep 2023 22:50:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240903AbjIDWur (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Sep 2023 18:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237755AbjIDWur (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Sep 2023 18:50:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25250E4D;
        Mon,  4 Sep 2023 15:50:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D0C08B80F3B;
        Mon,  4 Sep 2023 22:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D439C433CA;
        Mon,  4 Sep 2023 22:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693867826;
        bh=qTmeeCDlPqDAYNvsvXWhRX/Ol3iE62sOPvlYBv2vRoI=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=HFuYsy+2Npyy3oFf3jH8u105M0vudxMorYkBfsH73TNpIFNA25lVms+cfJoUZxuGe
         v7qXnWbbKJK6lr2/bMixyW3cpSy8r+2xT21MIssgvC0Nh5NutZ7ayZDgP5ddlfdzuK
         YpmvBVfvJdkyHkrUyRPhbeYpOe5RtWJQGCrc2yAJvIME+jOQzxsQYv0UiUbBg2hGXS
         Dn9YCDgVae5FhnzQlQqk4OFZTihqRf81wl1niMjJPzWnIWEqYQ+m1Lq2F9lwx4M5v0
         7JUeJzBLjpV2d6uz7J3WBNCGUB4WgEivSalQJDQpMGIF14By7Wl+WQZLJoPpo8Kstb
         T4s6Gp90GJJdQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6867AC04DD9;
        Mon,  4 Sep 2023 22:50:26 +0000 (UTC)
Subject: Re: [GIT PULL] rpmsg updates for v6.6
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20230904160107.2954624-1-andersson@kernel.org>
References: <20230904160107.2954624-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230904160107.2954624-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.6
X-PR-Tracked-Commit-Id: d629e5bcdfd9ba1c9da6da9144cc7ba43f04a6dc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3d904704c8a23cda6423f82aadea1336df31b864
Message-Id: <169386782642.10061.2824902130362233803.pr-tracker-bot@kernel.org>
Date:   Mon, 04 Sep 2023 22:50:26 +0000
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Lew <quic_clew@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Deepak Kumar Singh <quic_deesin@quicinc.com>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Mon,  4 Sep 2023 09:01:06 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3d904704c8a23cda6423f82aadea1336df31b864

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
