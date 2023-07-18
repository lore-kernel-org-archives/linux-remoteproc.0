Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F28C0015E
	for <linux-remoteproc@archiver.kernel.org>; Tue, 18 Jul 2023 15:23:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233604AbjGRPXZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 18 Jul 2023 11:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233445AbjGRPXY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 18 Jul 2023 11:23:24 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8491997
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Jul 2023 08:23:18 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6686708c986so5892255b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 18 Jul 2023 08:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689693798; x=1692285798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SWDtHVs3Urak5aG+ygvNpGbYkcumje8U+MVjSEamA3I=;
        b=OSgivM0r2+T7IwP3feiWb17Gir3+X4dfmryhv0WyyhJE/WNLA6uo1tuYEOKlXQyHtd
         4O9/SbOauZ+QT0d/k7oBpbld7JMsW2KxBLkVKAARv8SzkUM//5zbFMwHVbui5y4P0qQi
         kfFZMUdgnETrnYLtDqJ3U6V/W2egiA9BKth7tozj1pIWRYCXqQbP/KztX9S+jU9EY/uo
         UdiaNYu7I77BnmfAMPhy7FsxHCJVDZsIEdTXPsUhMo7u0pv0BxuEDkqfPXE7de9OxEV0
         fYty3cmjTv7Xk/QgNSOjfkVZB6mlBNJsoYGoqBDA5DQHAJnO49V2SAo94AByTKb4qwBF
         MSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689693798; x=1692285798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWDtHVs3Urak5aG+ygvNpGbYkcumje8U+MVjSEamA3I=;
        b=idDUh5WlqWUs5/wOzNLtDs4vB9b4Sir3Zavid46zSDh/S/tsAM+i3lONSDja2eW1Y7
         MybpTvBxXBMjCaYp7EZLLWdhE12OzhPQ+hjmhqWpVXTk5QPYdmGjquYXB40SUhzD/Z4H
         2HPaSs+DTCD70BRvTQtakspKT6cGMNwujQr97TcbRJHSw5S7RpQ/E0EMJGlhkxGDIIKs
         3sTWApcWy5y82Ys+dcj4DTYLC87T5qaCbd/17dE8uoBQzrMk8U56LDWbizWKHf8wYC2F
         cicJ9/Ii0aT3MYPe2DuuT3Zm/y6Sc5lS015bm6Zx/xGTHtURFm813mKM2yPGqx0WIdDQ
         +i+Q==
X-Gm-Message-State: ABy/qLYvbSHilTWh0rRqbiNat13EBKEFcJ2GAlksteuEt40w1vHj+zTc
        krhHSMdmcqJkZgvYp/gxmdGUhg==
X-Google-Smtp-Source: APBJJlE+sWd4ROQI9JcUy6oSHWAFtSVeK0lAHGj5ZqujU3RjIYVyIliD/z6LGdnmOnfT++85IjeDIQ==
X-Received: by 2002:a05:6a20:72a3:b0:133:96c9:fb3b with SMTP id o35-20020a056a2072a300b0013396c9fb3bmr16428354pzk.45.1689693798346;
        Tue, 18 Jul 2023 08:23:18 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:181:e3fe:53e1:920])
        by smtp.gmail.com with ESMTPSA id c14-20020aa78c0e000000b00654228f9e93sm1678412pfd.120.2023.07.18.08.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 08:23:17 -0700 (PDT)
Date:   Tue, 18 Jul 2023 09:23:15 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Iuliana Prodan <iuliana.prodan@nxp.com>
Cc:     "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "S.J. Wang" <shengjiu.wang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Mpuaudiosw <Mpuaudiosw@nxp.com>, linux-imx <linux-imx@nxp.com>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        LnxRevLi <LnxRevLi@nxp.com>
Subject: Re: [PATCH 1/2] remoteproc: imx_dsp_rproc: add mandatory
 find_loaded_rsc_table op
Message-ID: <ZLauY85b9SRC3z0x@p14s>
References: <20230712224220.26430-1-iuliana.prodan@oss.nxp.com>
 <ZLV9gAmiDldlvIUR@p14s>
 <474c0241-a58e-b435-8ac1-82a5a458d79a@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <474c0241-a58e-b435-8ac1-82a5a458d79a@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jul 18, 2023 at 11:25:03AM +0300, Iuliana Prodan wrote:
> On 7/17/2023 8:42 PM, Mathieu Poirier wrote:
> > On Thu, Jul 13, 2023 at 01:42:20AM +0300, Iuliana Prodan (OSS) wrote:
> > > From: Iuliana Prodan <iuliana.prodan@nxp.com>
> > > 
> > > Add the .find_loaded_rsc_table operation for i.MX DSP.
> > > We need it for inter-process communication between DSP
> > > and main core.
> > > 
> > > This callback is used to find the resource table (defined
> > > in remote processor linker script) where the address of the
> > > vrings along with the other allocated resources (carveouts etc)
> > > are stored.
> > > If this is not found, the vrings are not allocated and
> > > the IPC between cores will not work.
> > Is there a constraint on the system memory the M4 can address?  If so there
> > will be a need to declare address ranges for vrings and buffers in reserved
> > memory in the DT.
> > 
> > Thanks,
> > Mathieu
> 
> Hi Mathieu,
> 
> No, there is no constraint on memory.
> 
> We want the Cortex A core to communicate with the HiFi4 DSP.
> The Cortex A is in charge of starting the DSP and loading the firmware in
> HiFi4's memory.
> When using rpmsg for IPC, the Cortex A needs to find the resource table
> (defined in the DSP linker script) and this is done using
> .find_loaded_rsc_table callback.
> 
> For the DT, we are using a (not upstream) device tree where we have the
> reserved-memory for dsp_vdev0vring0, dsp_vdev0vring1 and dsp_vdev0buffer.

That is the part I'm interested in.  Don't we need the reserved-memory entries?
Otherwise the M4 may not be able to access the memory chosen by the application
processor, most likely leading to a crash.

> 
> Iulia
> 
> 
> > > Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> > > ---
> > >   drivers/remoteproc/imx_dsp_rproc.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> > > index d95fa5586189..b5634507d953 100644
> > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > @@ -941,6 +941,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
> > >   	.kick		= imx_dsp_rproc_kick,
> > >   	.load		= imx_dsp_rproc_elf_load_segments,
> > >   	.parse_fw	= imx_dsp_rproc_parse_fw,
> > > +	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> > >   	.sanity_check	= rproc_elf_sanity_check,
> > >   	.get_boot_addr	= rproc_elf_get_boot_addr,
> > >   };
> > > -- 
> > > 2.17.1
> > > 
