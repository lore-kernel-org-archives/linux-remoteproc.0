Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BEFC433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 25 Jan 2021 18:19:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1A8922D04
	for <linux-remoteproc@archiver.kernel.org>; Mon, 25 Jan 2021 18:19:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbhAYSSy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 25 Jan 2021 13:18:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731158AbhAYRwT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 25 Jan 2021 12:52:19 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12793C06178A
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 Jan 2021 09:51:38 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id c12so13877349wrc.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 Jan 2021 09:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=0snvcNaYNGpV/k+7WdqZD7n4s15hYF8lRKnrHcT9zcs=;
        b=BtcA8Bf0tWpg53PhU7aSoui0E3BpWfWCGjqofDJ+lP3yBnl5dwdung0WUSxXzvTvA6
         WTu0tUvkwAXT3Cq0iMGsPbfl59hMfy9/EW2erNyZaTvlylVVwGwXwBqddWaBT3BIrZSZ
         szt2OKUvwyMX7g2nAaDniEzmcScpvK2uXK2FUX/B8kO35o/a5Bx7cLy+XFV68farduPZ
         RXmB0aaZMFxEo1a+abC3GeeawXzwnaq7G2FLyEvxRjdRPrR8idbR1k+RyOJQe84ZOVJH
         Eu6mnLruo8fA0Wi+cgYcDCt2WXKASkVR4Nkm0uuXK0BOtazXaqSUOfOkCWKMVpzE2dNl
         +dLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=0snvcNaYNGpV/k+7WdqZD7n4s15hYF8lRKnrHcT9zcs=;
        b=fvfxefKARIWSs7eS4vbojCUXm1P6PNyrj6hdH6NTcqKfee2Ttc/BpqjwlwCJieuCka
         OY/u5nOm938ShN6T4QrPAji/KADgdXq6gJWiWUwLAVfQ9Gwk2YWFwj0NqcKYDhGAleNa
         9mgsVdeOIzVbyQLHkNU8iU+aEHn7eRM/eGbk9B5dEAFKT6dvcJt/iXh8uV2jU/SnzUsy
         NenreUdonUWByxzvWzWGTy5LEpnKAw0lls2Fcw+pfI31i2DCEOnD4TL5ShszzRpeMsPA
         1+x47Xy8yDu3/9nZkVR34nqCqYkm2Z8xLSWPlKpXibo7zNPfFWVbnmW5sEO/1okYt52C
         JJhQ==
X-Gm-Message-State: AOAM533+QsrDMRl3ahKb5lKOWcxbJOfc9NJmxlcU1cyobJ4GKG1C6JWp
        MoEIY6kBAsZFqcaxDMlPsnCm5A==
X-Google-Smtp-Source: ABdhPJzfEafFozbxGGxAYvRjvaBNZaQlhERyvwak6AebaeXwdOrGAa45QDqKfniSaEX6MY+MkoOeMg==
X-Received: by 2002:a5d:6a01:: with SMTP id m1mr2243274wru.318.1611597096632;
        Mon, 25 Jan 2021 09:51:36 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id r124sm62707wmr.16.2021.01.25.09.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 09:51:35 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc:     ohad@wizery.com, devicetree@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/5] Amlogic Meson Always-On ARC remote-processor
 support
In-Reply-To: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
References: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
Date:   Mon, 25 Jan 2021 09:51:33 -0800
Message-ID: <7hmtwwx5ui.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Amlogic Meson6/8/8b/8m2 come with an ARC core in the Always-On (AO)
> power-domain. This is typically used for waking up the ARM CPU after
> powering it down for system suspend.
>
> The exact ARC core used on Meson6 and earlier is not known. I believe
> it is an ARC625, but I am not sure about this. Meson8/8b/8m2 uses an
> ARC EM4 core.
> They all have in common that they use a section of the SoCs SRAM for
> running code on the ARC core.
>
> Unfortunately there's no information about the remote-processor control
> registers in the public Meson8b (S805) datasheet. All information is
> either taken from Amlogic's 3.10 kernel and 2011-03 u-boot or found by
> testing (for example the clock input is not mentioned anywhere in the
> reference code, but disabling it stops the AO ARC core from working).
>
> This series consists of five patches:
>  1: dt-bindings for the SRAM section
>  2: dt-bindings for the SECBUS2 syscon region which contains a few
>     bits for controlling this remote processor
>  3: dt-bindings for the AO ARC remote processor
>  4: the driver for booting code on the AO ARC remote processor
>  5: (only included for documentation purposes) dts changes (these will
>     be re-sent separately)
>
> Patches #3 and #4 should go through the remoteproc tree. Patches #1
> and #2 may go through Rob's (devicetree) tree, Kevin's linux-amlogic
> tree or through the remoteproc tree. Personally I have no preference
> here.
>
> To test this series I ported the Amlogic serial driver and added the
> board files for the Amlogic AO ARC EM4 to the Zephyr RTOS. The code can
> be found here: [0] (the resulting zephyr.elf can then be loaded as
> remote-processor firmware from Linux).
>
>
> Changes since v1 at [1]:
> - fixed yamllint warnings (after installing the package these now also
>   show up on my build machine) in patches #2 and #3. Thanks for the
>   hint Rob
> - dropped the explicit "select" statement from the dt-bindings in patch
>   #2 as suggested by Rob (thanks)
>
>
> [0] https://github.com/xdarklight/zephyr-rtos/commits/amlogic_ao_em4-20201229
> [1] https://patchwork.kernel.org/project/linux-amlogic/list/?series=407349
>
>
> Martin Blumenstingl (5):
>   dt-bindings: sram: Add compatible strings for the Meson AO ARC SRAM
>   dt-bindings: Amlogic: add the documentation for the SECBUS2 registers
>   dt-bindings: remoteproc: Add the documentation for Meson AO ARC rproc
>   remoteproc: meson-mx-ao-arc: Add a driver for the AO ARC remote
>     procesor
>   ARM: dts: meson: add the AO ARC remote processor

Patches 1-2, 5 queued for v5.12 via the amlogic tree.

Kevin
