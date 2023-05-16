Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C7EC7EE2D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 16 May 2023 20:48:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjEPUss (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 16 May 2023 16:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbjEPUsp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 16 May 2023 16:48:45 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74181E56
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 May 2023 13:48:42 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-64359d9c531so10901779b3a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 16 May 2023 13:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684270122; x=1686862122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qKaehGbAc8k6lY0qnWn8D9TG/mOHGPGNlxmLWsJ8N2Y=;
        b=m6g7gvRdMU7jCzC8ARN7/pLJ8/l0HGcYN/ecQrFL8r6qefKpx+LlryT1s0VBLOvMZ/
         8NGvHStpsS98vJ+5X8QuR+LLHskGF4taS+69JCYVhI4JGkbJjHZiVnom/4YDXAnLj1P4
         OLWTwUgV6aPnyWwNie4y3u1jK4ODcfvyk3iII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684270122; x=1686862122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKaehGbAc8k6lY0qnWn8D9TG/mOHGPGNlxmLWsJ8N2Y=;
        b=a1vaPU33nmG0yZIROSPffKP3iw+LiiYHD4M44T28CZi0HRT01Lx9uWnqPjpFRlX08m
         Ao9thZOYqoWgdR1SNxRt2X6pb6X5x8cjZmowBcQRyYvvlrNI7j9eoKeBz6PQsBDL4mf4
         +LT0Xd0u+XXduxkAXnuDvnyL3ee9XadZi3dMrOk9lvst08mh+I+RkIpAXgkxahTFwYBx
         ZkfT0mY9TrlRVhXznJOTzuHz19BV8nTg2kamsBMBMHWVSw75Q5EgALOQnM62rQxZpE8e
         fRTpfLFRijx48Nqa5l8DjumfB1eck/oV3fBOggROR6MMHqEDJV1zLBUXgt/5dmQe2kDp
         XuPA==
X-Gm-Message-State: AC+VfDy0h7OE4XZJG3yLyIVDjv+Iz7JAKj0yztXfK1woxftE4NoBpmK3
        f2Hfne3UFcImU2RKq2yqYCRzHw==
X-Google-Smtp-Source: ACHHUZ5ctGEO5DTWH2umfiLzjQSQOYpVnHxq7Fzxd0iVp6cTAQyPJzA4ndkUWCok1pjUTqLN+PoZKQ==
X-Received: by 2002:a05:6a00:189a:b0:646:7234:cbfc with SMTP id x26-20020a056a00189a00b006467234cbfcmr43536436pfh.27.1684270121976;
        Tue, 16 May 2023 13:48:41 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p24-20020a62ab18000000b0063b5776b073sm13857047pff.117.2023.05.16.13.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 13:48:40 -0700 (PDT)
Date:   Tue, 16 May 2023 13:48:39 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Luca Stefani <luca.stefani.ge1@gmail.com>
Cc:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, corbet@lwn.net,
        tony.luck@intel.com, gpiccoli@igalia.com, catalin.marinas@arm.com,
        will@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, srinivas.kandagatla@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 09/18] soc: qcom: Add qcom's pstore minidump driver
 support
Message-ID: <202305161347.80204C1A0E@keescook>
References: <1683133352-10046-1-git-send-email-quic_mojha@quicinc.com>
 <1683133352-10046-10-git-send-email-quic_mojha@quicinc.com>
 <e25723bf-be85-b458-a84c-1a45392683bb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e25723bf-be85-b458-a84c-1a45392683bb@gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, May 09, 2023 at 06:06:26PM +0200, Luca Stefani wrote:
> 
> On 03/05/23 19:02, Mukesh Ojha wrote:
> > This driver was inspired from the fact pstore ram region should be
> > fixed and boot firmware need to have awarness about this region,
> > so that it will be persistent across boot. But, there are many
> > QCOM SoC which does not support warm boot from hardware but they
> > have minidump support from the software, and for them, there is
> > no need of this pstore ram region to be fixed, but at the same
> > time have interest in the pstore frontends. So, this driver
> > get the dynamic reserved region from the ram and register the
> > ramoops platform device.
> > 
> >   +---------+     +---------+   +--------+     +---------+
> >   | console |     | pmsg    |   | ftrace |     | dmesg   |
> >   +---------+     +---------+   +--------+     +---------+
> >         |             |             |              |
> >         |             |             |              |
> >         +------------------------------------------+
> >                            |
> >                           \ /
> >                    +----------------+
> >              (1)   |pstore frontends|
> >                    +----------------+
> >                            |
> >                           \ /
> >                   +------------------- +
> >              (2)  | pstore backend(ram)|
> >                   +--------------------+
> >                            |
> >                           \ /
> >                   +--------------------+
> >              (3)  |qcom_pstore_minidump|
> >                   +--------------------+
> >                            |
> >                           \ /
> >                     +---------------+
> >              (4)    | qcom_minidump |
> >                     +---------------+
> > 
> > This driver will route all the pstore front data to the stored
> > in qcom pstore reserved region and the reason of showing an
> > arrow from (3) to (4) as qcom_pstore_minidump driver will register
> > all the available frontends region with qcom minidump driver
> > in upcoming patch.
> > 
> > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> [...]
> > +static struct qcom_ramoops_config default_ramoops_config = {
> > +	.mem_type = 2,
> > +	.record_size = 0x0,
> > +	.console_size = 0x200000,
> > +	.ftrace_size = 0x0,
> > +	.pmsg_size = 0x0,
> > +};
> 
> This is effectively hard-cording the configuration of ramoops.
> 
> Since the memory range is dynamic and by itself doesn't impose any
> limitation this should be configurable in the device-tree, like a standard
> ramoops entry backed by a memory range.
> 
> I think this should provide the same interface/knobs as pstore-ram does,
> unless there's some known limitations to minidump, in which case those
> should be expressed.

Yeah, I had the same thought reading this myself. Beyond that, it looks
fine as a way to let pstore know about a new RAM backend.

-Kees

-- 
Kees Cook
