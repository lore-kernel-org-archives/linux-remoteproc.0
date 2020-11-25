Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50927C56202
	for <linux-remoteproc@archiver.kernel.org>; Wed, 25 Nov 2020 18:50:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E208520674
	for <linux-remoteproc@archiver.kernel.org>; Wed, 25 Nov 2020 18:50:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7qQCOUn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731230AbgKYSu1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 25 Nov 2020 13:50:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730416AbgKYSu0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 25 Nov 2020 13:50:26 -0500
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B002C061A4F
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Nov 2020 10:50:26 -0800 (PST)
Received: by mail-vs1-xe43.google.com with SMTP id k17so637487vsp.13
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Nov 2020 10:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VnASejwj7ZYwHThT8OV4Id2cZ5O9haxKGdtLGYLwKH8=;
        b=Q7qQCOUnqeeZJyagmH1izUEVr5TAiFYaNbYV05/hdvZ581iWNn1rh/mnTxDpVDLGOp
         muL66l3rGJ3qaVsQ2MKfubLQWODIVrbRquqCJTaPh40dNR9IdoirMEE8OS99bF43gvJG
         vlMr/dP53Vt3OK8a9xI9fi8Z9J9e8+7ldKraM3MbuNvNrW+5FJgVeYewYaKhCtRjgwjq
         C35B80PiRIB42Q7WPRJPfNM+hl1bReHEJCkk5TRHu3yfHMvZnRJlo16drkE0M9n9IEhB
         TVTC+DNknL2J9NMMrZGmsj5NpoC0BzAhpVV2REn0CtcaEv+ZRTf+qkNbwlkPlKmIqxGY
         ja9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VnASejwj7ZYwHThT8OV4Id2cZ5O9haxKGdtLGYLwKH8=;
        b=GpUHafFAkVhwpY36krgHAaLVjPZ5Lq8MIb/RGzhBu4yxA2BpfQhirwsaO3eJTVB+p0
         sy7kf2yw3ywUUAL9I0ySia1MVVBpA+ISCZI3SWHtljcCIwl7L+lkcMVTg7UqSQTFHi/V
         GarazHSzjJZA+0o1hXaFsR0I5vxKuLXo+SRRFXhg7RjrUjADFrigeyRUmmW0Lxy9SlDu
         2QxEUyRdiyPt+TrATtgkudkRn8TiIcSfr5sQhUS+M+U1lllBMp5/QmkMSI78b7LxVtrU
         M7qMFoo2p5Y8pTaag4NIFpr50w/qrtJp2kUiLUPdtBKnmHWQ/9BE1SpJGVkNeMeNKJwU
         U9jQ==
X-Gm-Message-State: AOAM533Cc8r5ABYd5fpclNmjbpgbRufxMChx2fgb0sY1ejHrPO7IT8aV
        mQfftD0EjR3oSvQ9mgMAwkWz2sRKcWYrI0kFEtA=
X-Google-Smtp-Source: ABdhPJwK3TRjnMlgplhPx7tqxRlFfuXpakO1MyxwxwLvi6jqm2/Ved7jmPRO12vi6drpnuS9fhgWLfVzVEJikCSkFPg=
X-Received: by 2002:a67:fb87:: with SMTP id n7mr3224178vsr.58.1606330225227;
 Wed, 25 Nov 2020 10:50:25 -0800 (PST)
MIME-Version: 1.0
References: <202011242358.oKOU8SIP-lkp@intel.com> <CAFqt6zZekYGmkDrANsCrRs3Z5DMhCUqA-yi9ipC6JRYTvGfE5w@mail.gmail.com>
 <X76LIAy1kMKydnc0@builder.lan>
