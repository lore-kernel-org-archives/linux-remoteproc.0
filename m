Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCBAC4320A
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Jul 2021 18:25:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61CF560F94
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Jul 2021 18:25:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbhG3SZI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Jul 2021 14:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbhG3SZI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Jul 2021 14:25:08 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66CA1C0613D3
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jul 2021 11:25:02 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 19-20020a9d08930000b02904b98d90c82cso10487518otf.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jul 2021 11:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XpB+LNmPBgnS5Lf6x+b5cG5d1sMq85HwbCnNpZE2zYo=;
        b=FLU28j8+ohjlgupR219GFzrIl9IH9/YzqxQJSUxHtE5VtGLhrgsFSje8to6mUj/aga
         x8nInA/4b1SZwqh/E285vMfeKvkbUkoZiHeV5oxS8JUVQLxRozEbb1HUzzi845CHrDBt
         bH1RLWLP2fGKQKmFMPdNozclJavXJ1RtQ9W1Ruat6YfxfmKna0mnbxpgJnpnz+MApimw
         JFI1/pM187pK04w61eo5JjNf2ZlDqDzDfs7YLwOWOmHFCAK24b6vFe2/nSOx/nPPc7fP
         IASY8hUWbtG53IMu3z7y0g2dS8huQ1EQq2BfmjIjTt84iWoT2Jk2MUoYLWoy37YbYT79
         fwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XpB+LNmPBgnS5Lf6x+b5cG5d1sMq85HwbCnNpZE2zYo=;
        b=RgHkpMYeNIBt8P97Gn7KtSvVy93Z+UXkJVWtx0dr1TwVDzyz9RXBeNomwlgWluxzd1
         sVZHRTFWIvsTYytJdfYFIMOO2a3XZQeWPLl9y0F5AjjXHtDaT4a9YDjzEarlW3Oii6Ql
         RYPgcqK1twI+X8XsctmEKKrMi1le68g8s+5mVTTnvnOQWeT2EzXhbomj3O+yOAZk43Hq
         sLaidCtdj3YceCRNlZkPPJBt8sNQoI7Xb+X/gxXTDMUQLdauiMOq2bvAWB0M/nhtmrxp
         YOKecpX+N+t/8aZWGKipVl7LtclSu01DUQgTDYMsSyQIOfLstmdIWGg6UjXEXAMvt1gE
         DM9Q==
X-Gm-Message-State: AOAM531swDwGjHyvVuJhIT5UQF6IEIjbMDmM+++NLj+CWCZN2GB+fReT
        Ehr08cXfY1YFj7FgYPGqzk2LBg==
X-Google-Smtp-Source: ABdhPJx4vNZHT6X7wQKRFb2JUuvmKANycbmxpNeZfUiQDWntbLArDTfaRDIDFIss/nuk9dA3LyoMKw==
X-Received: by 2002:a05:6830:25c6:: with SMTP id d6mr3126063otu.226.1627669501571;
        Fri, 30 Jul 2021 11:25:01 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i10sm357103ood.48.2021.07.30.11.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 11:25:01 -0700 (PDT)
Date:   Fri, 30 Jul 2021 13:24:58 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>, robh+dt@kernel.org,
        will@kernel.org, saiprakash.ranjan@codeaurora.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH 6/9] arm64: dts: qcom: sc7280: Update reserved memory map
Message-ID: <YQRD+va2mn9e+QKJ@builder.lan>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-7-git-send-email-sibis@codeaurora.org>
 <YNoQ1d1hUyIh/qxz@google.com>
 <f74c03b939dfd83a1013906e1c771666@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f74c03b939dfd83a1013906e1c771666@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 30 Jun 15:02 CDT 2021, Sibi Sankar wrote:

> On 2021-06-28 23:41, Matthias Kaehlcke wrote:
> > On Fri, Jun 25, 2021 at 01:17:35AM +0530, Sibi Sankar wrote:
> > 
> > > Subject: arm64: dts: qcom: sc7280: Update reserved memory map
> > 
> > That's very vague. Also personally I'm not a fan of patches that touch
> > SoC and board files with a commit message that only mentions the SoC, as
> > is frequently done for IDP boards. Why not split this in (at least) two,
> > one for adding the missing memory regions to the SoC, and one for the
> > IDP.
> > 
> 
> sure will split this up.
> 
> > > Add missing regions and remove unused regions from the reserved memory
> > > map, as described in version 1.
> > 
> > What is this 'version 1'?
> 
> lol, it's the memory map version number
> and it's not entirely internal to qc so
> we have been mentioning them in commit
> messages from older SoCs. I'll just drop
> it when I re-spin the series since it
> doesn't add much value.
> 

Every now and then we run into issues with the reserved-memory layout,
where knowing were the numbers comes from is useful information to have
in order to characterize the issue and come up with a fix.

So including information about where those numbers came from is useful,
even if it's referencing a version of a document that's not public.

Regards,
Bjorn
