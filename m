Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0602DC77B7F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 May 2023 19:40:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232746AbjEHTkG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 May 2023 15:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjEHTkE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 May 2023 15:40:04 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E2F59DA
        for <linux-remoteproc@vger.kernel.org>; Mon,  8 May 2023 12:40:02 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-965ddb2093bso626365166b.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 08 May 2023 12:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1683574801; x=1686166801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/FUv0s0uxGOAEhAmizPOK6LOstZe+HzXc28uj+u2tI=;
        b=rPYVxJN48NAgnAnIvAKenwk4IOJ2RDZX29vdTvwYD2TokVD6CVXdI9lEegiucUrQWG
         dKdyA0vD/Ak2Q2zY55nXUUSUyExOhlv3mOFTU/uGoqmECd7WednDRMz7nuGMs9HcAInb
         Je1mBQK1UFWkjwEczcLajJP7TyYVQeJrPEwzfSFeKjY6T4PJV6R1H/GxTJlsS0MY4Xv6
         WK1TlZAI/hUlAehA+erdkjD3TN67TmX9q3LL3iCGZaQl1FQQImbhcyoPowenU5zhmxwc
         AW/WS00jX20tZzN2/Vfk76oOLD7bw3W961Hbjz8ViyZ36/oKB8iiaZcJtjCvHjMrWMG0
         6PTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683574801; x=1686166801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/FUv0s0uxGOAEhAmizPOK6LOstZe+HzXc28uj+u2tI=;
        b=ikENjhFQjDxuzhWBN581qTwCT09sby7/dKWOSfyU2PmfrFL05rOfDu3j/CJcLLv64U
         Xzb7+0MslK/oBZqWk1hx7cCYyVlEkuQBvmkmSNomKauC/kOg529aMeisYlPguD3sWxco
         6YLfLptbMtjLZYtFpZ67XePhvOG44L/pbxh4OioJQsfbofK0VoAoPVH8VFpKfRQ+UeQn
         Ac3q0zGeQd4EEHfcgLl1bjLweYOTJZVQYfygWAwOkCu/0aO/37sD8nh4ppnQ2f/zBtbV
         2HQZX5jls5HoPWHFtZ55+0ebfAg/NILa6C3F6zdWjXPzeLSerNnarVI/qMTlRVpVeOw6
         pUAA==
X-Gm-Message-State: AC+VfDyR75equkKV66On8mvISuzh1mguucfE++Mg9tt6NeQQvwPeW8tx
        c5m3wA9iuIw7ALqNQ4400iYt0F8CNJSdXAXkLZI=
X-Google-Smtp-Source: ACHHUZ7xPFOdR0tu9mLlwmC+xFOOyeEbdUwJPYjFROE9r2zYYk1YPkHxLUtmMG5BOLBzXOg5K00p5UDNukR5SMrJ0/M=
X-Received: by 2002:a17:907:3686:b0:965:fa3b:7478 with SMTP id
 bi6-20020a170907368600b00965fa3b7478mr8997027ejc.53.1683574800982; Mon, 08
 May 2023 12:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de> <20230504194453.1150368-6-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230504194453.1150368-6-u.kleine-koenig@pengutronix.de>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 8 May 2023 21:39:50 +0200
Message-ID: <CAFBinCBXvhRbqDRxH1D29Ua1zTmVR+tqtzJWpyQ9upLX9RhLYA@mail.gmail.com>
Subject: Re: [PATCH 05/18] remoteproc: meson_mx_ao_arc: Convert to platform
 remove callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, May 4, 2023 at 9:45=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
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
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
