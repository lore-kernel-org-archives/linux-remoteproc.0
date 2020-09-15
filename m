Return-Path: <SRS0=rFSt=CY=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5326C43461
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Sep 2020 05:00:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89D912078D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Sep 2020 05:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600146013;
	bh=efW3Q+Zoxmbr+iTSf16F6aoS1OZsfF1BYm2q17iPGIc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-ID:From;
	b=PjER2fRvsqrHXoLehjGNxhnxhYG8F6wospv/Y4Oqv/UJCRq2BQJJ5U0a1lQp9FCH1
	 oXcCNgkLDqef8yBW1dOpeG3dCvbAnqvmAjZOOt3DthmSvY+nRnMs6G2sF0ToL/4Dwe
	 cJQcM8QySrE7m1EYzs2beo4oJr3O5j8JyVE1fJUk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbgIOFAK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 15 Sep 2020 01:00:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:51086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726152AbgIOFAI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 15 Sep 2020 01:00:08 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600146007;
        bh=efW3Q+Zoxmbr+iTSf16F6aoS1OZsfF1BYm2q17iPGIc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=jujk7UCKUaAFxBmDM+7DhsaLbwaFNx4CtVGexvNYAKrg8xn5ecyt4iQTEZXXJX4If
         xhOGBLRJi5JkbaOPXj6oMqU0c9zRsLvDvHlaaVLOqmKrBuJ3jqnj3kcpje/ckomATM
         XnBVCqt4J1Rrs5wZvHBEG13JLsh/q6q1C0EwOcGo=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] rpmsg: smd: Fix a kobj leak in in qcom_smd_parse_edge()
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160014600787.14763.3173686123046077243.git-patchwork-notify@kernel.org>
Date:   Tue, 15 Sep 2020 05:00:07 +0000
References: <20200908071841.GA294938@mwanda>
In-Reply-To: <20200908071841.GA294938@mwanda>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Tue, 8 Sep 2020 10:18:41 +0300 you wrote:
> We need to call of_node_put(node) on the error paths for this function.
> 
> Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/rpmsg/qcom_smd.c | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)


Here is a summary with links:
  - rpmsg: smd: Fix a kobj leak in in qcom_smd_parse_edge()
    https://git.kernel.org/andersson/remoteproc/c/e69ee0cf655e8e0c4a80f4319e36019b74f17639

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
