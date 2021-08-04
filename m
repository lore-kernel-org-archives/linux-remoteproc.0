Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C57D0C4320A
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Aug 2021 19:31:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA64960EBC
	for <linux-remoteproc@archiver.kernel.org>; Wed,  4 Aug 2021 19:31:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbhHDTcD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Aug 2021 15:32:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:39478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229725AbhHDTcC (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Aug 2021 15:32:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8D77360F94;
        Wed,  4 Aug 2021 19:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628105509;
        bh=r2ULDi0P5NpeO4VvfI4JfEcYoFccLTJbfA56Igcx/TM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Vk/iWE3VEk/aH0jLWKaMWPPwfxEaORgsbcQf3x4+5jBGbDl7nN/grslC7aCtLF/an
         YLHEzHz5a6D9tPZ7/siwS5fAsvxh4qnAljby8KdqfTk2KPIxaAblcABdBdnCmNffw5
         qoutPaEadlsyR1uo1jNNNIYoBs0LORDnCC2woylHhSO1E8IY/gMvi4+RQuqoQDjvRr
         AD7gy+CNL1ROWLXDgwXY8uHHWUnR2VBC+48g/ALXoYSFs3FsLbEFS2BZf7wAwbB29/
         CJPzORGO19SXymo41X/hcozhvCrciBUB2SFfrO+4UdE+r0Qds02mtiSIsdcLCNADSy
         /MNdNl8wQBoZg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] remoteproc: fix an typo in fw_elf_get_class code comments
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <162810550950.17752.3513741508941507522.git-patchwork-notify@kernel.org>
Date:   Wed, 04 Aug 2021 19:31:49 +0000
References: <20210706142156.952794-1-aisheng.dong@nxp.com>
In-Reply-To: <20210706142156.952794-1-aisheng.dong@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Tue,  6 Jul 2021 22:21:55 +0800 you wrote:
> Drop 'and' which looks like unnecessary.
> 
> Fixes: 73516a33588c ("remoteproc: Add elf helpers to access elf64 and elf32 fields")
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  drivers/remoteproc/remoteproc_elf_helpers.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [1/2] remoteproc: fix an typo in fw_elf_get_class code comments
    https://git.kernel.org/andersson/remoteproc/c/c080128b6f05
  - [2/2] remoteproc: fix kernel doc for struct rproc_ops
    https://git.kernel.org/andersson/remoteproc/c/147b589c5f44

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


