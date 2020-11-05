Return-Path: <SRS0=+gsc=EL=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B10EC00A89
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Nov 2020 04:55:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C628D2083B
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Nov 2020 04:55:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QybcdYkG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbgKEEzl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Nov 2020 23:55:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbgKEEzl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Nov 2020 23:55:41 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE51C0613D1
        for <linux-remoteproc@vger.kernel.org>; Wed,  4 Nov 2020 20:55:41 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id k3so267176otp.12
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Nov 2020 20:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i6MGr/Kg3VZyORAXNQIPSqeLnV8zx9yqFNyMUoSyDIg=;
        b=QybcdYkGQifdwCUvS6mzcHt5x/ze6Uk+AU8hfeX5CCttAAjMJ9JixZwigksaFEM1U8
         v/okucIqFFVU7VHHDOMk+/vW3ceFa/smhEYZKI3wHU4eN5TPV25FIT14cJgS7Zp7WLmJ
         gcjWURKjGLYBgmYycdwu1V64hbzyatd/3umDLpv/6+FshkDeLD1qJ35IK7KNbXnaMmzR
         SejanBqzPKxCy15mDtB2/KqyQTFGCQD0m/3N29NgrgYBsQyTWF4c0yWAvFBLe4RG+nYD
         3jMfs8d6Njg8jo76DutCptIjzK9ankBp9i7CdLZpoN5UwGUOg/Q4j2mBtdUq8SavqrwZ
         fRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i6MGr/Kg3VZyORAXNQIPSqeLnV8zx9yqFNyMUoSyDIg=;
        b=tDcas1kOeHkG4UDJSfZxSo10DZzAJn19zxMgL1cN4Ad/cQWFlPSaPIc8+XXA00BwC0
         Q1Pj8hxJoPzE98/PiwdOPMly0hdfXiByTuriDkPNMggTcantlx8HZKi7Eya1rHVDNj+E
         k+tdewKFtYPYE60SSwI5QMJQcKgJh/rBJ8fOYieP1iLx78fmggEJWQytRGjU80JHdOLU
         uIO0BnqtLny+dhGmD4l28o32/FTR2qb3rpXEoM/QouDi7DofB9H4vUpQWlA9sUIc2Jvx
         AhraIzvf7+T/kqq+hdJ+VpkSUBcJ+VLQdxOLel0OFCgaPinHBiRapDEYgBsMZ8jCCHP+
         t1dg==
X-Gm-Message-State: AOAM532fN7cTAPgRDyPfFiq2bp0MZL8FQ5U6l1TskKwZTS/J6K0AjHff
        ButMTU8TlDdItMuUCj2aMh1u1Q==
X-Google-Smtp-Source: ABdhPJx8wemuxHJ5PcafcR+3WSW0gpy0QWAV+NsA3hxjXU/Wnf4rhD2zTdNnzBM3zh6Mhoi0OJRe7g==
X-Received: by 2002:a9d:7d87:: with SMTP id j7mr510237otn.356.1604552140570;
        Wed, 04 Nov 2020 20:55:40 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l23sm95998otk.68.2020.11.04.20.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 20:55:39 -0800 (PST)
Date:   Wed, 4 Nov 2020 22:55:38 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-remoteproc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] remoteproc/mtk_scp: surround DT device IDs with CONFIG_OF
Message-ID: <20201105045538.GA29931@builder.lan>
References: <20201102074007.299222-1-acourbot@chromium.org>
 <20201104190547.GD2893396@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104190547.GD2893396@xps15>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 04 Nov 13:05 CST 2020, Mathieu Poirier wrote:

> Hi Alexander,
> 
> On Mon, Nov 02, 2020 at 04:40:07PM +0900, Alexandre Courbot wrote:
> > Now that this driver can be compiled with COMPILE_TEST, we have no
> > guarantee that CONFIG_OF will also be defined. When that happens, a
> > warning about mtk_scp_of_match being defined but unused will be reported
> > so make sure this variable is only defined if of_match_ptr() actually
> > uses it.
> > 
> > Fixes: cbd2dca74926c0e4610c40923cc786b732c9e8ef remoteproc: scp: add COMPILE_TEST dependency
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> >  drivers/remoteproc/mtk_scp.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> > index 577cbd5d421e..f74f22d4d1ff 100644
> > --- a/drivers/remoteproc/mtk_scp.c
> > +++ b/drivers/remoteproc/mtk_scp.c
> > @@ -772,12 +772,14 @@ static const struct mtk_scp_of_data mt8192_of_data = {
> >  	.host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
> >  };
> >  
> > +#if defined(CONFIG_OF)
> >  static const struct of_device_id mtk_scp_of_match[] = {
> >  	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
> >  	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
> > +#endif
> 
> I think it is better to add a "depends on OF" in the Kconfig.
> 

That would reduce the efficiency of COMPILE_TEST, so I would prefer that
we drop of_match_ptr(), which will result in the pointer always being
populated and this being referenced - although unused when built without
OF.

Regards,
Bjorn
