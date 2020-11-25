Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D894C56201
	for <linux-remoteproc@archiver.kernel.org>; Wed, 25 Nov 2020 16:49:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFC76206D8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 25 Nov 2020 16:49:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OcHJ09EG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730911AbgKYQtk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 25 Nov 2020 11:49:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730771AbgKYQtj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 25 Nov 2020 11:49:39 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9586C0613D4
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Nov 2020 08:49:39 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id c80so3545317oib.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Nov 2020 08:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QL3akSi7CovK8xFLb4N+FImnomKdcg6vgs9LyNleNVE=;
        b=OcHJ09EGIDAivRIgljCvTHiVIcq4yQbLYYJoEsxetnFc1Z9X4+JdTWkzivJ9u5+Mod
         +XBIO2SdnyihIHOFGF12cf/dQ4w5x69eeNMYXN/OqHLcC41RvLFh0syE37/H/J0Jwb/+
         Gm+JRx/Dy5vxhT2lv/uW2afo5im7sp8jKZcY1vnRVqlipcvqZnUgsi7LGySP8a0jx5LH
         swMHjHP3rWeZFNj7XkrxzH9FLCk11fCOD4yQIhWfnbRyXdpQj0dZX6UFsCQ7lkcK5rKp
         chBIix/5pf6K/TxzhHd+qOedbxXm+LoGRplRsQ6L9GwE7aIlgis/IPg+OhJKxwESMX66
         mBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QL3akSi7CovK8xFLb4N+FImnomKdcg6vgs9LyNleNVE=;
        b=XxOR7naQq220iJwqfz88QaIVng9I93bcspXEgIGwHiikpPIHU3lbzP5QkP7qmmLacO
         ntDIuikabSkCBAGANaSLXhpXIIyRlWTk8NqY0J1DLOpQf26EfgyfpNEvGvY6QZQX5nNv
         vu358vTTkAA//jGTtqMHuuunJ6dNREAuC1fBZkY91/aLEZhXi3JWXXJr34LXEwPoUc0J
         zi31ghGEDq5n/fofyoOTXXJ4uRw/hIzyqjpg9SjIZr5FQ903BcKF0zIs2qIT36R/AhOl
         qbYy5qzLhlyug3lbYs70rE4FYw+qxRrmIxdalsHDxwYJW7swftXHoTV3Tt/rIckXtJmp
         2iJA==
X-Gm-Message-State: AOAM531uyzqAD5yBtTq2vbhcpdFLJ3r0E31UUbD3XaUt110D0vxat/6s
        cdpya71wR8fybwnp1T0kBtFX8A==
X-Google-Smtp-Source: ABdhPJwWZANLZngkkDy+IE9KKoGOUmig/2ErpvowYqcPqiGa+lThG7DT0k8GdPMxsAe4UgrGmnVLhg==
X-Received: by 2002:aca:c46:: with SMTP id i6mr2833450oiy.82.1606322978980;
        Wed, 25 Nov 2020 08:49:38 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m29sm1439194otj.42.2020.11.25.08.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 08:49:38 -0800 (PST)
Date:   Wed, 25 Nov 2020 10:49:36 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Souptick Joarder <jrdr.linux@gmail.com>
Cc:     kernel test robot <lkp@intel.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-remoteproc@vger.kernel.org
Subject: Re: [linux-next:master 2224/7715]
 drivers/remoteproc/mtk_scp.c:755:37: warning: unused variable
 'mt8183_of_data'
Message-ID: <X76LIAy1kMKydnc0@builder.lan>
References: <202011242358.oKOU8SIP-lkp@intel.com>
 <CAFqt6zZekYGmkDrANsCrRs3Z5DMhCUqA-yi9ipC6JRYTvGfE5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFqt6zZekYGmkDrANsCrRs3Z5DMhCUqA-yi9ipC6JRYTvGfE5w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed 25 Nov 09:24 CST 2020, Souptick Joarder wrote:

> On Tue, Nov 24, 2020 at 8:34 PM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   d9137320ac06f526fe3f9a3fdf07a3b14201068a
> > commit: b8ba904503311036dfeb758d81ef8d1be37cb8fc [2224/7715] remoteproc/mtk_scp: surround DT device IDs with CONFIG_OF
> > config: arm-randconfig-r003-20201124 (attached as .config)
> > compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project df9ae5992889560a8f3c6760b54d5051b47c7bf5)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install arm cross compiling tool for clang build
> >         # apt-get install binutils-arm-linux-gnueabi
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b8ba904503311036dfeb758d81ef8d1be37cb8fc
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout b8ba904503311036dfeb758d81ef8d1be37cb8fc
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> drivers/remoteproc/mtk_scp.c:755:37: warning: unused variable 'mt8183_of_data' [-Wunused-const-variable]
> >    static const struct mtk_scp_of_data mt8183_of_data = {
> >                                        ^
> > >> drivers/remoteproc/mtk_scp.c:765:37: warning: unused variable 'mt8192_of_data' [-Wunused-const-variable]
> >    static const struct mtk_scp_of_data mt8192_of_data = {
> >                                        ^
> >    2 warnings generated.
> 
> These 2 variables are used when CONFIG_OF is defined and CONFIG_OF is
> not enabled
> in the attached config file.
> 
> So mt8183_of_data & mt8192_of_data need to move under CONFIG_OF.
> 
> I will post a patch.
> 

We had the same warning on mtk_scp_of_match last week and I merged
Alexandre's fix without giving it much thought. Extending the CONFIG_OF
guard to also cover the references mtk_scp_of_data would mean that we
now have 10 unused functions instead.

On the flip-side, there's no harm in just dropping the of_match_ptr()
wrapping of mtk_scp_of_match in the definition of mtk_scp_driver and we
avoid this whole problem.  We "waste" a little bit of memory in the
COMPILE_TEST case, but we get compile testing of those functions as
well.

Regards,
Bjorn

> 
> 
> >
> > vim +/mt8183_of_data +755 drivers/remoteproc/mtk_scp.c
> >
> > 63c13d61eafe460 Erin Lo      2019-11-12  754
> > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21 @755  static const struct mtk_scp_of_data mt8183_of_data = {
> > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  756    .scp_before_load = mt8183_scp_before_load,
> > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  757    .scp_irq_handler = mt8183_scp_irq_handler,
> > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  758    .scp_reset_assert = mt8183_scp_reset_assert,
> > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  759    .scp_reset_deassert = mt8183_scp_reset_deassert,
> > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  760    .scp_stop = mt8183_scp_stop,
> > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  761    .host_to_scp_reg = MT8183_HOST_TO_SCP,
> > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  762    .host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
> > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  763  };
> > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  764
> > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21 @765  static const struct mtk_scp_of_data mt8192_of_data = {
> > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  766    .scp_before_load = mt8192_scp_before_load,
> > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  767    .scp_irq_handler = mt8192_scp_irq_handler,
> > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  768    .scp_reset_assert = mt8192_scp_reset_assert,
> > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  769    .scp_reset_deassert = mt8192_scp_reset_deassert,
> > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  770    .scp_stop = mt8192_scp_stop,
> > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  771    .host_to_scp_reg = MT8192_GIPC_IN_SET,
> > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  772    .host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
> > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  773  };
> > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  774
> >
> > :::::: The code at line 755 was first introduced by commit
> > :::::: fd0b6c1ff85a489bcf1bcf58af64da1aeffd39f0 remoteproc/mediatek: Add support for mt8192 SCP
> >
> > :::::: TO: Pi-Hsun Shih <pihsun@chromium.org>
> > :::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
