Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5161C433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Mar 2022 18:20:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350304AbiC3SWn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 30 Mar 2022 14:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350309AbiC3SWc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 30 Mar 2022 14:22:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2D30457B2;
        Wed, 30 Mar 2022 11:20:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 82E3B60F7F;
        Wed, 30 Mar 2022 18:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54C22C340F0;
        Wed, 30 Mar 2022 18:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648664414;
        bh=eC/ors0jpJ1JrVVAnc7KWmCsZabi/GvNmkmOpu6TvAg=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Ao++jvlMhIkEbaIA2Wvu5r0IjH0u+NSf92yVpmpicS1eZNHrl1eq9JFElB2IpUNvc
         0h7oGLM8f39oMe+Nc2zG7W8HBm/UVQPkrOxEwF1hys9sJLuZL4u77tXXRcIwHS3Z18
         IXuyqDUgPWOjX1oHW0Zg48W3cdCg/bQh7zvJp0x/vO/JK2m8MU2WaK/qgcBNTac9e+
         l3xVMbxIKutLJ9MQrwTcfJF44zNU3bed2HvhEUyccYwExQHY5M5vGku74WXjCvvWNf
         0gX4la1PS2FmP1lQsVGslysX72Rm3Mx48D6Cimlgi+clcyeuVw3cx7olJkkrFeKIiV
         RMEbR7Nc7zXvg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 38F40E6BBCA;
        Wed, 30 Mar 2022 18:20:14 +0000 (UTC)
Subject: Re: [GIT PULL] hwspinlock updates for v5.18
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20220330023905.188282-1-bjorn.andersson@linaro.org>
References: <20220330023905.188282-1-bjorn.andersson@linaro.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220330023905.188282-1-bjorn.andersson@linaro.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/hwlock-v5.18
X-PR-Tracked-Commit-Id: 9a41358972eb35e6e45327035a67adfa4a223ed2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d177850d5d58320a573dd69eb3f3564856a48a88
Message-Id: <164866441422.5472.2939578667205237456.pr-tracker-bot@kernel.org>
Date:   Wed, 30 Mar 2022 18:20:14 +0000
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Sinthu Raja <sinthu.raja@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The pull request you sent on Tue, 29 Mar 2022 21:39:05 -0500:

> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/hwlock-v5.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d177850d5d58320a573dd69eb3f3564856a48a88

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
