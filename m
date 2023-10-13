Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF6CCDB47E
	for <linux-remoteproc@archiver.kernel.org>; Fri, 13 Oct 2023 20:37:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjJMUhP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 13 Oct 2023 16:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjJMUhP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 13 Oct 2023 16:37:15 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC7183
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Oct 2023 13:37:13 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-32d569e73acso2279206f8f.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Oct 2023 13:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697229431; x=1697834231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGqNMQJoTKDExVF5LTm0ABt03qpcjjaRQIb4oBXXpL8=;
        b=HwHiVS18UclmDwQ/0Pmhoqo3RlKq/DNKjDmzkq/WDb01LMW9sCPduIiQqNwgABUAyw
         ev7pGWFCJ6FxICDKZBiG9gioai80lRyATWbZdCtbAsZDpSdOFLxdRYqKBcIT254UPDRI
         zlR2fLV+ziSLkL2kWJK4WnhAafO6HsbUc2o6Qp6MMV4LLRVmDNv7VJ8JG4RoncRPq9X+
         Y7Z2XJdX+ured4BfzT7jVdd06fpbvrqETPyK8QFr1jKeqN5nSTTIZ2aY7S7p/KwGDcZa
         E9ZIjvu65CVwHebuHFfJydo+tuOcI152wXUca8L+ICMYKc85VexBSskcZ4qPx34pxd5E
         R/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697229431; x=1697834231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGqNMQJoTKDExVF5LTm0ABt03qpcjjaRQIb4oBXXpL8=;
        b=Zueik8S+8MDVZpIJCpC0Bq1ASv1PMd+q+ztoXHgepXK2xSMsaL1MASDbrGX7jAsugM
         9q4N+bEh1kycEoUwLhsZBbSaXHvNhpW5aLaG4ZS0wGRR0hfO9T9gVgdHmcPsDiObutwl
         R0XmJetBpT6wDlEtnprrR5borFi40uCiUPx8U2jwLqCr+/wDwIx5fSANzhdTOy6oxb8g
         yGde+3UBMakHjuspSqmGnplfqearb2/FczVuBWVCBksfZETr2V8ZKhTAbc8teC/tDOCa
         aZuGTWLn14ion11M0yEMZv+tyyiOSoluX9idvcf996dMLlPREoACq5wG4CRGa8gfrt0r
         rPhw==
X-Gm-Message-State: AOJu0YwZWhabqcRCl2wgr/Y2CBdaP5ZkUrnqUy2qOpRIc3W10d4YR2An
        2pXA8FvujcQS2lTajsnpdshJ2oSbGUv9V937ZTSCjA==
X-Google-Smtp-Source: AGHT+IF+7IiJEEKizdMeYQJowMnFRLsMOiRhCWVvtDSSbLN5+4n2cIdYTg5MU1RI1Xr336Wc5nGpjJB2bTesb2OZQ6w=
X-Received: by 2002:a05:6000:1e11:b0:32d:8357:42dd with SMTP id
 bj17-20020a0560001e1100b0032d835742ddmr10781479wrb.68.1697229431471; Fri, 13
 Oct 2023 13:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231012-st_remoteproc-fix-sometimes-uninit-v1-1-f64d0f2d5b37@kernel.org>
In-Reply-To: <20231012-st_remoteproc-fix-sometimes-uninit-v1-1-f64d0f2d5b37@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 13 Oct 2023 13:36:59 -0700
Message-ID: <CAKwvOdnGDXvbCgPFq+DZxaMo-ptdq7omXJyLVgwgFeKh5RwdTg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: st: Fix sometimes uninitialized ret in st_rproc_probe()
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     patrice.chotard@foss.st.com, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, trix@redhat.com,
        linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, llvm@lists.linux.dev,
        patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Oct 12, 2023 at 10:04=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> Clang warns (or errors with CONFIG_WERROR=3Dy):
>
>   drivers/remoteproc/st_remoteproc.c:357:6: error: variable 'ret' is used=
 uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uniniti=
alized]
>     357 |         if (!ddata->config)
>         |             ^~~~~~~~~~~~~~
>   drivers/remoteproc/st_remoteproc.c:442:9: note: uninitialized use occur=
s here
>     442 |         return ret;
>         |                ^~~
>   drivers/remoteproc/st_remoteproc.c:357:2: note: remove the 'if' if its =
condition is always false
>     357 |         if (!ddata->config)
>         |         ^~~~~~~~~~~~~~~~~~~
>     358 |                 goto free_rproc;
>         |                 ~~~~~~~~~~~~~~~
>   drivers/remoteproc/st_remoteproc.c:348:9: note: initialize the variable=
 'ret' to silence this warning
>     348 |         int ret, i;
>         |                ^
>         |                 =3D 0
>   1 error generated.
>
> Set ret to -ENODEV, which seems to be a standard return code when
> device_get_match_data() returns NULL.
>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1944
> Fixes: 5c77ebcd05ac ("remoteproc: st: Use device_get_match_data()")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/remoteproc/st_remoteproc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_r=
emoteproc.c
> index b0638f984842..cb163766c56d 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -354,8 +354,10 @@ static int st_rproc_probe(struct platform_device *pd=
ev)
>         rproc->has_iommu =3D false;
>         ddata =3D rproc->priv;
>         ddata->config =3D (struct st_rproc_config *)device_get_match_data=
(dev);
> -       if (!ddata->config)
> +       if (!ddata->config) {
> +               ret =3D -ENODEV;
>                 goto free_rproc;
> +       }
>
>         platform_set_drvdata(pdev, rproc);
>
>
> ---
> base-commit: 5c77ebcd05acf3789949c8a387df72381d949ca2
> change-id: 20231012-st_remoteproc-fix-sometimes-uninit-7aff1bdb7349
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>


--=20
Thanks,
~Nick Desaulniers
