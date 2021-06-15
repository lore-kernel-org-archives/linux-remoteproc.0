Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B472C48BDF
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Jun 2021 04:54:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43EF861410
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Jun 2021 04:54:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbhFOE4b (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 15 Jun 2021 00:56:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:48118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229968AbhFOE4a (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 15 Jun 2021 00:56:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C9608613DA;
        Tue, 15 Jun 2021 04:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623732866;
        bh=/MfjuVHcyNn6fWowwYthRN2342Yc3ZUOxofEdm2nQBY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mMFrdbhvWXdpjLcxuF3xf6vpkmJXjrIG3jyesSwW0e7ng00LGZCzzBO7njw6I6VRI
         x1TVfe/rVZpdnYYsgO24AZwso/Pai1tDN0J4ujKKm1l/N5eummTxlpGaYlJ2KV42g/
         vJb7hlfVt2fJWFpvqAAvDAuUp8KiYA4N69bZBWI4=
Date:   Tue, 15 Jun 2021 06:54:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, psodagud@codeaurora.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v3 3/4] remoteproc: core: Fix cdev remove and rproc del
Message-ID: <YMgyf7Ogh/HGpG7m@kroah.com>
References: <1623723671-5517-1-git-send-email-sidgup@codeaurora.org>
 <1623723671-5517-4-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623723671-5517-4-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Jun 14, 2021 at 07:21:10PM -0700, Siddharth Gupta wrote:
> The rproc_char_device_remove() call currently unmaps the cdev
> region instead of simply deleting the cdev that was added as a
> part of the rproc_char_device_add() call. This change fixes that
> behaviour, and also fixes the order in which device_del() and
> cdev_del() need to be called.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_cdev.c | 2 +-
>  drivers/remoteproc/remoteproc_core.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
