Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5464DC49EAB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Jun 2021 21:50:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EFBE613BE
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Jun 2021 21:50:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhFWVwY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 23 Jun 2021 17:52:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:41300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229796AbhFWVwX (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 23 Jun 2021 17:52:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id AE9DA613C2;
        Wed, 23 Jun 2021 21:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624485005;
        bh=qmHmnj5eYH4W2LG+a82CHATaUE3veTPE7AkgdF6yaSM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Xz6AFCvYhRKJn2IPhs1eUi2MRkRgqPIFmIJRdVPYG/MtyFrvJ4+8nDy/+JfTx/4uB
         Rs7/ZPxDgGvvg2NM4cdnBA6PU7L6Cb0FpG7JDEhkeaKfCgrjqMiWPxFmUAQbThB2i5
         Z4M3RydS5ml5jdtSLXTwdTWZfTzolH19w7Hda2UMtrfya/O8JzeNWSMjxiCOmLzOlR
         sW7xZeN6SkBMQ1yrWtmPE0xNUiVJzfOJpjoeSjFqNoYJHfF6JNiAQ/JGOuZKW54m5K
         GPieDt+2iPYSl9NrkEAr9E1U5la6XPUJhVfzqKK1n4Mn+vWbTx83UxYSbXymMY7tjB
         OaZx4FfOHzc2g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V3 0/2] remoteproc: imx_rproc: support i.MX8ULP
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <162448500566.18278.11746200316594733150.git-patchwork-notify@kernel.org>
Date:   Wed, 23 Jun 2021 21:50:05 +0000
References: <20210622060148.18411-1-peng.fan@oss.nxp.com>
In-Reply-To: <20210622060148.18411-1-peng.fan@oss.nxp.com>
To:     Peng Fan (OSS) <peng.fan@oss.nxp.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Tue, 22 Jun 2021 14:01:46 +0800 you wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> V3:
>  Per Fabio's comment, keep the entries in alphabetical order in Patch 1.
> 
> V2:
>  Add R-b from Mathieu
>  Add Rob in Cc for dt-bindings
> 
> [...]

Here is the summary with links:
  - [V3,1/2] dt-bindings: remoteproc: imx_rproc: support i.MX8ULP
    https://git.kernel.org/andersson/remoteproc/c/5f5fb97491b9
  - [V3,2/2] remoteproc: imx_rproc: support i.MX8ULP
    https://git.kernel.org/andersson/remoteproc/c/d59eedc0e408

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


