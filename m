Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30310C432BE
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Aug 2021 20:17:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C4B0613D0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Aug 2021 20:17:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbhHWUR7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 23 Aug 2021 16:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232152AbhHWURx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 23 Aug 2021 16:17:53 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8864C061757
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Aug 2021 13:17:09 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso28406193ots.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Aug 2021 13:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=hVoTBJgxiKrAAxs2kw7pKYP96oVapuaGPjHNMkt5DsM=;
        b=nPAUVz1zgsicbUYoh1+uu07rJW/yYYJnyQm6mv/Lf1y+TZRUYzlBntQIOSf/m9UCgS
         pgMMqimYDwdwCK8xIw+ec77wUdXIbZzcCmp/lonOm3Gfs88Y26DCoL8WJCNcifr/yHwn
         ST5zJ9+uslgeY4qfI9P11vfKySi53c5VQ8o3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=hVoTBJgxiKrAAxs2kw7pKYP96oVapuaGPjHNMkt5DsM=;
        b=TtPE80RNghDn+fB1T13O/NzNgyMnho/uMdDc5kxUDm+w0E0eCmer38Ojarwj3dtM7k
         cEIymsomhIi0vscuqHEcFlkVZgIICXeXGd4ju3URI1j9R777hxSEznQz4TR0ttX5qlvj
         SBdsKWxU02BSCkwa1EMUNjfcBmSOz6soP5YqnVznSK3bRm79+W8+qzmhs4oJmwGvGJtb
         HnnKtrpXxyCSdZpsISNq7Lu8dBnDStyHIaxIQWC9hRP8BMRzXHj/VvVsx7Pre5Tjwfnk
         tSvaXquiu+0P6Ih80l/eZEPFdcRFDZvebRrNoPJHYTZeSiYK0ROJ+VqZz/Fa1biNOD/x
         fnMA==
X-Gm-Message-State: AOAM532blFAw0t561zT584y8QLA5kK1wcHKh4SsVyNoqsUKAVOcmG1VM
        6HcYvXonbEAzbV12QJa4mhrmrox/CL4CUTC+aCkRqw==
X-Google-Smtp-Source: ABdhPJynbPwA9l4zM0sKHZxjgU5UhlLpncIQzB/q85jP+MW1t7Vxo8yeQ+Un7WiJHwAqDBlBF3iPLQgltj28BRCVUhw=
X-Received: by 2002:a05:6808:180e:: with SMTP id bh14mr251263oib.19.1629749829301;
 Mon, 23 Aug 2021 13:17:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Aug 2021 15:17:08 -0500
MIME-Version: 1.0
In-Reply-To: <1629342136-3667-5-git-send-email-sibis@codeaurora.org>
References: <1629342136-3667-1-git-send-email-sibis@codeaurora.org> <1629342136-3667-5-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 23 Aug 2021 15:17:08 -0500
Message-ID: <CAE-0n52ujxNX-qT1oQJup+iHA6dSwmKoMK0eqdSg-=ZTRXD1ZQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/13] remoteproc: qcom: q6v5: Use qmp_send to update
 co-processor load state
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2021-08-18 20:02:07)
> The power domains exposed by the AOSS QMP driver control the load state
> resources linked to modem, adsp, cdsp remoteprocs. These are used to
> notify the Always on Subsystem (AOSS) that a particular co-processor is
> up/down. AOSS uses this information to wait for the co-processors to
> suspend before starting its sleep sequence.
>
> These co-processors enter low-power modes independent to that of the
> application processor and the load state resources linked to them are
> expected to remain unaltered across system suspend/resume cycles. To
> achieve this behavior lets stop using the power-domains exposed by the
> AOSS QMP node and replace them with generic qmp_send interface instead.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
