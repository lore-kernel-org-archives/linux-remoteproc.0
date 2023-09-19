Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B130CCD343C
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Sep 2023 05:07:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbjISFHr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 Sep 2023 01:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjISFHp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Sep 2023 01:07:45 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F68FC
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Sep 2023 22:07:39 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-500bbe3ef0eso6181387e87.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Sep 2023 22:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695100057; x=1695704857; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3q8O8tWvnLQBFm13Z0K7FvFC/W1hQRUqZ5JIYPkfrQ4=;
        b=dV91rxTw/MLnB+Ine8ZmNXwK/oeYUIEZye/fSGnee46HIURUKElX/qZzwFtgWAEtc3
         b/L6bnCSMgPTLgIEgrGitLqvoHzf1WZ7yyFN4lhfw2sbCe7vYiLwugUEjSYtkS5gFWgu
         xVm39ur227FrjLx4HaNSKFrFCTfmkvsUoxox0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695100057; x=1695704857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3q8O8tWvnLQBFm13Z0K7FvFC/W1hQRUqZ5JIYPkfrQ4=;
        b=h6VaSvBOfxFTR07E0wnbOLgfgJCfin9FX7Mm27vhE9Fr5Dq1eFz07ou7EQdkgvB3jI
         ULQCqpL/KNpN7riEcqRruBQMHOd+LvEdVhgplU5vYS2vfguD9jmuxxKxN8gRSGU/PUYw
         MpCxpTMTcPLkNhVq/ELmNmp1Uv14zFHO3yLH8NbZ+PI+q2HHZDntyVk/GU/01OiTY8Fd
         psgM6ueaCAOXf7SyE7krXMckiFGWMN9jRlZAlZgPtdYA8vb/fPpzEl6rnYA0tQ9JfiFG
         iRVcn/gaNiym7PbICIeQXawJCMOvsjiBZYSaT/uWLBpdi55JNncJfdTpeP+m/QaHBZq1
         vDoA==
X-Gm-Message-State: AOJu0YxyG0D/BYDNgngEmci/ggN67Q/WjfKs87Iy6XclwSaQanXjqX3m
        n9eYv1fZ8XZjHkF7zkYPNx8hEy3eOy4Wz5zfvZ9zOA==
X-Google-Smtp-Source: AGHT+IG7rNmlTgr6mtc+pEDDwj3hVW1OJN/J2y44JelHkWF7gUusMiA1KDRGT3JZU/TTjFtk7VjNvQSjnr+5NJPaqPw=
X-Received: by 2002:a05:6512:3b06:b0:4fe:8ba8:1a8b with SMTP id
 f6-20020a0565123b0600b004fe8ba81a8bmr650772lfv.7.1695100057325; Mon, 18 Sep
 2023 22:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <ZQH2dG+l/dONUsyi@p14s> <20230918103141.126271-1-laura.nao@collabora.com>
 <CAGXv+5Esi=G0xgkP=+Bhf39Xs3gMN1PBzarxKBKduOjgwDijAA@mail.gmail.com> <ZQj2lSl47qZQv8fX@p14s>
In-Reply-To: <ZQj2lSl47qZQv8fX@p14s>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 19 Sep 2023 13:07:26 +0800
Message-ID: <CAGXv+5Gj5rERcX6uxVUUq8beM4k4ogXnuh_86piyGw1oVrbyvg@mail.gmail.com>
Subject: Re: [PATCH v17 00/14] Add support for MT8195 SCP 2nd core
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Laura Nao <laura.nao@collabora.com>, tinghan.shen@mediatek.com,
        angelogioacchino.delregno@collabora.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, matthias.bgg@gmail.com,
        robh+dt@kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Sep 19, 2023 at 9:17=E2=80=AFAM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Mon, Sep 18, 2023 at 06:44:25PM +0800, Chen-Yu Tsai wrote:
> > On Mon, Sep 18, 2023 at 6:32=E2=80=AFPM Laura Nao <laura.nao@collabora.=
com> wrote:
> > >
> > > > Other than patch 2 and 14, I have applied this set.  The remaining =
patches will
> > > > have to be resent to Matthias.
> > >
> > > > Thanks,
> > > > Mathieu
> > >
> > > Hello,
> > >
> > > With patch 2 missing, the SCP is not probed correctly anymore on asur=
ada (MT8192) and kukui (MT8183). The mtk-scp driver relies on the existence=
 of the `cros-ec-rpmsg` node in the dt to determine if the SCP is single or=
 multicore. Without patch 2 the driver wrongly assumes the SCP on MT8192 an=
d MT8183 are multicore, leading to the following errors during initializati=
on:
> > >
> > > 10696 04:33:59.126671  <3>[   15.465714] platform 10500000.scp:cros-e=
c: invalid resource (null)
> > > 10697 04:33:59.142855  <3>[   15.478560] platform 10500000.scp:cros-e=
c: Failed to parse and map sram memory
> > > 10698 04:33:59.149650  <3>[   15.486121] mtk-scp 10500000.scp: Failed=
 to initialize core 0 rproc
> > >
> > > The issue was caught by KernelCI, complete logs can be found here:
> > > - asurada: https://storage.kernelci.org/next/master/next-20230914/arm=
64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-nfs-mt=
8192-asurada-spherion-r0.html
> > > - kukui: https://storage.kernelci.org/next/master/next-20230914/arm64=
/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/baseline-nfs-mt81=
83-kukui-jacuzzi-juniper-sku16.html
> > >
> > > Reporting the issue so that patch 2 and 14 can be resent and merged s=
oon.
> >
> > This being a backward incompatible DT binding change, maybe we should r=
evert
> > the node name change. Or, the driver could simply count the number of c=
hild
> > nodes that have the "mediatek,rpmsg-name" property, which is required.
> >
>
> You have a point.  Can someone send a patch that makes this patchset back=
ward
> compatible?  Please do so as quickly as possible to that it can go in the=
 next
> merge window with the rest of this feature.  Otherwize I'll have to back =
out the
> whole thing.

I sent out a patch [1] implementing my proposed change.

ChenYu

[1] https://lore.kernel.org/linux-remoteproc/20230919050305.3817347-1-wenst=
@chromium.org/
