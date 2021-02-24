Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438D9C433E0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Feb 2021 19:38:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E569564ED1
	for <linux-remoteproc@archiver.kernel.org>; Wed, 24 Feb 2021 19:38:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234706AbhBXTi2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 24 Feb 2021 14:38:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:48780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234561AbhBXTi2 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 24 Feb 2021 14:38:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id F2B9564ED1;
        Wed, 24 Feb 2021 19:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614195468;
        bh=3aE5mW11MyoFVc03m8u3cTAXGZUMiKKqylmy1O4kBio=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=QaOGlOWSMTStlWYfoQ4v5iNxaPFus2pFM+xw1lZy0fuVrRPiBzBELSzjOk2h+iq1i
         RtfWkUoxMxdKoiDoQ7CO9dbXboxulvPILkcrEMvkeCXQBGipTV+yOGpuRZz2tAR9vd
         VXEZAt1JKFgMUdv1GqLL6J7BQBJVQgVarZaT/zrLtUVh1tzw8Y9lVsPzB4gUZIK02C
         JXvtjKj5Ja1cNIwLqFuXvdhUhzyi909l8TRuvskPYa0q/I+S8egf0R9d4J5orDU5lb
         yBFBAJ6xPTDe8HgJDc3Rz0Jp3u4YLljDB3Cln5wp2lYBl8xnVy1kiVB0i3UThNFIHq
         ryazAyqe7oNvw==
Subject: Re: [GIT PULL] rpmsg updates for v5.12
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210224191723.192631-1-bjorn.andersson@linaro.org>
References: <20210224191723.192631-1-bjorn.andersson@linaro.org>
X-PR-Tracked-List-Id: <linux-remoteproc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210224191723.192631-1-bjorn.andersson@linaro.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rpmsg-v5.12
X-PR-Tracked-Commit-Id: 3e35772bc1e42287c8f4c70055deb5e3f5a3e8b5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e40242b9820817a7afe520228c6a6a535e40d222
Message-Id: <161419546797.19197.18042133659160212925.pr-tracker-bot@kernel.org>
Date:   Wed, 24 Feb 2021 19:37:47 +0000
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Wed, 24 Feb 2021 13:17:23 -0600:

> https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rpmsg-v5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e40242b9820817a7afe520228c6a6a535e40d222

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
