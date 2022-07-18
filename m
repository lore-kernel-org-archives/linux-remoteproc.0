Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EFFC433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jul 2022 07:06:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233737AbiGRHGh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jul 2022 03:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233734AbiGRHGf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jul 2022 03:06:35 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D92C01659E
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 00:06:33 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id x23-20020a05600c179700b003a30e3e7989so4579365wmo.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 00:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZI+psl62KRHu+/xwUEa944NIpr8bwJMp0OVmnA0Tjtw=;
        b=iVQrWs3MRYym3WpQlxcZbyUTbB9NgDt540mGZaeASrif4xJJL0ZP16Gs+toxe7etRI
         elH6zhBeYGG0nIgbpXOGPXQpHNTxrE5ylPKniMAJduz9p3niY2iqxrc+r2rHmA1QUoJx
         AsQ5F8jh9xxgn+fJFqhKThhEh/XpE78Z4mWKFskKXGhogvOxOM67Sf8qFCgjgJgLPey9
         Adlz81DQt6k/g1/kfkp5VkC5KczOL8/CTFOlFVihAO8ijGM88Wo9zDoqu2t8IAVUAP9u
         YJiGmHmOqAnlo+R+8m4PL/UvAxoOykmx29qCuJsjKlK9bIZ9Z5AQKuvnJPAjFbAR5NKa
         cxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZI+psl62KRHu+/xwUEa944NIpr8bwJMp0OVmnA0Tjtw=;
        b=iRS8QjOQovMRD+tlUKFA/xzisaqS1AeQpjXWAv6A/eXszF4GgPGliALuP2JAW3Vw9U
         2Cq/o0Gun0up/gmBgZwBOBzufxpHUbg5izJFaWExTMJVLuvK9tlrlQNfurv0YGyFmE47
         c6bUZpUI108nKD6bLBj9So7+HyS0KjOMT6FD59sfEoRTeFoIepTueitaArlSz6zE4tR2
         TpreZFeTp6yDSy9PzD6CC2sI74ASGEv/yTfYA0EHYzsE2OI45IK86I54KhQQ6XdzvqVw
         B+5qbWuDliFPCBklV50/1UbcpSDrdUlWvWhTdzhX4nSP9CCDbHZSMv4OFXVefCOKv0dk
         E0mg==
X-Gm-Message-State: AJIora/KpPhd09ReNtpgGdZEh0ag51yquyLJZubzjvx4SKrqiV5obWr0
        vhVBtTEvo8fwcjTNOlEbFKrMEQ==
X-Google-Smtp-Source: AGRyM1saJthbQ+1R+t0bpM3h/3M+zTnIoBp23gV23NDFQGiwJecHu1D+2hA54oDOtG4e1bYSU71yoQ==
X-Received: by 2002:a05:600c:1c88:b0:3a3:10b6:e844 with SMTP id k8-20020a05600c1c8800b003a310b6e844mr10970188wms.155.1658127992443;
        Mon, 18 Jul 2022 00:06:32 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id z5-20020a5d6405000000b0021b966abc19sm9914954wru.19.2022.07.18.00.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 00:06:31 -0700 (PDT)
Date:   Mon, 18 Jul 2022 10:06:30 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] remoteproc: qcom: q6v5: Use _clk_get_optional for
 aggre2_clk
Message-ID: <YtUGdmyUoMc3Hro1@linaro.org>
References: <20220714104309.4111334-1-abel.vesa@linaro.org>
 <YtOHOptMSAzHfm7a@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtOHOptMSAzHfm7a@builder.lan>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 22-07-16 22:51:22, Bjorn Andersson wrote:
> On Thu 14 Jul 05:43 CDT 2022, Abel Vesa wrote:
>
> > There is devm_clk_get_optional now, so lets drop the has_aggre2_clk
> > from adsp_data.
>
> I like this patch, but for the history, could you please provide a
> reason why you would like to do this?

Sure, I'll reword it and resend.

Thanks,
Abel

>
> Regards,
> Bjorn
>
> >
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 41 +++++-------------------------
> >  1 file changed, 7 insertions(+), 34 deletions(-)
> >

...
