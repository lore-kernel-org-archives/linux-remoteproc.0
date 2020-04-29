Return-Path: <SRS0=aZ5K=6N=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79135C83004
	for <linux-remoteproc@archiver.kernel.org>; Wed, 29 Apr 2020 17:28:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54D6D20787
	for <linux-remoteproc@archiver.kernel.org>; Wed, 29 Apr 2020 17:28:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UiSosEQy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgD2R2b (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 29 Apr 2020 13:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726530AbgD2R2a (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 29 Apr 2020 13:28:30 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 218DAC03C1AE
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2020 10:28:30 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id u6so3489057ljl.6
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2020 10:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j+bhAjh3kEPe5rhA7N5uvkCllfy/hLGyq+oBhmOHYbU=;
        b=UiSosEQy6INj2bIHG8ig4VR84YQDNNRhqfPUK25HSOUkn3sxK154B1MgEtJuwsK4Ob
         FEZJxfWbWaza4aH01LDnf5eRbFw4y7ikJBpcDGb5MxkvOGn8NEusYxHUFXdC6S9uXsPs
         tbduqCWkETnP4Zn8LmODzu0MYPsSOGt/viMP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j+bhAjh3kEPe5rhA7N5uvkCllfy/hLGyq+oBhmOHYbU=;
        b=HQo18hvlgHxAVtuR/86KRbXEni+6pKZveLGiMwQrxDXzjZX//8jWRfqjW5tlTtNNrd
         VwuiI7GnMy7lSeO84nS1i4yeRnBp9qDd2MUPnBolDaLQRGt3J60tNHBYhphnquvdVKyF
         EUJYaqRLzVFm5HkCDyXH5DvNJy0cokgjUvAXT8Tv+UmNRmT0msSrrJYV9XPZJOXfAWTa
         zOcUxLRQ9b8i7UIx9AYgozj/tuLcxHblYbLL8WLph4hZsN23T1dBW8iJN17TiiUkgsli
         JLcbWOpmR6QKZomUyK7GDrqqWA2tV3ZgCssSFULp9MkgU9jO27NeaZI4PtTgfPP6ssh8
         lWqA==
X-Gm-Message-State: AGi0PuYuEO5MNZZMAX7CY2+2LqmJNT4LBLBQrqgvA1ZOoOI6+7RPakqe
        f0DoE5hXgtJc7iju8Cf+844U7YBBlvY=
X-Google-Smtp-Source: APiQypL54A98BdTb9jYc/2gbdD5rAwi1fu0AOaygVNrOVgcqxLLf+kRAWD3rjNXdGneMbCzoA5W4Ug==
X-Received: by 2002:a2e:a40d:: with SMTP id p13mr21479535ljn.183.1588181308293;
        Wed, 29 Apr 2020 10:28:28 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id k17sm2650538ljc.73.2020.04.29.10.28.27
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 10:28:27 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id l19so3468879lje.10
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2020 10:28:27 -0700 (PDT)
X-Received: by 2002:a2e:8e22:: with SMTP id r2mr21251699ljk.286.1588181306650;
 Wed, 29 Apr 2020 10:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200415071619.6052-1-sibis@codeaurora.org> <20200415071619.6052-2-sibis@codeaurora.org>
In-Reply-To: <20200415071619.6052-2-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 29 Apr 2020 10:27:50 -0700
X-Gmail-Original-Message-ID: <CAE=gft4y4-X=RDfi78a8WNb57S=-EKFu6VOa5M9bRsFqVZ8m0Q@mail.gmail.com>
Message-ID: <CAE=gft4y4-X=RDfi78a8WNb57S=-EKFu6VOa5M9bRsFqVZ8m0Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc: qcom_q6v5_mss: Remove unused
 q6v5_da_to_va function
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org, Ohad Ben Cohen <ohad@wizery.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Apr 15, 2020 at 12:16 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Remove unsed q6v5_da_to_va function as the mss driver uses a per segment
> dump function.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

I tested both patches (successfully), but for some reason this is the
only one related to this series in my inbox.

Tested-by: Evan Green <evgreen@chromium.org>
