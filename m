Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4815C05027
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Mar 2023 18:25:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbjCNSZR (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Mar 2023 14:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbjCNSZO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Mar 2023 14:25:14 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA4EB4213
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Mar 2023 11:24:49 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-541a05e4124so133941877b3.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Mar 2023 11:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678818289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaq8T3LD9vAL2/LDrIWwh+yNCX+E4QMSUZ8Ql9Ca4Tw=;
        b=TTVe2HPVswBoXZAM6zlng+SfROysSaFrVcx6RxIV0LHDlhypq19rLCa4F0RccWazCu
         kksjZ9MtuyTZXm1yul08O6JAiG4RExzk4zCYCY6RwLgkasEEZx0NJpWU9caJQshORY00
         qeSTq3h9iModrE9ZUYdgJ5n1K0tybi2Oq2d95lP+4RQPsoTrpGacWUr8DRf1re9ISfDl
         zAP2qtYb52JJni/vjKhsZ4+u71QkbjCyn8J62RQwPsv35zBch2pBwZ15Q59zseCd4sLp
         cu+DK9LR3a43WMyeXyKOAoSlP6OmBGrYQmcch7OncIci5oPumgBGsDcUYo2uMR3Uc/EX
         BE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678818289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaq8T3LD9vAL2/LDrIWwh+yNCX+E4QMSUZ8Ql9Ca4Tw=;
        b=C9LBUBtwFwSq2FutKuQIhAV7sIF3G4Ag4lmeRbVn5U0jqB+d86dtWnBGkiP1vjWbcl
         ljWVLaHKAZyCmVv7BrNAm+oF/V/0Z3RHIFLbay27ShlvZ9P6Rf0EI/baeBCmULf622xa
         YXbp8LpcWlpTAuGMA7JowRP+aNcJ+a2Zth/MUSZ7sE33vX/5JFvY/wrlKEYeYpl6a1c5
         XDVxgN+sVdLmHC3epawx/ipxDgBjYtvrBHN2cDNk0d66ptEbdR9s5/qU3Y+F7/RLZ5lq
         tfFT60T7E9OzASqXZ2zaQVUhFdyfvpW/TEtANhysXpQHklDp9NNNIDYuzvOnTjMRKmkR
         +APA==
X-Gm-Message-State: AO0yUKXkVbYUkZ426V7uDJu20O3eZc3G/5i3xEaRBXQjekZwhhKsmduz
        Nbd2ZLalYv+UgeBFctKsShxwsgPlQlqAQkLq3a3KLg==
X-Google-Smtp-Source: AK7set84Y+fWQioUgBVpNMN5ukDIqdnzUYp07qj8tAk0NNtBVwDBD4GXeVbXDS9zEAG6n5KSJ6zZsxG4RYUeyJNNElM=
X-Received: by 2002:a81:ad63:0:b0:52a:9f66:80c6 with SMTP id
 l35-20020a81ad63000000b0052a9f6680c6mr25056198ywk.9.1678818288944; Tue, 14
 Mar 2023 11:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230314180020.2865734-1-u.kleine-koenig@pengutronix.de> <20230314180241.2865888-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230314180241.2865888-1-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 14 Mar 2023 19:24:37 +0100
Message-ID: <CACRpkdYp2XXb2OVr63q0piWGzuLzNzJrEDL_w-7inBbcy=KTdw@mail.gmail.com>
Subject: Re: [PATCH 3/3] hwspinlock: u8500: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Mar 14, 2023 at 7:02=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
