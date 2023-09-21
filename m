Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF41E7D0A4
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Sep 2023 19:05:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbjIUTFS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 21 Sep 2023 15:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231508AbjIUTE6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 21 Sep 2023 15:04:58 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CDC6E08D
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 Sep 2023 10:50:00 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-404fbfac998so14508165e9.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 21 Sep 2023 10:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695318599; x=1695923399; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aBYYxm4V3k4FyEjLrLJ9/n/H90Md6QsttKISLF22a4=;
        b=TvitetX1+8y+R6XxPTdBEUGoj6BIf2gpF/Bwke9VYSb4YLtSo4/+W/q7rK3pJkFMpN
         8qWwqFN5XtYbX0hbFcxX/OM0jfJSztr8H7ytGnte4LWbDKWmaggv4Fn5Tiz2RGyU2x+c
         Azgs60OMdNVftFZi+gx+blMLkNVDuE/j0frR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695318599; x=1695923399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aBYYxm4V3k4FyEjLrLJ9/n/H90Md6QsttKISLF22a4=;
        b=uYXBDZJpf7F0preTJ7csjGge0P2tqhDGMbjEMTSbTQCD+0zQVs2epWBOPgTR8YsoG1
         9Ygb5MwBGpWNBvEXI8WiW+YG/TfoUovh9yIk0Zlpr0YfO8LBMCb8SdZEhtuMgnzfxAif
         TTSjyYqzsgcKrTlAqWycXb2n2fFYvUjPS6014VGR78bqXIadVSUzQHN+p/gmjcRtePt+
         przZg0+ljGn9+cXIGmYfcW2lpYKY8VTqY1OkZLknCbZ1nLrOV86l+xm+RYnDO9sqH9oo
         1+0IfA00mWBcdVJQAAetcbiw2WXZ1GCAxTcKRLtsbGMaA5ahXID6rMOSIxnNGM4oacn3
         9xvQ==
X-Gm-Message-State: AOJu0Yxj/qJZ5+ZL5YBhWSOAXzoGj1n9bwEnb5gqj0f2VIo56WK2GIsk
        sI/ueJceuw3dgs0pTWpkORUR3d4ag9eF8HxEtlje6VaS6dQ9C464msE=
X-Google-Smtp-Source: AGHT+IGdIV8J7fxjUNbRUv5HJhGzBY+D1JG/lYO+jffLDerOCNDgsVdIhjbf+HuUVjEXXFJfi0crYYSdZkt0BFEhkOg=
X-Received: by 2002:a19:e051:0:b0:4ff:8863:be01 with SMTP id
 g17-20020a19e051000000b004ff8863be01mr3396045lfj.8.1695269389034; Wed, 20 Sep
 2023 21:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230919092336.51007-1-angelogioacchino.delregno@collabora.com> <20230920150332.318851-1-laura.nao@collabora.com>
In-Reply-To: <20230920150332.318851-1-laura.nao@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 21 Sep 2023 12:09:37 +0800
Message-ID: <CAGXv+5Hr1woRL5z6b4k6e+FQKaVyoUmP4vAt=RrEgjEwq8bUhw@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: mediatek: Refactor single core check and fix retrocompatibility
To:     Laura Nao <laura.nao@collabora.com>
Cc:     angelogioacchino.delregno@collabora.com, andersson@kernel.org,
        kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org,
        matthias.bgg@gmail.com, tinghan.shen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Sep 20, 2023 at 11:03=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> On 9/19/23 11:23, AngeloGioacchino Del Regno wrote:
> > In older devicetrees we had the ChromeOS EC in a node called "cros-ec"
> > instead of the newer "cros-ec-rpmsg", but this driver is now checking
> > only for the latter, breaking compatibility with those.
> >
> > Besides, we can check if the SCP is single or dual core by simply
> > walking through the children of the main SCP node and checking if
> > if there's more than one "mediatek,scp-core" compatible node.
> >
> > Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-=
core SCP")
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >   drivers/remoteproc/mtk_scp.c | 18 +++++++-----------
> >   1 file changed, 7 insertions(+), 11 deletions(-)
> >
>
> Tested on asurada (spherion) and jacuzzi (juniper). The issue was detecte=
d by KernelCI, so:
>
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Tested-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on Hayato (MT8192) and Juniper (MT8183).
