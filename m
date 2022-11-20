Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B46C4332F
	for <linux-remoteproc@archiver.kernel.org>; Sun, 20 Nov 2022 16:26:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiKTQ0a (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 20 Nov 2022 11:26:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiKTQ03 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 20 Nov 2022 11:26:29 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51C872DDB;
        Sun, 20 Nov 2022 08:26:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8D16160C84;
        Sun, 20 Nov 2022 16:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA46C433D6;
        Sun, 20 Nov 2022 16:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668961588;
        bh=2yEBvHEeBpurSrd771MUbF51+i/DA5SdCSTLuUV4mrE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZTErMs1m9a2y9vVLS9+GqE9okiPeClJ7TCfOF6zxUxk1IH3lY0Pifn0ZQHR6gyv9d
         MlOjMIRXqyuJPKHckgYwkg3we+W2WvpI5lC1QNGPM6cbcVK41RxaMj75Dm/xAkCnjf
         PEqdNzy68EYjNxSOvUOu+7DrKyoK17hgG83r0cRpG/JeiuuwJr4Pg264zTGYyPc/h+
         lo34bV9D6oCAgep2evgDxkjhkCIpaagc1BpSC61OyWtia9/BdtOyJHfy+PgRMF40wM
         ifHsEfbSllg+X62nQWM3co/nnGjZbozSvN9E6m97J50ra50J8Y+QnLvh6CQCbFc+xJ
         MG1eFKPiWZvSg==
Received: by mail-ua1-f42.google.com with SMTP id c26so3312485uak.5;
        Sun, 20 Nov 2022 08:26:27 -0800 (PST)
X-Gm-Message-State: ANoB5plZ8kPvfS8MOkzcaJzyMQZ68aWM7YglHH6Z4hHC1dK5iwUHeP1L
        B0HT53nw/Bbd85gpuIV4gwhHEc97CM/Wq7wQpg==
X-Google-Smtp-Source: AA0mqf714mYP4qAde4v/WVPC+QQ028KMklMviPhkcI16AZ3i1xafZjqE1ImkoJEd35g4gLavpC9f+E6rxuI8YOxWPFU=
X-Received: by 2002:ab0:7149:0:b0:418:ce2f:7b2b with SMTP id
 k9-20020ab07149000000b00418ce2f7b2bmr665348uao.77.1668961586965; Sun, 20 Nov
 2022 08:26:26 -0800 (PST)
MIME-Version: 1.0
References: <20221114233940.2096237-1-tanmay.shah@amd.com> <20221116183814.GD61935@p14s>
 <CAL_Jsq+ECUjFJHED9UnsgDrZQY_LUavDcQesZCwsnSH=iQCyrA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+ECUjFJHED9UnsgDrZQY_LUavDcQesZCwsnSH=iQCyrA@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Sun, 20 Nov 2022 10:26:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLY8BBVXoCE6C2dGooBtKxY8XrBk9Sc_D2ksJAQHgcCxA@mail.gmail.com>
Message-ID: <CAL_JsqLY8BBVXoCE6C2dGooBtKxY8XrBk9Sc_D2ksJAQHgcCxA@mail.gmail.com>
Subject: Re: [PATCH v11 0/6] Add Xilinx RPU subsystem support
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Tanmay Shah <tanmay.shah@amd.com>, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, michal.simek@amd.com,
        bill.mills@linaro.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sun, Nov 20, 2022 at 10:22 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Wed, Nov 16, 2022 at 12:38 PM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > Hi Tanmay,
> >
> > I think this patchset is ready to be merged.  Two things are missing though:
> >
> > Patches 1 and 2: We are missing a tag from one of the fellow in the DT brigade.
> > They handle a lot of patches so let's give them time.
>
> Patch 2 should go via the sub-arch tree. I don;t review .dts files regularly.

Except I guess there's a header dependency here. Then the dts needs an
ack from Michal if it doesn't already or it can go next cycle.

Rob
