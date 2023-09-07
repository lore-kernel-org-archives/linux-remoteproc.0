Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ECE7EC875A
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Sep 2023 20:12:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbjIGUMj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 7 Sep 2023 16:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235953AbjIGUMj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 7 Sep 2023 16:12:39 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60C531BD0
        for <linux-remoteproc@vger.kernel.org>; Thu,  7 Sep 2023 13:12:32 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-500760b296aso1624881e87.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Sep 2023 13:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694117550; x=1694722350; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0OzdoyxvJqnt0X/MLtK9t9ag9mUPB3FEdS4awuCVyWs=;
        b=NLsPI7z9korrprdzTCziyHnKlHsGdmXE4DeR/YfCGS3l/otKTZuJk35EIdE2DFl0zD
         zz2iVdNnI2XtrBg8aSHakWn9Hhegt0oaDt14Vc0UYQ6tlK1wEHI5wDw3Ow+j+82Gda4z
         u1yhVfo+EkqsTCpW9ZLFAMKIAL6QsEpsiwcuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694117550; x=1694722350;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OzdoyxvJqnt0X/MLtK9t9ag9mUPB3FEdS4awuCVyWs=;
        b=VF30Od4Aj09O3KF3c6QTZMWft4/6OBRfFZBhJf4eZTGtLZ/CnuoRzvK59VBHFfkeeU
         B7IBvoXZ48eCtXYPW1gZE7pEIrbbxOvh060x0WqLG9+n6EdytEMv+qGeOH1foHJfJwTA
         CfXPR1fyiDeSRFSQDXyN+Sy4WuWpSdNb12JUiDe+zwtqF4rfcoQ5P+tZZSuAYyUaw3mU
         kwrzIKLbDsHkr0+Msd+wfIKJslJA/6Y+C09wBpTOSI4MCsQHaR44uG4GAQK232SEnjoA
         OaWk3vewB3s3GmvxDNu1U1dMedu1kY4Rk3BDf418hOGzyj5E/Agl7T78dfqdJc6I4QYD
         neqA==
X-Gm-Message-State: AOJu0YyXPUHWHiJNQrBuE4QRuxJ1odAUSBAGl+K1uTiBW7vTWHIxctJP
        kwBxMXWhQMGoOGFtScM+abJN4jRC8oeIU/EhwfVTdQ==
X-Google-Smtp-Source: AGHT+IE58pxdwnk+q61OGo1Vs5mrxztbFXRaTjctkUGKBiGBYSFdNnhcqHgRLdOxP+YZlA+MwbTFxFblkrUmS0Twt3A=
X-Received: by 2002:a05:6512:398f:b0:4fb:7624:85a5 with SMTP id
 j15-20020a056512398f00b004fb762485a5mr198955lfu.0.1694117550551; Thu, 07 Sep
 2023 13:12:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Sep 2023 13:12:30 -0700
MIME-Version: 1.0
In-Reply-To: <20230907-sc7180-adsp-rproc-v3-2-6515c3fbe0a3@trvn.ru>
References: <20230907-sc7180-adsp-rproc-v3-0-6515c3fbe0a3@trvn.ru> <20230907-sc7180-adsp-rproc-v3-2-6515c3fbe0a3@trvn.ru>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 7 Sep 2023 13:12:30 -0700
Message-ID: <CAE-0n50tAMunStumFjrUKn+mhRsX8n5oR11-9KKOGQfyFS6nuw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] remoteproc: qcom: pas: Add sc7180 adsp
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

Quoting 'Nikita Travkin' via cros-qcom-dts-watchers (2023-09-07 03:02:35)
> sc7180 has a dedicated ADSP similar to the one found in sm8250.
> Add it's compatible to the driver reusing the existing config so
> the devices that use the adsp can probe it.
>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
