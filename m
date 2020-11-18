Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A698BC64E69
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 14:30:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B75B246BE
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 14:30:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOBSiA62"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgKROaI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Nov 2020 09:30:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:54852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726644AbgKROaI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 09:30:08 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605709807;
        bh=dKIrA8H//TT01Rwhab/RU8FCEGPF5RUyaYXEDBO+4og=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=gOBSiA62Xv0NASoQhr6QY3l8f2X7dQclIGc/JyvwtjC9azeCec2k3jXpeQ+JaKwgW
         l//LYnrfBhtRQMGFmG2S/4OCbrfdfxRFopYhmAiGUg1UmwqDTp381ErEEKDP0ZzTEE
         NGTrj8EOdTMWx9vSyDg9he25PrrBhQskCxp2TwIs=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: qcom: pas: fix error handling in adsp_pds_enable
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160570980705.9988.7338051674322352943.git-patchwork-notify@kernel.org>
Date:   Wed, 18 Nov 2020 14:30:07 +0000
References: <20201102143554.144707-1-zhangqilong3@huawei.com>
In-Reply-To: <20201102143554.144707-1-zhangqilong3@huawei.com>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Mon, 2 Nov 2020 22:35:54 +0800 you wrote:
> If the pm_runtime_get_sync failed in adsp_pds_enable when
> loop (i), The unroll_pd_votes will start from (i - 1), and
> it will resulted in following problems:
> 
>   1) pm_runtime_get_sync will increment pm usage counter even it
>      failed. Forgetting to pm_runtime_put_noidle will result in
>      reference leak.
> 
> [...]

Here is the summary with links:
  - remoteproc: qcom: pas: fix error handling in adsp_pds_enable
    https://git.kernel.org/andersson/remoteproc/c/2b9de1272fbd

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


