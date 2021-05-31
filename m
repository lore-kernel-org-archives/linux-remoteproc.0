Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F92C47080
	for <linux-remoteproc@archiver.kernel.org>; Mon, 31 May 2021 15:01:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C8E660FE8
	for <linux-remoteproc@archiver.kernel.org>; Mon, 31 May 2021 15:01:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbhEaPC7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 31 May 2021 11:02:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:51048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233924AbhEaPAg (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 31 May 2021 11:00:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7E74661186;
        Mon, 31 May 2021 14:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622472647;
        bh=3ZZUtOOjNOeUCHaBl7AzvBiUbXLzwGimQbEcfrGwnvY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Ve8aNNM06CnJMcoANaYjTRm8bBY0U1WNeJvH7YA9RWPpjKyx/HUgNFxf6yQR2x01l
         FzXw37WrDvhnA7zAve9IPbfodWpeU9Ip8eivfpAxSY857gqi79S1ms1F0U6WVeWhq/
         lkGNvdj30hIKwB2y4JbR9CEtJPO2h/kJcJoh6Vs/p18MgV6UhBMRXc0gA2yFsd887G
         uW7ZGIRULqQ2WuiNWC89tfHbHF17GPIR2n4EgIhNocchjcVaNM4+3l9wl3VyZbbEh/
         ZjoW+TjOp/s7TSf4J9Y2CRxHZudldwx2Wdkkz7gSAHC3qzixO2woU70W9O4KuK/p9J
         Xdb7ggzzb2Nyg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] TI K3 R5F remoteproc support on AM64x SoCs
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <162247264746.13780.15737518047205814285.git-patchwork-notify@kernel.org>
Date:   Mon, 31 May 2021 14:50:47 +0000
References: <20210327143117.1840-1-s-anna@ti.com>
In-Reply-To: <20210327143117.1840-1-s-anna@ti.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Sat, 27 Mar 2021 09:31:15 -0500 you wrote:
> Hi All,
> 
> The following series is a minor revision of the K3 R5F remoteproc AM64x
> support series [1] addressing one review comment from Mathieu. Please
> see the v1 cover-letter for details about the revised R5F IP in TI AM64x
> SoCs.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] dt-bindings: remoteproc: k3-r5f: Update bindings for AM64x SoCs
    https://git.kernel.org/andersson/remoteproc/c/fee613a6fec6
  - [v2,2/2] remoteproc: k3-r5: Extend support to R5F clusters on AM64x SoCs
    https://git.kernel.org/andersson/remoteproc/c/ee99ee7c929c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


