Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEDCC433FE
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 Oct 2022 20:25:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiJDUZd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 4 Oct 2022 16:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiJDUZc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 Oct 2022 16:25:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF9E5A3C2;
        Tue,  4 Oct 2022 13:25:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 738ECB81BC2;
        Tue,  4 Oct 2022 20:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 259F0C433B5;
        Tue,  4 Oct 2022 20:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664915129;
        bh=Gp9cdLKe6m1kFsqSy/5mBkVFGvqBOxid7eIAjNrmn4E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nmtazlZPq0y5BWW/hH+YOfV3we9ePhnGDhBq819JwdhXmgXfLP7wcAXri7odudhtb
         K98sz/q2JC+nJPlk+dypfuB7MaijOfasddK4peYyZW3a4coNDviVrAl6DaP+ZavXGg
         KVaobbZESAajfuSsoyROTYZ1xxFGtQauZ68ZHvUMb1+NxJObLAk8f5JaQ2xN+AwWpq
         /RHmKWEoA3GeSVNBj+3qIqOofjGrUgY/8nbq8KYIbtg8j/gloAybY/fhwcli9a/EiE
         DvC3ETiQhtI9dkMCLcRUAM+JZIpPrbARbga4puDl5NEihKycRhsVMl+a/FdKsYtPxF
         ZhVVAm1O7obFg==
Received: by mail-vs1-f45.google.com with SMTP id n186so10069543vsc.9;
        Tue, 04 Oct 2022 13:25:29 -0700 (PDT)
X-Gm-Message-State: ACrzQf0Lw+a+i9znoGe/Ol4m9F7zFAVXRhMTAaa9ivuloj2g0i4RCzpv
        KQKBqOX6TQu1+4ASV3r1JySssDQLCxfZGG8SfA==
X-Google-Smtp-Source: AMsMyM73U8/w0X5x9WHM1FGcPigF80k5hOdTK5S6tGVEPqEjkoUEvCSHJHfIqeA8+uStNeAYXF5Qul0qcPwrqqDMEF0=
X-Received: by 2002:a05:6102:3fa7:b0:3a6:72a4:3188 with SMTP id
 o39-20020a0561023fa700b003a672a43188mr6081434vsv.0.1664915128118; Tue, 04 Oct
 2022 13:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221004174018.3319712-1-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20221004174018.3319712-1-arnaud.pouliquen@foss.st.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 4 Oct 2022 15:25:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKohUguae=s8+eH8afPchtJMnXzE-V-QF+H=yEkD3WbOA@mail.gmail.com>
Message-ID: <CAL_JsqKohUguae=s8+eH8afPchtJMnXzE-V-QF+H=yEkD3WbOA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: virtio: Fix warning on bindings by removing
 the of_match_table
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Oct 4, 2022 at 12:40 PM Arnaud Pouliquen
<arnaud.pouliquen@foss.st.com> wrote:
>
> The checkpatch tool complains that "virtio,rproc" is not documented.
> But it is not possible to probe the device "rproc-virtio" by declaring
> it in the device tree. So documenting it in the bindings does not make
> sense.
> This commit solves the checkpatch warning by suppressing the useless
> of_match_table.
>
> Fix-suggested-by: Rob Herring <robh@kernel.org>
> Fixes: 1d7b61c06dc3 ("remoteproc: virtio: Create platform device for the remoteproc_virtio")
>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 6 ------
>  1 file changed, 6 deletions(-)

There might be an include you don't need anymore, but otherwise:

Reviewed-by: Rob Herring <robh@kernel.org>
