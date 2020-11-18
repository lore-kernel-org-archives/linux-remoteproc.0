Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A18C6379D
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 14:30:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CFFE246B8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 14:30:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgPzprhi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbgKROaI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Nov 2020 09:30:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:54838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726580AbgKROaH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 09:30:07 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605709807;
        bh=UWGf/Mu+KtyiCR3ZMMhH1n2qvG+ObqemmOGGlpAQr+8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=UgPzprhiLU8G/iDD/g4dSRO57AjekCvAS9PMABEDyFk7szNGk1A0eJfzdeP1BVYfA
         bqLuhTPxgXJhpWy7aj/rTnGH8b1S1Uu+v2ESv0cY7u7AakzLJ/flR3zzbXgDCWp6m3
         2OSWP5t5RjC48N2MUGjRRWmxCVNtXCDPX/95iH/U=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: k3-dsp: Fix return value check in
 devm_ioremap_uc()
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160570980697.9988.15612431883953535790.git-patchwork-notify@kernel.org>
Date:   Wed, 18 Nov 2020 14:30:06 +0000
References: <20201113070840.386033-1-wangli74@huawei.com>
In-Reply-To: <20201113070840.386033-1-wangli74@huawei.com>
To:     Wang Li <wangli74@huawei.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Fri, 13 Nov 2020 15:08:40 +0800 you wrote:
> In case of error, the function devm_ioremap_wc() returns NULL pointer not
> ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
> 
> Fixes: 6edbe024ba17 ("remoteproc: k3-dsp: Add a remoteproc driver of K3 C66x DSPs")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wang Li <wangli74@huawei.com>
> 
> [...]

Here is the summary with links:
  - remoteproc: k3-dsp: Fix return value check in devm_ioremap_uc()
    https://git.kernel.org/andersson/remoteproc/c/9b3b3c9531e8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


