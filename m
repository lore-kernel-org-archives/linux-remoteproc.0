Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B10C48BE5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Jun 2021 04:54:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A535613DA
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Jun 2021 04:54:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbhFOE4j (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 15 Jun 2021 00:56:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:48204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229968AbhFOE4j (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 15 Jun 2021 00:56:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 867FA6140C;
        Tue, 15 Jun 2021 04:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623732875;
        bh=LOUrrre8qSZUzINtpnJMg/SuDS2uZEyc8OgjEuONmRs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yg5nwCP1U+2AIZi5180GqrGZxiQygtRJ39hiJbUDPGyvmygZw69Zg2trAbzxvJaVI
         ohi7+dGvIkj5Nwnnw0dBeDuwbp7phAthXlHvR/qHf6xNyiO4/mVRD5BfJD4cq0wOye
         d6V8wqcKpNDTZ+xeL/WoWA3a/tKE50UA06NbrVt0=
Date:   Tue, 15 Jun 2021 06:54:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, psodagud@codeaurora.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v3 4/4] remoteproc: core: Cleanup device in case of
 failure
Message-ID: <YMgyiPzeS9XSmbrm@kroah.com>
References: <1623723671-5517-1-git-send-email-sidgup@codeaurora.org>
 <1623723671-5517-5-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623723671-5517-5-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jun 14, 2021 at 07:21:11PM -0700, Siddharth Gupta wrote:
> When a failure occurs in rproc_add() it returns an error, but does
> not cleanup after itself. This change adds the failure path in such
> cases.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
