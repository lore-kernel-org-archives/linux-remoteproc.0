Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554E5CA0EEB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Sep 2023 14:41:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235964AbjILOlM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Sep 2023 10:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbjILOlM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Sep 2023 10:41:12 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42569118
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Sep 2023 07:41:08 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-564af0ac494so4093158a12.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Sep 2023 07:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694529668; x=1695134468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7IA9vO5OF4PfvbjWyLsSgk3yi/uHzp9q+67eqvoiYFs=;
        b=ccSMZ1+gT7HzhJ83pd8JAaRBvIuyeNDQP3gNephwYBViaMutUkRqgRMNAmj/kQYzQk
         3pqX4mBv9mwWAv45zfyS3u+KVn05SxE7tCqRKNJzEuz+A956jEzehUiAQfvjQhIh4UKJ
         K9SHR7F7DmM5izZL2oNgPgzHbuXQtwCzUHrlLbHlP0a5nCwVKRZioZTTXbM3gehporUs
         hMPv+JA9KskKPBJKDn+h3cHfWw5laaJ8m+HeDM8lxUrvQwQYT85LOMVJRuVajAKs+f0b
         oEjWnkA//Y55uXGoATRNrtFK/AwGRvfryMr3y5vqwxbDs9a+ebgHinicC14q4WcGn9bl
         VaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694529668; x=1695134468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IA9vO5OF4PfvbjWyLsSgk3yi/uHzp9q+67eqvoiYFs=;
        b=N36rEtHZdwkv0ee2jXOudPmHCsli7Zt0AdIuFpnjbjfP6bIXS95gf+5As2sQWch4x5
         Y9fq0o67uVUVBxI4Cdjzr69DX3vlHygLX01fdUEPgBgEqOOhVXwtpoalu2kiGyq9LCgd
         Bk0/LgzOWYtTtkWbonoF5OxfTMil/L2RgentEuuJXtZIH2Qp4tQp2Xr/UFW6Tz+TIXqQ
         C7cxVMvlCRM1se3AUcR3Hy457M1pQLWw7b6SqDs79T6bwiF6Q3Ixh/nhrlPJDZ+w90BP
         D+T3nBlreEohds3OrGp2WH3wogqlBJ3V9PusQl49f1ccXTpyLHbdTHMRJQpdOO6Z+ck8
         FkoQ==
X-Gm-Message-State: AOJu0YwbNSqM/fvVfHBo1QG1PDZfLt2L7aFgw3RgqNiCIVxVNVw9cObD
        /ydfH+U8z8xtOqfVDgvaKjtZ3g==
X-Google-Smtp-Source: AGHT+IGI9zf7neD/ytF0XaIRN6SetT6z4G2tT486Bd7sTiE6fcv43FJe/iFhqQFbhtCjZimu2u4lgw==
X-Received: by 2002:a17:90b:909:b0:271:a9b2:5162 with SMTP id bo9-20020a17090b090900b00271a9b25162mr9472055pjb.27.1694529667739;
        Tue, 12 Sep 2023 07:41:07 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ed04:a14b:64d6:aece])
        by smtp.gmail.com with ESMTPSA id x3-20020a17090ab00300b00268b9862343sm5377469pjq.24.2023.09.12.07.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 07:41:07 -0700 (PDT)
Date:   Tue, 12 Sep 2023 08:41:04 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Iuliana Prodan <iuliana.prodan@nxp.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        "S.J. Wang" <shengjiu.wang@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, conor+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-imx <linux-imx@nxp.com>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        LnxRevLi <LnxRevLi@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Mpuaudiosw <Mpuaudiosw@nxp.com>,
        "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx8mp: add reserve-memory nodes for DSP
Message-ID: <ZQB4gMyfJK9sFXID@p14s>
References: <20230911224452.15739-1-iuliana.prodan@oss.nxp.com>
 <20230911224452.15739-3-iuliana.prodan@oss.nxp.com>
 <67de5706-d966-dd71-85c3-c95bc1b72733@linaro.org>
 <c0b32f41-46b4-81ad-9718-5f0856e42cb1@nxp.com>
 <32287c0a-e3c1-e474-3c90-913fe2c79879@linaro.org>
 <fe47a94e-6788-a5ee-e8ee-ca58e4fa62d6@nxp.com>
 <af1959ce-d817-2a9e-9c28-fed8c608a3df@linaro.org>
 <dc402d33-88b1-e828-e6a5-2de060fbcdca@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc402d33-88b1-e828-e6a5-2de060fbcdca@nxp.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Sep 12, 2023 at 01:51:42PM +0300, Iuliana Prodan wrote:
> On 9/12/2023 12:36 PM, Krzysztof Kozlowski wrote:
> > On 12/09/2023 10:49, Iuliana Prodan wrote:
> > > > > Should I test this on other tree(s)?
> > > > You test the patch on the tree you send it. What is the point to test it
> > > > on some old code, cherry-pick with bugs and then send?
> > > > 
> > > > If you have cross-tree dependencies between subsystem, isn't linux-next
> > > > for this?
> > > TBH, I don't know, that's why I asked.
> > > 
> > > For sure one patch is for remoteproc.
> > > For the other, I don't know who will pick it, but I'll tested on
> > > linux-next, as you suggested.
> > MAINTAINERS file (and get_maintainers.pl) will tell you. Specifically,
> > this does not look really related to remoteproc patch, so it should not
> > be together in one patchset.
> 
> Hi Mathieu,
> 
> I need to send a v2 - to fix the dtsi missing bracket on patch 2.
> So, should I keep the 2 patches together or send them separately?
>

Marco is already aware of this patchset so I would keep them together.

> Thanks,
> Iulia
> 
> 
> 
