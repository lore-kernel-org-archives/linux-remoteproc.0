Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33700C49EA7
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Jun 2021 23:43:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1630161584
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Jun 2021 23:43:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhFYXph (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 25 Jun 2021 19:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbhFYXpg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 25 Jun 2021 19:45:36 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE68C061574
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jun 2021 16:43:14 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id e22so9472476pgv.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jun 2021 16:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/tFwR7u39ByTSDGSuf//RmhtSs5n61e7tjCidDAHEwU=;
        b=RtBmoR+o0L7Hzxra1hLP2nxzrIVAlfQNEBpxtpYfAms4bgYwYHn5I8wl0fcGynUBOR
         CprjBqiQwWKxZKoZNJKf7V6eJGjvC5Bnnif+frB0UxnAIi4451e1B3mY0WPm9RSmBCgE
         s6T/3mZC1cmzh1zMy6LIZauKGbQDdv5WCboCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/tFwR7u39ByTSDGSuf//RmhtSs5n61e7tjCidDAHEwU=;
        b=Z3c+ZQmnE2KP2m3nHVEJVYyUUAH3rW8y9CBzl/oV7Z5d/vmzWXJnF6O4b9+t6JJ8lj
         pE9qTB5nsEQOwlDpXlqHzYwXJJ0SuH1v14mkAqv9wlYdPsp9YFyeUWLIcI1jJ7d6p2jF
         OeS5S/LSZhBi8iykhxTi7Y5qgpjIrSCa6MNYGjwJFqqqwSJwB5YpNm4lAxyTnfweJ9g8
         Idr12hGPhP1k+NrKdhJ/A2RcHFjM6q4w1mBWtkW74acbVsKUTdwCqw8uXVnoq/EB6np1
         DCtF2I6pbYlFsYkxqrZ/Bhz62txw8aFd2JauuyL8XX1/j5FRojM1DlPpTlAeT38EZo0/
         k6XQ==
X-Gm-Message-State: AOAM531x71b2cKXfO2y7WPqntBOjJPq77lZrLV1DLUCkR1Yew20C5jma
        fEosfg5qNIQrpE3mDJ/2Rxd2TQ==
X-Google-Smtp-Source: ABdhPJxlOQFys+rH3219mQAN5WMqnrAmi9ACXYgGQabbwpyt5J3mNtJJYkQlBWDGLf/NjU4opG00Vw==
X-Received: by 2002:a05:6a00:17a5:b029:305:d4e8:7391 with SMTP id s37-20020a056a0017a5b0290305d4e87391mr13299524pfg.0.1624664594337;
        Fri, 25 Jun 2021 16:43:14 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:cc13:a7dd:f4b5:2160])
        by smtp.gmail.com with UTF8SMTPSA id p38sm5497835pfh.151.2021.06.25.16.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 16:43:13 -0700 (PDT)
Date:   Fri, 25 Jun 2021 16:43:12 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH 3/9] dt-bindings: remoteproc: qcom: Add Q6V5 Modem PIL
 binding
Message-ID: <YNZqEJxp9dZUJe5U@google.com>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-4-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1624564058-24095-4-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jun 25, 2021 at 01:17:32AM +0530, Sibi Sankar wrote:
> Add a new modem compatible string for QTI SC7280 SoCs and introduce the
> "qcom,ext-regs" and "qcom,qaccept-regs" bindings needed by the modem
> sub-system running on SC7280 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt   | 32 ++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> index 494257010629..d802e57701b8 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
>
> ...
>
> @@ -208,6 +218,24 @@ For the compatible strings below the following phandle references are required:
>  		    by the offset within syscon for conn_box_spare0 register
>  		    used by the modem sub-system running on SC7180 SoC.
>  
> +For the compatible strings below the following phandle references are required:
> +  "qcom,sc7280-mss-pil"
> +- qcom,ext-regs:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: two phandles reference to syscons representing TCSR_REG and

s/phandles reference/phandle references/

> +		    TCSR register space followed by the two offset within the syscon

s/offset/offsets/

> +		    to force_clk_en/rscc_disable and axim1_clk_off/crypto_clk_off
> +		    registers respectively.
