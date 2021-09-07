Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EB6C433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Sep 2021 20:14:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C2BE6112F
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Sep 2021 20:14:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243501AbhIGUPj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 7 Sep 2021 16:15:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:45994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242395AbhIGUPi (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Sep 2021 16:15:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7AEC761103;
        Tue,  7 Sep 2021 20:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631045671;
        bh=aZgTVzuisWVI6aLYaa4z1Osmyi5sDi7H5JObQqsSeS4=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=XJp2uiin3Czn9sqHrzEpEESUbbdG2uKgkVPytTZoETMzkvt++GyJH+BeK9j1OaqWy
         5yFvzBWS/VAVh4i9cG5Jd4R314fMy1XRQETIDD89vOH2DoKq1w1S+SyBZWkP3d7/+p
         6cVgpmJKgpjw9QyjGIw1gHGI3rmVBJ13zPNSHffulypZccKi62KJ8W02n5k9/dOoVn
         wAcpU6PWvHgX6IMzgRMK0/sVKsKnOkXSP4NxKOvhI/HH5S0oE30iSNkpc8Pg/TiIpw
         B3sz0UaeSebwShGEP4kbdC2SMDiH5ro3EtjTdR3kOGs8fke31CQpGTmYs/6uG2Ry1C
         LtO46ZwaG6JoQ==
Subject: Re: [GIT PULL] remoteproc updates for v5.15
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210907140023.2399178-1-bjorn.andersson@linaro.org>
References: <20210907140023.2399178-1-bjorn.andersson@linaro.org>
X-PR-Tracked-List-Id: <linux-remoteproc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210907140023.2399178-1-bjorn.andersson@linaro.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rproc-v5.15
X-PR-Tracked-Commit-Id: a0a77028c85ad1f6f36c3ceea21b30dc43721665
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 21f577b0f48fd3a8871ca4116dad0e9c41ec42b2
Message-Id: <163104567147.21240.8909190591056439829.pr-tracker-bot@kernel.org>
Date:   Tue, 07 Sep 2021 20:14:31 +0000
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Alex Elder <elder@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Tue,  7 Sep 2021 09:00:23 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git tags/rproc-v5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/21f577b0f48fd3a8871ca4116dad0e9c41ec42b2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
