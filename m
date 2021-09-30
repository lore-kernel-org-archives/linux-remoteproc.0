Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6416BC433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Sep 2021 16:22:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A21D615A7
	for <linux-remoteproc@archiver.kernel.org>; Thu, 30 Sep 2021 16:22:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350341AbhI3QYe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 30 Sep 2021 12:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350259AbhI3QYd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 30 Sep 2021 12:24:33 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6463C06176D
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Sep 2021 09:22:50 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id o59-20020a9d2241000000b0054745f28c69so7964811ota.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Sep 2021 09:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=6JOJ3EzXibHBz+PFm5P3PVsToORWoURbVfdbR5q2uJQ=;
        b=D7QDulUKa1aB6PdkqySm1m5bEmJyKIDF38dyHFaMrv0zr0itz25rcJJo2k3VufY7F3
         zD0eOdwWRwB0Mf6RaIhhhO1eTqTgDD2gcENM17zHGKHPwQ+G60V5MDYbIOPhc02V50P1
         JzNlYsX1Pl4FPChvo069Tw1Sgf3DpjsB5/FTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=6JOJ3EzXibHBz+PFm5P3PVsToORWoURbVfdbR5q2uJQ=;
        b=2B3bvhpGjmri0LNvWjrWqKQpnbEmhprbhQH5ovF66zlVaj1TLxhYqzxp1VRGgPoO4/
         PXRPUEQsDtnpCU+vigJ2yH3xnguMUm4UYJsDkzCOz8bNuAUdOMdWNgC3/8FVXFZ/WG72
         UO6vpuI7Q0s6RTHnyPzkzN52ZNPDgaKppo81Tb3cvT+IA2i4VE7DkXJrMYv8mzzQGuYc
         ZvFsw16Zf56H8fBsoffoqFjyheOWxH6BJ1z2CWZFVC3lsCIuzt1EGfgR5isg8TwXhDXJ
         B7SuNCl3BdrxrZg/WkG4KffjutzwnFZ166Nac97wBZShsg47GvxKnFLzSdA0tgXbowSc
         u5eQ==
X-Gm-Message-State: AOAM533B68WHfaEpTN/FEyFmB9uI27UW9k/l87nrzHO4ja9JjrOA31B+
        wB5Qs6+VvB8lRGv20HbkdpeD/6aizyZZy9F+0075sA==
X-Google-Smtp-Source: ABdhPJx7ptDIuvylE+BRjgNIoijnMA94qMRA1bTHSAL3U36GQnJkKvkB5p/hKcN9wlfOnqgQBbuoFd5GfTFUmIm3spk=
X-Received: by 2002:a05:6830:708:: with SMTP id y8mr5951403ots.77.1633018969821;
 Thu, 30 Sep 2021 09:22:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Sep 2021 09:22:49 -0700
MIME-Version: 1.0
In-Reply-To: <1633015924-881-2-git-send-email-deesin@codeaurora.org>
References: <1633015924-881-1-git-send-email-deesin@codeaurora.org> <1633015924-881-2-git-send-email-deesin@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 30 Sep 2021 09:22:49 -0700
Message-ID: <CAE-0n51KgP1Jc4=eue3xT3=YfwYjdWk7+MOwNrw_FYZ_iX76mA@mail.gmail.com>
Subject: Re: [PATCH V1 1/3] rpmsg: core: Add signal API support
To:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org,
        mathieu.poirier@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Deepak Kumar Singh (2021-09-30 08:32:01)
> Some transports like Glink support the state notifications between
> clients using signals similar to serial protocol signals.
> Local glink client drivers can send and receive signals to glink
> clients running on remote processors.
>
> Add apis to support sending and receiving of signals by rpmsg clients.

s/apis/APIs/

>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
[...]
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index 9151836..5cae50c 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -327,6 +327,24 @@ int rpmsg_trysend_offchannel(struct rpmsg_endpoint *ept, u32 src, u32 dst,
>  }
>  EXPORT_SYMBOL(rpmsg_trysend_offchannel);
>
> +/**
> + * rpmsg_set_flow_control() - sets/clears searial flow control signals

s/searial/serial/

> + * @ept:       the rpmsg endpoint
> + * @enable:    enable or disable serial flow control
> + *
> + * Returns 0 on success and an appropriate error value on failure.

Use 'Return:' instead of Returns.

> + */
> +int rpmsg_set_flow_control(struct rpmsg_endpoint *ept, bool enable)
> +{
> +       if (WARN_ON(!ept))
> +               return -EINVAL;
> +       if (!ept->ops->set_flow_control)
> +               return -ENXIO;
> +
> +       return ept->ops->set_flow_control(ept, enable);
> +}
> +EXPORT_SYMBOL(rpmsg_set_flow_control);
> +
>  /*
>   * match a rpmsg channel with a channel info struct.
>   * this is used to make sure we're not creating rpmsg devices for channels