In-Reply-To: <X76LIAy1kMKydnc0@builder.lan>
From:   Souptick Joarder <jrdr.linux@gmail.com>
Date:   Thu, 26 Nov 2020 00:20:13 +0530
Message-ID: <CAFqt6zaSN2B0xhrr-wCPSQJb+nQg=rGP04fFLe-FyfbiXywsEg@mail.gmail.com>
Subject: Re: [linux-next:master 2224/7715] drivers/remoteproc/mtk_scp.c:755:37:
 warning: unused variable 'mt8183_of_data'
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     kernel test robot <lkp@intel.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Nov 25, 2020 at 10:19 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 25 Nov 09:24 CST 2020, Souptick Joarder wrote:
>
> > On Tue, Nov 24, 2020 at 8:34 PM kernel test robot <lkp@intel.com> wrote:
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   d9137320ac06f526fe3f9a3fdf07a3b14201068a
> > > commit: b8ba904503311036dfeb758d81ef8d1be37cb8fc [2224/7715] remoteproc/mtk_scp: surround DT device IDs with CONFIG_OF
> > > config: arm-randconfig-r003-20201124 (attached as .config)
> > > compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project df9ae5992889560a8f3c6760b54d5051b47c7bf5)
> > > reproduce (this is a W=1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # install arm cross compiling tool for clang build
> > >         # apt-get install binutils-arm-linux-gnueabi
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b8ba904503311036dfeb758d81ef8d1be37cb8fc
> > >         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > >         git fetch --no-tags linux-next master
> > >         git checkout b8ba904503311036dfeb758d81ef8d1be37cb8fc
> > >         # save the attached .config to linux build tree
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm
> > >
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > > >> drivers/remoteproc/mtk_scp.c:755:37: warning: unused variable 'mt8183_of_data' [-Wunused-const-variable]
> > >    static const struct mtk_scp_of_data mt8183_of_data = {
> > >                                        ^
> > > >> drivers/remoteproc/mtk_scp.c:765:37: warning: unused variable 'mt8192_of_data' [-Wunused-const-variable]
> > >    static const struct mtk_scp_of_data mt8192_of_data = {
> > >                                        ^
> > >    2 warnings generated.
> >
> > These 2 variables are used when CONFIG_OF is defined and CONFIG_OF is
> > not enabled
> > in the attached config file.
> >
> > So mt8183_of_data & mt8192_of_data need to move under CONFIG_OF.
> >
> > I will post a patch.
> >
>
> We had the same warning on mtk_scp_of_match last week and I merged
> Alexandre's fix without giving it much thought. Extending the CONFIG_OF
> guard to also cover the references mtk_scp_of_data would mean that we
> now have 10 unused functions instead.
>
> On the flip-side, there's no harm in just dropping the of_match_ptr()
> wrapping of mtk_scp_of_match in the definition of mtk_scp_driver and we
> avoid this whole problem.  We "waste" a little bit of memory in the
> COMPILE_TEST case, but we get compile testing of those functions as
> well.

Ok. will do it.


> >
> >
> > >
> > > vim +/mt8183_of_data +755 drivers/remoteproc/mtk_scp.c
> > >
> > > 63c13d61eafe460 Erin Lo      2019-11-12  754
> > > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21 @755  static const struct mtk_scp_of_data mt8183_of_data = {
> > > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  756    .scp_before_load = mt8183_scp_before_load,
> > > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  757    .scp_irq_handler = mt8183_scp_irq_handler,
> > > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  758    .scp_reset_assert = mt8183_scp_reset_assert,
> > > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  759    .scp_reset_deassert = mt8183_scp_reset_deassert,
> > > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  760    .scp_stop = mt8183_scp_stop,
> > > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  761    .host_to_scp_reg = MT8183_HOST_TO_SCP,
> > > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  762    .host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
> > > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  763  };
> > > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  764
> > > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21 @765  static const struct mtk_scp_of_data mt8192_of_data = {
> > > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  766    .scp_before_load = mt8192_scp_before_load,
> > > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  767    .scp_irq_handler = mt8192_scp_irq_handler,
> > > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  768    .scp_reset_assert = mt8192_scp_reset_assert,
> > > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  769    .scp_reset_deassert = mt8192_scp_reset_deassert,
> > > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  770    .scp_stop = mt8192_scp_stop,
> > > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  771    .host_to_scp_reg = MT8192_GIPC_IN_SET,
> > > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  772    .host_to_scp_int_bit = MT8192_HOST_IPC_INT_BIT,
> > > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  773  };
> > > fd0b6c1ff85a489 Pi-Hsun Shih 2020-09-21  774
> > >
> > > :::::: The code at line 755 was first introduced by commit
> > > :::::: fd0b6c1ff85a489bcf1bcf58af64da1aeffd39f0 remoteproc/mediatek: Add support for mt8192 SCP
> > >
> > > :::::: TO: Pi-Hsun Shih <pihsun@chromium.org>
> > > :::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>
> > >
> > > ---
> > > 0-DAY CI Kernel Test Service, Intel Corporation
> > > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
