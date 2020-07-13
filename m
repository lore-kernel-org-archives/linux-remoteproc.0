Return-Path: <SRS0=6FrS=AY=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7020C433E1
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Jul 2020 19:20:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B71E92075D
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Jul 2020 19:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594668003;
	bh=cBtwRHviCu5lMzL4sDCalcEH/WQ6gNAvTu6uR/ZwgYM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-ID:From;
	b=zzn5yJbAVcrSRfp2pHZpWI5F/aQXxbxM+WUwRFQDoCDEbvbFhSYmkUnS6PRE0K+n2
	 Bp6eyf14uUc8sGzXDGAHGK412NwxhF9fHfhkpOP+4XfWMqoq9qRXEfhtc7KFfvcfy/
	 HD1gWHWkUKEzjiIRaGNPl9uosVSz6ZNwhvBkfx2Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbgGMTUD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 13 Jul 2020 15:20:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:49736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726356AbgGMTUD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Jul 2020 15:20:03 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594668003;
        bh=cBtwRHviCu5lMzL4sDCalcEH/WQ6gNAvTu6uR/ZwgYM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=kLWnK6DApzJEOrWUEHMmURyrarMPwJwPPFD10/KoENgcavJC7pxnXaUe9HSu1pnVS
         SEmTut11XnLUE/MlMkBd/sHQROzUxCz8Y/sB0wXeCtTRvzcnhU6tzteExUcULJNVCs
         5GBctthMlaCRAsW3glfELDAM02+ci8+HEYKlZ4R4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next] remoteproc: qcom: Add missing slab.h
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <159466800300.18640.9525560095014053151.git-patchwork-notify@kernel.org>
Date:   Mon, 13 Jul 2020 19:20:03 +0000
References: <20200713020003.134039-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20200713020003.134039-1-wangkefeng.wang@huawei.com>
To:     Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Mon, 13 Jul 2020 10:00:03 +0800 you wrote:
> drivers/remoteproc/qcom_common.c: In function ‘qcom_ssr_get_subsys’:
> drivers/remoteproc/qcom_common.c:210:9: error: implicit declaration of function ‘kzalloc’; did you mean ‘vzalloc’?
> [-Werror=implicit-function-declaration]
>   info = kzalloc(sizeof(*info), GFP_KERNEL);
>          ^~~~~~~
>          vzalloc
> 
> [...]


Here is a summary with links:
  - [-next] remoteproc: qcom: Add missing slab.h
    https://git.kernel.org/andersson/remoteproc/c/0cf17702d872128fc2bec79a9578b5cb00d54a11

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
