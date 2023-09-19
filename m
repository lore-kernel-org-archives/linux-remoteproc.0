Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F35CD342F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Sep 2023 01:14:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbjISBO2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Sep 2023 21:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230387AbjISBO2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Sep 2023 21:14:28 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B1E10B
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Sep 2023 18:14:22 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-52c88a03f99so5919517a12.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Sep 2023 18:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695086061; x=1695690861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WA9SbgZBS2d7r+giDCDiM8qHprOh9fflcSF1kPyE+mg=;
        b=pswLHVvlgTZ1IqDTrGOFKJiR7w6FPdj0K/ABHP+vyyrdQwBJS/hJIDYWW9RSzVzww+
         AXsUAsEmOtBoEYZ/dC2Nb2c1FpTja42VSHwSae+UniBCQtVOnqTxquktI2pqh+tPiNdq
         mA/TXnqVqigK65u83uFk1LAjNVLT2nW7pz+Iwmzpvl0l4KM67uf8daOmTfo0/bjqHg0K
         /D0orZRZt1LFxhb1sblDPRolPPMrTlSHP1Egstww/6sMnZF0FcaBEivcj7UteHO3pJG9
         F0UtJ6g1VYjVzF9e/hMIX5gSpT3T/DVY1mOW9oLYJXWiur03bIJ9lQisesGQ7j9qm3me
         I+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695086061; x=1695690861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WA9SbgZBS2d7r+giDCDiM8qHprOh9fflcSF1kPyE+mg=;
        b=VMVTVchpgX2qEvkTgCs5ktiZbCXbaIzsbG74QRuQKuUD0XRSfEn1J4iabqU36I2/3T
         Bu8pSNCf8n9lqhvdfynko8NwniktI5skB96gezUoBElwsdRrUm5CBaCgAr6qJxaampn+
         5Q1M7azRzxTBsqXlRjtofiT0ChT6f/lFceM57bwE9iXeRdT1Hv/L9R+rqckkeMBQDBqO
         utaxzAbCWzChzbcgs+hUM8sqmDk0FNOwYiXqONd4607p7mGvTAdwaViyYP4H5qtgE16z
         DuzyMoWQe5GRG+BJjn0jkHPvpv4ArkdwR4P3QQMvMbVBqivf6uLwy90VNj0dXgqJ0sN1
         r5/w==
X-Gm-Message-State: AOJu0YxcR8ABoKDr/THQzaR137f3l1GHqmr+C589Of25s6aosHNFNzZC
        SxBOSqwEwZhU6ZQgRYiNOEyHAw==
X-Google-Smtp-Source: AGHT+IFc4395RdOi+9dnmD35OMMHJNoIlb+eoF7osT1BHi2cs5ABN5XhkVj3C/6cd39Dibx5sALVhw==
X-Received: by 2002:a17:907:2c64:b0:9a2:139:f45d with SMTP id ib4-20020a1709072c6400b009a20139f45dmr8175665ejc.43.1695086060930;
        Mon, 18 Sep 2023 18:14:20 -0700 (PDT)
Received: from p14s (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id z10-20020a170906714a00b00991e2b5a27dsm6987169ejj.37.2023.09.18.18.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 18:14:20 -0700 (PDT)
Date:   Mon, 18 Sep 2023 19:14:17 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Laura Nao <laura.nao@collabora.com>
Cc:     Project_Global_Chrome_Upstream_Group@mediatek.com,
        andersson@kernel.org, angelogioacchino.delregno@collabora.com,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        robh+dt@kernel.org, tinghan.shen@mediatek.com, kernel@collabora.com
Subject: Re: [PATCH v17 00/14] Add support for MT8195 SCP 2nd core
Message-ID: <ZQj16b1NvkDlij+H@p14s>
References: <ZQH2dG+l/dONUsyi@p14s>
 <20230918103141.126271-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918103141.126271-1-laura.nao@collabora.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Sep 18, 2023 at 12:31:41PM +0200, Laura Nao wrote:
> > Other than patch 2 and 14, I have applied this set.  The remaining patches will
> > have to be resent to Matthias.
> 
> > Thanks,
> > Mathieu
> 
> Hello,
> 
> With patch 2 missing, the SCP is not probed correctly anymore on asurada (MT8192) and kukui (MT8183). The mtk-scp driver relies on the existence of the `cros-ec-rpmsg` node in the dt to determine if the SCP is single or multicore. Without patch 2 the driver wrongly assumes the SCP on MT8192 and MT8183 are multicore, leading to the following errors during initialization:   
> 
> 10696 04:33:59.126671  <3>[   15.465714] platform 10500000.scp:cros-ec: invalid resource (null)
> 10697 04:33:59.142855  <3>[   15.478560] platform 10500000.scp:cros-ec: Failed to parse and map sram memory
> 10698 04:33:59.149650  <3>[   15.486121] mtk-scp 10500000.scp: Failed to initialize core 0 rproc
> 
> The issue was caught by KernelCI, complete logs can be found here:
> - asurada: https://storage.kernelci.org/next/master/next-20230914/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-nfs-mt8192-asurada-spherion-r0.html
> - kukui: https://storage.kernelci.org/next/master/next-20230914/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-nfs-mt8183-kukui-jacuzzi-juniper-sku16.html
> 
> Reporting the issue so that patch 2 and 14 can be resent and merged soon.
>

Apologies for the trouble here, the error is mine.

I have applied and pushed patch 02 - please confirm that things are working as
expected now.  Matthias will need to either ack patch 14 or pick it up himself.


> Best,
> 
> Laura
> 
