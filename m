Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB5FC433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 Oct 2022 19:20:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbiJGTUx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 7 Oct 2022 15:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiJGTUa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 7 Oct 2022 15:20:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CE26857D6;
        Fri,  7 Oct 2022 12:20:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 61BD061DB4;
        Fri,  7 Oct 2022 19:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4B3AC433D7;
        Fri,  7 Oct 2022 19:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665170411;
        bh=G///58/K/T0MBCiEa4Qhh/H5vOZHaoIDhOzERsFXS7c=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=OmB1B9Lq6pVKtbJlTEGyfthm/6qqlxl5WsTjyPS2iZxaX4sps5dEyDU6WqbY4gY+d
         ITmrH4T6Bt+NEiaqUpesRI4WwMxyK+nsX4V7jNK/onLwGLVfTs2caVnnjJ8RPJ5Tzm
         JYiWyqqxVfQJA+FvEQkKuMusDlXYR5Q8EnqbbmmKRqypdael/ynOoyK0VEfz0e1SCC
         PJoQGXVNEPxiWeCYnFKsVna6S/EArzXmwyMpEfhewsfmlFTkBeJGbUiB+tc31pyPQE
         RCUNY0FDWqv25i/dGhPm2iUauQ0AT4wRhXZ3TUw/mkHHKEff9V4amJOUesQ1AIbffW
         q8HMn37KbMuxg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A7952E21ED6;
        Fri,  7 Oct 2022 19:20:11 +0000 (UTC)
Subject: Re: [GIT PULL] rpmsg updates for v6.1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20221007015707.2583858-1-andersson@kernel.org>
References: <20221007015707.2583858-1-andersson@kernel.org>
X-PR-Tracked-List-Id: <linux-remoteproc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20221007015707.2583858-1-andersson@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.1
X-PR-Tracked-Commit-Id: 467233a4ac29b215d492843d067a9f091e6bf0c5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e5df1d3ebed2568caf45564946b4a60aa75f0277
Message-Id: <166517041165.8063.6113838581434299418.pr-tracker-bot@kernel.org>
Date:   Fri, 07 Oct 2022 19:20:11 +0000
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        ye xingchen <ye.xingchen@zte.com.cn>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Thu,  6 Oct 2022 20:57:07 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v6.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e5df1d3ebed2568caf45564946b4a60aa75f0277

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
