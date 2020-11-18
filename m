Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52A0C63798
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 14:30:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81BD5246B8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 14:30:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEPZrrVj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgKROaI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Nov 2020 09:30:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:54834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726424AbgKROaH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 09:30:07 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605709807;
        bh=DC+TLipkLhZGha8CBH2IeShqIOYI1LDuP6ny5LpaExY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=YEPZrrVjCoGRgchMBLVJg/S1ttzJeqlsIwH2DV28rrjre6kcIaDkJV5lL2kbCdxgK
         mhdSin4hcpm5NdrBUTu+UVvoyJue65MDWkmUckGXx3CVlnUl8VAOyxPbabPXu8jCRs
         3AlsxVRUDOOdjrLZU0R3ow8tYpf8dCUHHocDlxew=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 -next] remoteproc: k3-dsp: Fix return value check in
 k3_dsp_rproc_of_get_memories()
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160570980693.9988.2805771949484833032.git-patchwork-notify@kernel.org>
Date:   Wed, 18 Nov 2020 14:30:06 +0000
References: <20200905122503.17352-1-yuehaibing@huawei.com>
In-Reply-To: <20200905122503.17352-1-yuehaibing@huawei.com>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Sat, 5 Sep 2020 20:25:03 +0800 you wrote:
> In case of error, the function devm_ioremap_wc() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
> 
> Fixes: 6edbe024ba17 ("remoteproc: k3-dsp: Add a remoteproc driver of K3 C66x DSPs")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Acked-by: Suman Anna <s-anna@ti.com>
> 
> [...]

Here is the summary with links:
  - [v2,-next] remoteproc: k3-dsp: Fix return value check in k3_dsp_rproc_of_get_memories()
    https://git.kernel.org/andersson/remoteproc/c/9b3b3c9531e8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


