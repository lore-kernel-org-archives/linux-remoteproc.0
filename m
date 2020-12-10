Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96943C2BBCF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 23:12:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 774B423DB4
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 23:12:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389707AbgLJXLx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 10 Dec 2020 18:11:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:33930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390317AbgLJWav (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Dec 2020 17:30:51 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607639410;
        bh=Zc0Hlf3bJl8BczKD6N18mgjorLAuYmZksh8tFZJkUeY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Mx5fYXy590v9cjxfMmqXZN1Ry2/lN0IYRKtQDBNQORmLOMjKMld1p/My3jBUmoYek
         pitF/n+FU7CVLODboI49E7tYGYyIduPy3ZYZZcuhuylEzRg8X0at1F5MeC2uiklkLS
         NTl9tbm+guAxK7tCsDxAIcppiGVUOJa9aQRTge7sljYbgOiDifgRcTcm0EkotY46rG
         c+OfpCBuwBpaZ2p4FdCMkeHDi23LvmPOhrjqYSfnIWrP2Hpo28eBooD/+aZ1qWgZfo
         lrqciHHEFwXbIgeKxZCTo0bgNivq/v2F9bzQpSNbzpqC6CPymF6gbZ8Wgkrba5RAjL
         wz3Jdmlh7Oo8w==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] remoteproc/mediatek: read IPI buffer offset from FW
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160763941067.7130.3080498897994392220.git-patchwork-notify@kernel.org>
Date:   Thu, 10 Dec 2020 22:30:10 +0000
References: <20201202044609.2501913-1-tzungbi@google.com>
In-Reply-To: <20201202044609.2501913-1-tzungbi@google.com>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Wed,  2 Dec 2020 12:46:09 +0800 you wrote:
> Reads the IPI buffer offset from the FW binary.  The information resides
> in addr of .ipi_buffer section.
> 
> Moves scp_ipi_init() to rproc_ops::parse_fw() phase.  The IPI buffer can
> be initialized only if the offset is clear.
> 
> To backward compatible to MT8183 SCP, specify the offset in the board
> specific mtk_scp_of_data.  Reads the default offset if the firmware
> doesn't have it.
> 
> [...]

Here is the summary with links:
  - [v4] remoteproc/mediatek: read IPI buffer offset from FW
    https://git.kernel.org/andersson/remoteproc/c/3efa0ea743b7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


