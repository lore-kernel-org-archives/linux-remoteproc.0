Return-Path: <SRS0=FIV4=6E=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E593CC3815B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Apr 2020 18:54:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6E7F2084D
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Apr 2020 18:54:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qf/ecC7L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgDTSyT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 20 Apr 2020 14:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgDTSyT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Apr 2020 14:54:19 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F6CC061A0C
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2020 11:54:17 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w20so4957906ljj.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2020 11:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tFwuNr0TgSQRNNXpMtC3V2slHHf02xlAMZDjaN+7RAc=;
        b=Qf/ecC7Lp+kohe1FrviknG4/IQqC/abCMx7cMJ8Qh/SH7PU6FDeUEAPzC0J/Du8RJZ
         L080nkD48kiih0pnK6PLPLWsJGLm6S1RVXu/dcSHWNi9AViGgBDdLNWUx/C05aivFcZa
         FUUpFkc0Q4n7UHOZTdTU+Tuts0aAXCfIAirO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tFwuNr0TgSQRNNXpMtC3V2slHHf02xlAMZDjaN+7RAc=;
        b=Q1DqutE7ETWfxgZjBMAgnjVUnRC8m1V7IU+2cU5PW3BtWLj3ru5IvhupcCyxdrHwdj
         M3knZLojs2WhURPq2wxdXcxHUeiez+3hEuakGLiLaiTn86BcJBkqT6dHDKg3XOPBbLVw
         u3hwtdqM0afMuMdfOS9ysNAsPY5Xe+oYQvlzmHKnp5V5Jne4vCbnQfSCwex0Upl5kMPi
         oFNQz1j5LZnWfB9cOyDaskcL6MsAM6FO8HDJt57RBIr2peJ8F/JYc1s7etwzDaaQ/PPc
         wC9+SnCGHbp/FKOGJdQYG6or8tFVVSF/frkhRHanM3VbXICMi4Xue3RxMDqFtM3Doo70
         t+MA==
X-Gm-Message-State: AGi0PuYzmW8SpcNUaBqOm2RaPGLlFN2f+gFd8PnB3BPWJ6AIpjPnBVMb
        3b4LNQfZJzwFddim3/DW1riyxRfWcL4=
X-Google-Smtp-Source: APiQypLdBpSt8pKkCbRcWK/cTpS80nOILWDEIMs9CRLOlX9pPUCZQT66ZwJplISmKugu9uS63ILmPQ==
X-Received: by 2002:a2e:8e98:: with SMTP id z24mr11353562ljk.134.1587408854927;
        Mon, 20 Apr 2020 11:54:14 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id l7sm226235lja.32.2020.04.20.11.54.13
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 11:54:13 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id e25so11263548ljg.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2020 11:54:13 -0700 (PDT)
X-Received: by 2002:a2e:b0f5:: with SMTP id h21mr6912419ljl.3.1587408852757;
 Mon, 20 Apr 2020 11:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200415071619.6052-1-sibis@codeaurora.org> <20200415071619.6052-2-sibis@codeaurora.org>
In-Reply-To: <20200415071619.6052-2-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Mon, 20 Apr 2020 11:53:36 -0700
X-Gmail-Original-Message-ID: <CAE=gft4NK8vXGwJFEtXwKroKfoSO8wPxq=fv35AVC6vSQk02ig@mail.gmail.com>
Message-ID:
 <CAE=gft4NK8vXGwJFEtXwKroKfoSO8wPxq=fv35AVC6vSQk02ig@mail.gmail.com>
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
Message-ID: <20200420185336.m7EphQGO-C6ISuieW3mQ9N0oNNHLSMf9sKAjIp-GVqA@z>

On Wed, Apr 15, 2020 at 12:16 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Remove unsed q6v5_da_to_va function as the mss driver uses a per segment
> dump function.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 14 --------------
>  1 file changed, 14 deletions(-)
>
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index b781fc8de3597..6a19e0e77236e 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -196,7 +196,6 @@ struct q6v5 {
>
>         phys_addr_t mpss_phys;
>         phys_addr_t mpss_reloc;
> -       void *mpss_region;

Hm, this doesn't build for me on our Chrome tree:

  CC [M]  drivers/remoteproc/qcom_q6v5_mss.o
/mnt/host/source/src/third_party/kernel/v5.4/drivers/remoteproc/qcom_q6v5_mss.c:1118:16:
error: no member named 'mpss_region' in 'struct q6v5'
                ptr = qproc->mpss_region + offset;
                      ~~~~~  ^
/mnt/host/source/src/third_party/kernel/v5.4/drivers/remoteproc/qcom_q6v5_mss.c:1520:9:
error: no member named 'mpss_region' in 'struct q6v5'
        qproc->mpss_region = devm_ioremap_wc(qproc->dev,
qproc->mpss_phys, qproc->mpss_size);
        ~~~~~  ^
/mnt/host/source/src/third_party/kernel/v5.4/drivers/remoteproc/qcom_q6v5_mss.c:1521:14:
error: no member named 'mpss_region' in 'struct q6v5'
        if (!qproc->mpss_region) {
             ~~~~~  ^
