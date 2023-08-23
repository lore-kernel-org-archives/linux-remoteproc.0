Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0435EE4993
	for <linux-remoteproc@archiver.kernel.org>; Wed, 23 Aug 2023 16:15:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237514AbjHWQPH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 23 Aug 2023 12:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237508AbjHWQPB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 23 Aug 2023 12:15:01 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E83A7CD6
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Aug 2023 09:14:57 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bc0d39b52cso39161635ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Aug 2023 09:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692807297; x=1693412097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8A/P3S0wlGvOFrIoyW6NofOR0/05AqKGdBHOUkSrpAM=;
        b=hg1di2oGsg378PRSaPxIZusBjwDBUDLTdEkZFDYP2Of6rHlIX2JjjSrBVm42769exW
         FEjKLUXXXULlExqvezYnE9D1ZGpz6kLLE2uV2UMfK6OSEUUhbuxZt/Eobe7B/tHInxNC
         YqV9sNnLk5B2c94nqPuBMTv11uwv2uvOQqeH7wh67+lzhLEuatPeBnQnMnQ1pSaiLxgo
         cr48xpxd5D/Ar+qqMZPKFN5O5HKhLUw5eDZy/v00Ac8jZDCLjYuBf8I6EnBvbaQieSGv
         XK5NIm4Pt6uZnFfB1VLRkQ0hDr1Mc9bP7Fc7tSTBXOWRJVmp+zetGVbI+TySyKXXK06f
         qanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692807297; x=1693412097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8A/P3S0wlGvOFrIoyW6NofOR0/05AqKGdBHOUkSrpAM=;
        b=C4S/uSGKyYQGZr23YzwuglL7dKyJWaIQ4ADct8XLxeJKPh9DwCqJVtIVrNoh/hYnUQ
         6dA2i7c9afqlgaUlJDLYbwI/axKGfWsYUBJ5yttpEuRY7BIb65m50uZbKC3AVEKK4z7b
         r3n+7TbspSmLjEXd8W4Rw6kWFSq6rlXoabuewpX9NnVsFgcqLd1El0SAToWH8Y1Hl5De
         e9GBKIY+v3XOgss4QesUQFroxwPBIMWztbQKSgQokMs16ZOJ+DCL0pdVYqkjdojjJQQw
         9aXHX+Ez/v7/s5TrfgqnoNPk9HDCmgkbUCqdNxGoZYorS04Xhc1qxEKGfalnufyWaXA2
         z8mw==
X-Gm-Message-State: AOJu0Yxbem2QttM0hHyIWRjwplfTu4fWiTO2xfvd2oAJnvD2SsJgSubH
        QoXyrcmH/s3lFsSoMEVCJUBMbw==
X-Google-Smtp-Source: AGHT+IEvpisLHKbyW5DU1s30iuL8p35urQj22UBAjH27rETRdOfzRBtUAJHS6h3kObPUzU7prztXHw==
X-Received: by 2002:a17:902:b782:b0:1bf:22b7:86d with SMTP id e2-20020a170902b78200b001bf22b7086dmr10222957pls.3.1692807297139;
        Wed, 23 Aug 2023 09:14:57 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3ae3:a477:fe1c:f18c])
        by smtp.gmail.com with ESMTPSA id bh2-20020a170902a98200b001b9cea4e8a2sm11096564plb.293.2023.08.23.09.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 09:14:56 -0700 (PDT)
Date:   Wed, 23 Aug 2023 10:14:54 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Daniel Baluta <daniel.baluta@gmail.com>
Cc:     "S.j. Wang" <shengjiu.wang@nxp.com>,
        Iuliana Prodan <iuliana.prodan@nxp.com>,
        linux-remoteproc@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>,
        Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
        Carlo Caione <ccaione@baylibre.com>
Subject: Re: Discussion about imx_dsp_rproc FW_READY policy
Message-ID: <ZOYwfs0f++QXUJ2j@p14s>
References: <CAEnQRZAHzbCBuYvyTxzLJWmEUw4ytY+F8i_Qk0O9Z3ZW0L1bOg@mail.gmail.com>
 <CAEnQRZCqS4+zaUDrFVcHo+eu-8ko4WC2TQtuG=-b5qeA4YU=ew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZCqS4+zaUDrFVcHo+eu-8ko4WC2TQtuG=-b5qeA4YU=ew@mail.gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Aug 22, 2023 at 05:12:55PM +0300, Daniel Baluta wrote:
> Hi Mathieu, S.J,
> 
> Any comments about this?
>

All the questions raised below have been answered in my exchange with Iuliana,
but I will complement herein. 

> I feel that the Linux kernel driver shouldn't enforce the policy of
> waiting for a reply or confirmation that the firmware booted.
> 

The protocol enacted between a remote processor and the host is very platform
dependent.  The need to wait for a reply in the IMX DSP driver predates my time
as maintainer of this subsystem and as such can't comment on the reasons it
was introduced.  That said I am very disappointed by the complete silence from
S.J and the rest of the people on the linux-imx mailing list regarding this
issue.

> The Linux kernel driver should offer a mechanism for checking this and
> the policy should be set either in userspace or via dts.
>

This has already been discussed.  Adapting the Linux kernel driver for all the
protocols that can be enacted by remote processors doesn't scale.  This is
something that needs to happen in the FW and Iuliana's approach in [1] is
appropriate.

I think the pushback is caused by a lack of understanding of the problem by the
maintainers.

[1]. https://github.com/zephyrproject-rtos/zephyr/pull/61709

> First option would be to have an ioctl but we need to also mirror this
> in the sysfs interface. Second option would be to have a property in
> the dts.
> 
> What do you think?
> 
> We are trying to fix this in the firmware side:
> 
> https://github.com/zephyrproject-rtos/zephyr/pull/61709
> 
> but we are getting some setbacks there too.
> 
> 
> Daniel.
> 
> On Wed, Jul 26, 2023 at 11:26 AM Daniel Baluta <daniel.baluta@gmail.com> wrote:
> >
> > Hello all,
> >
> > I want to start this thread in order to clarify what assumptions a
> > remoteproc driver is able to make
> > about a firmware loaded on a remote processor.
> >
> > Discussion is generated by this thread:
> >
> > [1] https://www.spinics.net/lists/kernel/msg4857733.html
> >
> > imx_dsp_rproc driver assumes that the remote firmware will send a
> > notification once it has booted up and this is the default behavior.
> >
> > This doesn't work well with Zephyr samples which do not send such notification!
> >
> > I want to get an agreement for the following questions:
> >
> > 1) What should be the default behavior of a remote proc driver?
> >
> > In my opinion it should not make any assumption about the remote part.
> > Thus by default the driver should not wait for any message!
> >
> > 2) How can we support various "protocols" of starting up. Eg (wait for
> > firmware / no wait for firmware).
> >
> > In patch [1] Iulia proposed to add a flag that will select the correct
> > behavior. As per Mathieu's comments this doesn't
> > scale up, for next flags.
> >
> > How can we solve this? In my opinion using a kernel module parameter
> > OR a device tree property should be enough.
> >
> > What do you think?
> >
> > thanks,
> > Daniel.
