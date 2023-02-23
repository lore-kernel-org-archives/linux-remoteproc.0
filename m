Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDF8C677F1
	for <linux-remoteproc@archiver.kernel.org>; Thu, 23 Feb 2023 19:43:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbjBWTne (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 23 Feb 2023 14:43:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjBWTn3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 23 Feb 2023 14:43:29 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1965FF07
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Feb 2023 11:43:27 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id bh1so14316786plb.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Feb 2023 11:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LjnO9LX2oaudWt6rcbd+l5z7VPXLNIdPSojjdZ3yYwY=;
        b=hiuStAIwYFXYL421s/3Lu/eOuoTSSlsQBwaCgifpmsZg6YhziKooeTzsZenHIOHT+I
         314pOCAXOA2sfpZ/KQI3DoDZs5Cu6ZyyWzg0Tv7bGySCcvd0+owffRaZwi/mRsXbLhBG
         1RokLHwoxZHNcxvJqODrJP0OpFr7Sx2dogisA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjnO9LX2oaudWt6rcbd+l5z7VPXLNIdPSojjdZ3yYwY=;
        b=j+DAMTUuIsVc1JvUBte0WdRDZfLq/ycasY1pqg9xbklb4wMCDQlMqrAI/eZz44Bdln
         JXUWRp5V/vyxmyUQaDljN4nuPctIHEEzk+BIqFDro1XUlacIhQ+7yFNYL7YAA+7mQmIH
         pWQr8R6RXf+8s3ICeaWj/AcoI0hLrjUyv9XbisTCtfuJZ64sTOHLi/nqj2pgki0QaVhD
         53rcrVe8YXEgkh+W1+l6/NQOk2tUPWK7OpOVixjS0GUR8oLo5uC26oOKW2399yZEffmu
         p7tEVZ3kyPJXdhoo5+ORRaq16KKcnLavdYbQ1f2UruHTP6iNQbwGukdck+4Fn4Fd/YBH
         7Zxw==
X-Gm-Message-State: AO0yUKUMdHn1ZHwPFasSLkgk2xdOe2Bl83q/WzeGS4aR6GjM6rOHLzSe
        vEo9UsWTaH87GwcNhZ7dxFyvvg==
X-Google-Smtp-Source: AK7set+TL9Ckjp+vyRH438uqoixtcPKXpe+lB8xFoGl83ryXnOWzsjiRVgjs0r/TRLnZz4KSDGKWBQ==
X-Received: by 2002:a17:902:e890:b0:199:2a4f:be84 with SMTP id w16-20020a170902e89000b001992a4fbe84mr18564844plg.58.1677181407313;
        Thu, 23 Feb 2023 11:43:27 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b00198e12c499dsm7194331pld.282.2023.02.23.11.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 11:43:26 -0800 (PST)
Message-ID: <63f7c1de.170a0220.f48b.e137@mx.google.com>
X-Google-Original-Message-ID: <202302231120.@keescook>
Date:   Thu, 23 Feb 2023 11:43:26 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        tony.luck@intel.com, gpiccoli@igalia.com, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 6/6] pstore/ram: Register context with minidump
References: <1676978713-7394-1-git-send-email-quic_mojha@quicinc.com>
 <1676978713-7394-7-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1676978713-7394-7-git-send-email-quic_mojha@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Feb 21, 2023 at 04:55:13PM +0530, Mukesh Ojha wrote:
> There are system which does not uses pstore directly but
> may have the interest in the context saved by pstore.
> Register pstore regions with minidump so that it get
> dumped on minidump collection.

Okay, so, this is a really interesting case -- it's a RAM backend that
is already found on a system by pstore via device tree, but there is
_another_ RAM overlay (minidump) that would like to know more about how
the pstore ram backend carves up the memory regions so it can examine
them itself too. (i.e. it's another "interface" like the pstorefs.)

So we need to provide the mapping back to the overlay. It feels to me
like the logic for this needs to live in the minidump driver itself
(rather than in the pstore RAM backend). Specifically, it wants to know
about all the operational frontends (dmesg, console, ftrace, pmsg) with
their virt & phys addresses and size.

The frontends are defined via enum pstore_type_id, and the other values
are "normal" types, so it should be possible to move this logic into
minidump instead, leaving a simpler callback. Perhaps something like:

void pstore_region_defined(enum pstore_type_id, void *virt,
			   phys_addr_t phys, size_t size);

How the pstore ram backend should know to call this, though, I'm
struggling to find a sensible way. How can it determine if the device
tree region is actually contained by a minidump overlay?

-- 
Kees Cook
