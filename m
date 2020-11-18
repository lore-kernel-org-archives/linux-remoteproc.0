Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13439C6369E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 14:30:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1B32246BC
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 14:30:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNA952K7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgKROaI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Nov 2020 09:30:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:54822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725834AbgKROaH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 09:30:07 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605709806;
        bh=bInKburzFrWZlCPvspBJDRTTX4iNRmGkr4RC/DEbkcM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=aNA952K7f7QMY52FVy0nWZgOx6eGv+Aj30cRviRQOr/hYTdLKcq44eekBFjbGm+Py
         W3otk4Lmzngq5AT5NMWvTfCuJMtu5AKCanx3EEK0MSTjGzbTzQfVTYeUgrwOukksKP
         cOV6y1nd5+LUowY7hLtwUSfLD+lITHLZqmFw+Iuc=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] remoteproc: Constify static struct rproc_ops
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160570980683.9988.13943627937848448918.git-patchwork-notify@kernel.org>
Date:   Wed, 18 Nov 2020 14:30:06 +0000
References: <20201107233630.9728-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20201107233630.9728-1-rikard.falkeborn@gmail.com>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Sun,  8 Nov 2020 00:36:28 +0100 you wrote:
> Constify two static struct rproc_ops which are never modified. These two
> changes makes all static instances of rproc_ops in the kernel const.
> 
> Rikard Falkeborn (2):
>   remoteproc: ingenic: Constify ingenic_rproc_ops
>   remoteproc: stm32: Constify st_rproc_ops
> 
> [...]

Here is the summary with links:
  - [1/2] remoteproc: ingenic: Constify ingenic_rproc_ops
    https://git.kernel.org/andersson/remoteproc/c/bb7eda7eddf1
  - [2/2] remoteproc: stm32: Constify st_rproc_ops
    https://git.kernel.org/andersson/remoteproc/c/0eee3d28ff65

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


