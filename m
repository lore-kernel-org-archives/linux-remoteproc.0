Return-Path: <SRS0=aZ5K=6N=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D7FC83006
	for <linux-remoteproc@archiver.kernel.org>; Wed, 29 Apr 2020 17:28:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01F5C20787
	for <linux-remoteproc@archiver.kernel.org>; Wed, 29 Apr 2020 17:28:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BrwJd7jH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbgD2R2X (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 29 Apr 2020 13:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726530AbgD2R2V (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 29 Apr 2020 13:28:21 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE980C035494
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2020 10:28:19 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id h6so2403138lfc.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2020 10:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gsj/DMCdq2iHsv9iEgXgXTTdBXXORDwu7caTzYP7OC0=;
        b=BrwJd7jHAjw/ndKeVTDpR19v/ATSbqBb1x/5jMBcAmWWLYzhUU0mhqocbwlSjelc+/
         TS+pjF4F06f6y7KRfVmNvULvilWng5nsq6/LOfIBTZVCduGAQDW9ErnXCy5dlYQxyN2C
         yKfSS8+yRr3IK2V9SY0WJCnKvhNO8YUy30oGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gsj/DMCdq2iHsv9iEgXgXTTdBXXORDwu7caTzYP7OC0=;
        b=I2eY49eDye0O5l/pDEqBQYCZWhmcfb45pT9DkK7WApnRb/g1+0LIXKz8DGtuwq08J/
         aZSXLG66zE2DKgh/YWH0zmH6liZpUxA+aeLTxmxWBRqulEsR+YzDFfbHuPA4EYYT54/T
         W2dbYXpSvaeT4JV1LbVgj7Abfioii2Tg7vhlsuJxE5Y7Ff0ZkDCyZqAf3Y1JL5py+nS6
         ZofU8fyDqUdl4tz/Ww4QXyJsXNfmBzzEcMa/F29VA6KPgo+dVsOoj77Bzco6nqWSVMH2
         y9rR0BWsak+m5vfvBGb4vgW/fNxmAu58yGVd2Tt2jYwAW6p5QMIZ7isgaoWANYwX0MC2
         Q56A==
X-Gm-Message-State: AGi0PuYbaL4HvsI3oqUCwyiyDwoVQt0U3w7AuCZ78ZfDuNlDwS3jUkLy
        H2mRjHktYN8lW/XWnjLhNwk6zC5U9x4=
X-Google-Smtp-Source: APiQypKCRzpvpxsQi757a9+8zarRWPAy7JrzmYUBSHr1rD+qwp9hwu6TErjz8F2C6VMmvShl1gnhmg==
X-Received: by 2002:ac2:4213:: with SMTP id y19mr22069950lfh.99.1588181297772;
        Wed, 29 Apr 2020 10:28:17 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id k11sm3164705lfe.44.2020.04.29.10.28.16
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 10:28:16 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id e25so3506326ljg.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Apr 2020 10:28:16 -0700 (PDT)
X-Received: by 2002:a05:651c:449:: with SMTP id g9mr21840460ljg.278.1588181295980;
 Wed, 29 Apr 2020 10:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200415145110.20624-1-sibis@codeaurora.org>
In-Reply-To: <20200415145110.20624-1-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 29 Apr 2020 10:27:39 -0700
X-Gmail-Original-Message-ID: <CAE=gft5REvz+0JLHtEN1BXmvWzMxftdecxPedLizgS47x1Sq7w@mail.gmail.com>
Message-ID: <CAE=gft5REvz+0JLHtEN1BXmvWzMxftdecxPedLizgS47x1Sq7w@mail.gmail.com>
Subject: Re: [PATCH 0/2] Drop all accesses to MPSS PERPH register space
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Ohad Ben Cohen <ohad@wizery.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Apr 15, 2020 at 7:51 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> 7C retail devices using MSA based boot will result in a fuse combination
> which will prevent accesses to MSS PERPH register space where the mpss
> clocks and halt-nav reside. Hence requesting a halt-nav as part of the
> SSR sequence will result in a NoC error. Issuing HALT NAV request and
> turning on the mss clocks as part of SSR will no longer be required
> since the modem firmware will have the necessary fixes to ensure that
> there are no pending NAV DMA transactions thereby ensuring a smooth
> SSR.
>
> Sibi Sankar (2):
>   dt-bindings: remoteproc: qcom: Replace halt-nav with spare-regs
>   remoteproc: qcom_q6v5_mss: Drop accesses to MPSS PERPH register space

I haven't tested things in the "production" fuse configuration yet,
but in my current configuration I've got a tree that's running the
modem well.

Tested-by: Evan Green <evgreen@chromium.org>
