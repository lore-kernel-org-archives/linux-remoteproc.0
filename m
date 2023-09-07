Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2EBEC875A
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Sep 2023 20:13:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbjIGUNb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 7 Sep 2023 16:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjIGUNa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 7 Sep 2023 16:13:30 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA571BCE
        for <linux-remoteproc@vger.kernel.org>; Thu,  7 Sep 2023 13:13:26 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-501cba1ec0aso2263693e87.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Sep 2023 13:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694117604; x=1694722404; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AofgTSeTaSoX+KT+4pbt9cKca7D17Cr26/O66nz9q7c=;
        b=hDjc51ia5wFv/7FthnO6trGz1BbXY+BxQh+MvP2ag95BiNPEb9pcZMKIZr9XgAFBG8
         WYAGUSJFIcImEI53PmWm/thE4+UPcCGA3mJVm927JPRFetpFoEbZIS9xQx6zoFXHmjv+
         HVUCRrCkzrXgy59XYum1LiJx3dFBdhbkC+nl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694117604; x=1694722404;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AofgTSeTaSoX+KT+4pbt9cKca7D17Cr26/O66nz9q7c=;
        b=PkQ20RhcyqAvgbGEFJXYPJj8bSYp8wutCRD+8rSJ6nlBOZwH2e6l5S+9BrEC0+H9mP
         Li+EriVW7ICvN32gP4l0BG6obYM8XsB/HEBospi2GlArv9TCtkTGE54ZDBaeeEdVXqdP
         G6moSNL7fEx33MLWrwYWA88OvuogtHE00Y3lxdrDI9uawFp87jYVpMnfIr8aMzIdPlJF
         jheMngIXLDunU97ys/KEwol3fm+W7LKhQIylN/jr8bUICo1wtRLkx0psa2Nbn9GsHq3f
         gTJsbIWlvs3G/WAgw5kR8cVS+mXjyfX0v2LBAU0mA+bqrvco/ZvPbscPZt4Rp3jiIjFu
         tBMA==
X-Gm-Message-State: AOJu0Yw9eDl3MB75yJx8bc7fIzq0ay1mDOPAjfy8zOonSbBM8dN40Gj5
        woqDseiL0AjmzZVexiU4srt2Fj+OEZF2iuDWEv3vVw==
X-Google-Smtp-Source: AGHT+IE0nBqvLlzYBmzwnOanK7KrWaQfrYJYXlchR9O/niIGQWvx9APP+f5nRQPun2bUpLU5Sbbe6CORNiT8eH9AyJE=
X-Received: by 2002:a05:6512:3f12:b0:500:ae85:726a with SMTP id
 y18-20020a0565123f1200b00500ae85726amr368142lfa.50.1694117604597; Thu, 07 Sep
 2023 13:13:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Sep 2023 13:13:24 -0700
MIME-Version: 1.0
In-Reply-To: <20230907-sc7180-adsp-rproc-v3-3-6515c3fbe0a3@trvn.ru>
References: <20230907-sc7180-adsp-rproc-v3-0-6515c3fbe0a3@trvn.ru> <20230907-sc7180-adsp-rproc-v3-3-6515c3fbe0a3@trvn.ru>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 7 Sep 2023 13:13:24 -0700
Message-ID: <CAE-0n51x=PyyJQQV7TXxtEOSFLVC0NxyY9_YE9Tqjiqur9ODhg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sc7180: Add tertiary mi2s pinctrl
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Nikita Travkin <nikita@trvn.ru>,
        Rob Herring <robh+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     David Wronek <davidwronek@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting 'Nikita Travkin' via cros-qcom-dts-watchers (2023-09-07 03:02:36)
> Some devices use tertiary mi2s to connect external audio codec.
> Add it near the other two i2s pinctrl definitions so the devices don't
> have to duplicate it.
>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
