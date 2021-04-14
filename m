Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40899C433ED
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Apr 2021 02:20:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DB8B610E8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Apr 2021 02:20:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238012AbhDNCUd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 13 Apr 2021 22:20:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:46670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231786AbhDNCUb (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Apr 2021 22:20:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0469F613C8;
        Wed, 14 Apr 2021 02:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618366811;
        bh=YcSi8FHgPGW/oeU7up5vBplGip24lkBNDSmTA6wJ/w0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=jVblwhLB3/GuYzsrR5Pp14yqCX/P9/Dp/pH+ySutlhByhMUpxftNxgQxsy4WXZ/B8
         dalr3JEpR0+AoNVzN5kOWt0wMdufr9CNkyALscy1ZUcv2y6Cdcwho3c2KP4YgDxWr8
         moxP9mUQTMJHQLFAeDT3C230gHKyXS9pAd6Fr1jLkRjp3XYHIQQlwS8bwr28RrcrUp
         I6YPSjAuoX8+akwmEjORLzurQH4bvWpfPNTFc+Ez5LDbqolecBgabQRn+kkRV7uPZo
         o/7pIZGABZX1KGwsxvQbdv1BiGeTWrD1n29Jx50CHpzxjSnw148EciOqhy+dMiaM4M
         4p85sZujPI8Gg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V2 0/4] remoteproc: imx: support remote cores booted early
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161836681094.7360.6206038335132468048.git-patchwork-notify@kernel.org>
Date:   Wed, 14 Apr 2021 02:20:10 +0000
References: <1617082235-15923-1-git-send-email-peng.fan@oss.nxp.com>
In-Reply-To: <1617082235-15923-1-git-send-email-peng.fan@oss.nxp.com>
To:     Peng Fan (OSS) <peng.fan@oss.nxp.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Tue, 30 Mar 2021 13:30:31 +0800 you wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> V2:
>  Patch [1,3]/4 is new
>  Patch 4/4: Update commit message, drop unneeded code that already implemented by core
> 
> This patchset is to support booted remote cores could be attached to linux.
> - Add missing of_node_put to decrease device node refcount
> - Enlarge IMX7D_RPROC_MEM_MAX because need more imx_rproc_mem, such as resource table.
> - Following stm32 remoteproc practice, move memory parsing to rproc_ops
> - Support attaching booted cores, by adding attach, get loaded resource table and etc.
> 
> [...]

Here is the summary with links:
  - [V2,1/4] remoteproc: imx: add missing of_node_put
    https://git.kernel.org/andersson/remoteproc/c/6e962bfe56b9
  - [V2,2/4] remoteproc: imx_rproc: enlarge IMX7D_RPROC_MEM_MAX
    https://git.kernel.org/andersson/remoteproc/c/f638a19775ae
  - [V2,3/4] remoteproc: imx: move memory parsing to rproc_ops
    https://git.kernel.org/andersson/remoteproc/c/10a3d4079eae
  - [V2,4/4] remoteproc: imx_rproc: support remote cores booted before Linux Kernel
    https://git.kernel.org/andersson/remoteproc/c/5e4c1243071d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


