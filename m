Return-Path: <SRS0=9JvK=64=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04313C433DF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 May 2020 20:00:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2CC72065C
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 May 2020 20:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589486403;
	bh=S7WRz1CRNasPofXn/arL6alowhRnPMtESCTifv2vrtE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-ID:From;
	b=EqQMITGPBYzaOcMUQzF5T7eKMi/erfH0qf3LNIKJHpp9ss3Sxq9qmlz4j2AJadwYZ
	 kXdJe+BNK6uY0XnbfuF6YUa4ruKLyzZnjpB8PHS++EB5erUIyxDgOVPSTyux7LgSjA
	 ZoTSZaKVSxOrCN6VzZNA5GD++eQiQRztgta67xbI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbgENUAD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 May 2020 16:00:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:49970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727918AbgENUAD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 May 2020 16:00:03 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589486403;
        bh=S7WRz1CRNasPofXn/arL6alowhRnPMtESCTifv2vrtE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RKTy1MaaK5V6dF25DYL/eRRSNzmNi8nr+hs+RXyj6zVFDVEW+V05OV/rPaw66Ev2a
         YmyPZK0tAgHU+RE8sYERxrpXbcfzeF/YELxfLrSQ+uHte+po3M7ZIpHu/p4he01V3u
         iBou9q5NZuPQ+uQgQLXIeR+S9enIoSwAOOGkJqtU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: wcss: Fix arguments passed to qcom_add_glink_subdev()
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158948640306.5067.8723740663978599608.git-patchwork-notify@kernel.org>
Date:   Thu, 14 May 2020 20:00:03 +0000
References: <20200514185856.1598945-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200514185856.1598945-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Thu, 14 May 2020 11:58:56 -0700 you wrote:
> Recently qcom_add_glink_subdev() was extended to also take the glink_ssr
> identifier as an argument and I missed this while applying '8a226e2c71bb
> ("remoteproc: wcss: add support for rpmsg communication")'.
> 
> Fixes: 8a226e2c71bb ("remoteproc: wcss: add support for rpmsg communication")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> [...]


Here is a summary with links:
  - remoteproc: wcss: Fix arguments passed to qcom_add_glink_subdev()
    https://git.kernel.org/andersson/remoteproc/c/25f9f5a2107fdc6510463be4e55012d17d83ab2b

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
