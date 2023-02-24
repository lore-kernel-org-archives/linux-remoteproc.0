Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54AEDC7EE2D
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Feb 2023 19:07:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjBXTHD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 24 Feb 2023 14:07:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbjBXTHC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Feb 2023 14:07:02 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91B21B2FE
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Feb 2023 11:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677265572;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TO32MmHRC5X6hVdeytKpEjQuFgiB4c62vSXkbsV3be0=;
        b=exJ3XtvNyj8288WnwA5Jqrw0Yj1bVnLY5cxEfjcj5uN1EWnXocRZHuQrcP7mMSSFBTEnYg
        cA2HbF7ddEcXEx7BwMr6AM4bvwDNEKFaycG18o4+UlsQbWqW5Z8fkbS39f5UBrBNBRBMHs
        mR+8M44a0HUqDbaI2X1s6xHUPEL4mFY=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-455-cwbiSjR-MpC34TgFptzMIQ-1; Fri, 24 Feb 2023 14:06:11 -0500
X-MC-Unique: cwbiSjR-MpC34TgFptzMIQ-1
Received: by mail-io1-f69.google.com with SMTP id g7-20020a056602242700b00745a4e97ce7so9593564iob.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Feb 2023 11:06:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TO32MmHRC5X6hVdeytKpEjQuFgiB4c62vSXkbsV3be0=;
        b=AaGu2KZtDgPqlR+ZVkBtLHH9gQvpY986smgIPS7GCGwQaJiVy2adaH0lfNpBcmproU
         xjgbNmo0xuQ67IIjBjGBnYSf9GOxMiTNxQy0V8ZcYAdYFC35Tz9Dh3bxx06insEmF3DW
         CJaqmA9R1ae9faM5tDNVduIu9ovkEOE5SYWGcaxVFxzSeIaDRvWoiXcBqHU5s+zYbKIp
         2GEPlqbCc4TJTSCZZAgINTnjmIMgfFlwCYX8uhS5NeLH1rdsrRN9cZ4gY1OrEdILaO8B
         Z9tQnfeeuBaUDArPKjBM8/oGvY43boV8ilxsgT6lTJB0k3mw0S62lP9WMw+8TbvCRvO3
         cDEg==
X-Gm-Message-State: AO0yUKXU0IPD2qwbmaS+sO2wKN7ZIdaSFfgJZHDf3XsTnku21NEBUnAS
        /cM/ybpyepHg0Dn8MMisC/aAJ/60hGXc7r0n2/cfaubka+9Info2fMryZMqC+3hvlQofDHlWJyy
        qM88yRLf6xvUccgt3Xljej5fX/5kE6g==
X-Received: by 2002:a05:6602:200f:b0:74c:bc54:def6 with SMTP id y15-20020a056602200f00b0074cbc54def6mr790436iod.16.1677265571053;
        Fri, 24 Feb 2023 11:06:11 -0800 (PST)
X-Google-Smtp-Source: AK7set9/Pv5CyL/4mD4A9Y4Q/LVOJsbK7o9jmpBuvUza9YaJUBhEetobrRKdqPedvvHaEaB9J1UmPg==
X-Received: by 2002:a05:6602:200f:b0:74c:bc54:def6 with SMTP id y15-20020a056602200f00b0074cbc54def6mr790426iod.16.1677265570885;
        Fri, 24 Feb 2023 11:06:10 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id l5-20020a6b7b05000000b0073f8a470bacsm24221iop.16.2023.02.24.11.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 11:06:09 -0800 (PST)
Date:   Fri, 24 Feb 2023 14:06:07 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
        catalin.marinas@arm.com, will@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 0/6] Add basic Minidump kernel driver support
Message-ID: <Y/kKn9tnvSQ2Pacn@x1>
References: <1676978713-7394-1-git-send-email-quic_mojha@quicinc.com>
 <Y/deHzijzvuvCJ2M@x1>
 <47542dbb-8cf3-6eae-a38e-910d38bd960b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47542dbb-8cf3-6eae-a38e-910d38bd960b@quicinc.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mukesh,

On Fri, Feb 24, 2023 at 04:10:42PM +0530, Mukesh Ojha wrote:
> On 2/23/2023 6:07 PM, Brian Masney wrote:
> > I'd like to test this series plus your series that sets the multiple
> > download modes.
> 
> Sure, you are welcome, but for that you need a device running with Qualcomm
> SoC and if it has a upstream support.

I will be testing this series on a sa8540p (QDrive3 Automotive
Development Board), which has the sc8280xp SoC with good upstream
support. This is also the same board that I have a reliable way to
make the board crash due to a known firmware bug.

> Also, testing of this patch needs some minimal out of tree patches and
> i can help you with that.

Yup, that's fine. Hopefully we can also work to get those dependencies
merged upstream as well.

Brian

