Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09394C433E6
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Mar 2021 13:10:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C512364F01
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Mar 2021 13:10:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbhCRNKZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 18 Mar 2021 09:10:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:58374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231458AbhCRNKQ (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 18 Mar 2021 09:10:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 922D564F01;
        Thu, 18 Mar 2021 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616073016;
        bh=QVCYvbeWI6ip4Y7g76K2I5aFwLakY166ew/7Y3KkVPU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=dm8j8QL1Kt+tJssK+hS7LufWm0dlFB/i/9eB07fmiySOLjRixN30d+uS9WczTYj6G
         uGM+XS3xbtRKeOaUj97MRmk1ncBX6nPYejIH2GaRQUxf8pZ0xgu4IkaKlIxJDo7eF0
         Mke6L+uRt/2v7onYSrUg+4o6giCwFjIdUxtDzpfCxPaoRqEGleHjLq2oceYUPWpvnX
         US0Ui597nSUKhgivOzV2qOoQv+4NQcONSXcH3H4mLnxDROUfdUPIkOxhxrXgInjB8z
         1o32pDF5WoXWz33p5Hs42zArIewhfJaHSYXnTsepJ5Llury3ggK0bl8a8LuQDHoK4K
         7YE7D4ukvQwZg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] remoteproc: qcom_q6v5_mss: Validate p_filesz in ELF loader
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161607301656.31848.7385844287406170826.git-patchwork-notify@kernel.org>
Date:   Thu, 18 Mar 2021 13:10:16 +0000
References: <20210312232002.3466791-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210312232002.3466791-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Fri, 12 Mar 2021 15:20:02 -0800 you wrote:
> Analog to the issue in the common mdt_loader code the MSS ELF loader
> does not validate that p_filesz bytes will fit in the memory region and
> that the loaded segments are not truncated. Fix this in the same way
> as proposed for the mdt_loader.
> 
> Fixes: 135b9e8d1cd8 ("remoteproc: qcom_q6v5_mss: Validate modem blob firmware size before load")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> [...]

Here is the summary with links:
  - [v2] remoteproc: qcom_q6v5_mss: Validate p_filesz in ELF loader
    https://git.kernel.org/andersson/remoteproc/c/3d2ee78906af

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


