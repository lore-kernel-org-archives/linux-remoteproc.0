Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F17EB8FD3
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Sep 2023 13:36:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235651AbjIFNgS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 6 Sep 2023 09:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235036AbjIFNgR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Sep 2023 09:36:17 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FE7E10D7
        for <linux-remoteproc@vger.kernel.org>; Wed,  6 Sep 2023 06:36:13 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9a63b2793ecso545612466b.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Sep 2023 06:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694007372; x=1694612172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4YeJdfBsGuG38QIaMG3D81Am+zjWthxqLI90JeDBQWY=;
        b=nrCtjxTJmAxhyzhiVpE1BAYUDQT/87006+ByFLtXNF3IoQN1OYkvffJjg428QOHfFb
         00wPMa37hS5f6qp3GDx3mkOI9sOrhQyn6C+8PZQp2e7trxku/4cEGbEQtfjUmiSxyyFd
         5nvd1gfMigx8tZDUjKixFzU9HqXfQNwltilfpaYH0m326lPoqb+1IJXXe3piKj3JOMW4
         +Wdf8LTDPoaN7MxRV4An4SL/DeTF4Mfbx+aOgC/Mx1PYEf6QkcYbiDA+JcRZkIJA7vEn
         ENdhkRpoQ25TDzjGFTKF1f+AIoftFMuwPBKHwUbTO2Z9SWE5m07v7aHAVkpZ6kobXmZT
         0sHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694007372; x=1694612172;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4YeJdfBsGuG38QIaMG3D81Am+zjWthxqLI90JeDBQWY=;
        b=C04bnW1BZ0uVh0hl/76RLFHRcOpPjVuknSH6lNlXhom4u2pg7cpUOl8YtYgiZNYzap
         noXDs6x/3hLUhIMRfyJcxlqQ9QSzcCG07jKUwfOmr748OjlJ4R3561bqSSVsLH0GS5k1
         unAkYD6bu0z8WeSIDxEig0WzSNKBi0tdtQ6B4lt3uQv56J5e3+jhNHg0TnFL52HvLCMy
         pDey+LhzqdiQRU+Bgnzxm3G1OqbcRyqLLf0b42pLsEQkjX5OsXVzUXvJV7RQbKkv18SB
         vyEuYMFWbA1JBonBGDFvNZr8HXoqqsR3HU5bTSl0e/ERap9Y9GWpx7wUyGQ4+0EzPr+E
         hfOQ==
X-Gm-Message-State: AOJu0YzrmyBBemSAOVpBemDqeryWgYb8fq++b3tTbq1BN0X33o7TUxMr
        /zqVkL+mLcgXL0GCe0fQ3DrMmQ==
X-Google-Smtp-Source: AGHT+IE18RP4EAL8GbJgmyx98KCFFOte9tIG5j6mqstNXYbuysnwJjezfRL61yJYYbIU0QZ9eHyvUA==
X-Received: by 2002:a17:907:2cd8:b0:9a1:fe9c:eee5 with SMTP id hg24-20020a1709072cd800b009a1fe9ceee5mr2463749ejc.63.1694007372117;
        Wed, 06 Sep 2023 06:36:12 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id c11-20020a170906924b00b009929ab17be0sm9017351ejx.162.2023.09.06.06.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 06:36:11 -0700 (PDT)
Message-ID: <4202b582-c0a0-ce13-7561-f5185fe1930a@linaro.org>
Date:   Wed, 6 Sep 2023 15:36:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc7180: Add ADSP
Content-Language: en-US
To:     Nikita Travkin <nikita@trvn.ru>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     David Wronek <davidwronek@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230905-sc7180-adsp-rproc-v2-0-8ab7f299600a@trvn.ru>
 <20230905-sc7180-adsp-rproc-v2-4-8ab7f299600a@trvn.ru>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230905-sc7180-adsp-rproc-v2-4-8ab7f299600a@trvn.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 05/09/2023 12:41, Nikita Travkin wrote:
> sc7180 has an ADSP remoteproc that exclusively controls the audio
> hardware on devices that use Qualcomm firmware.


> +					q6afe: service@4 {
> +						compatible = "qcom,q6afe";
> +						reg = <APR_SVC_AFE>;
> +						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +
> +						q6afedai: dais {
> +							compatible = "qcom,q6afe-dais";
> +							#address-cells = <1>;
> +							#size-cells = <0>;
> +							#sound-dai-cells = <1>;
> +						};
> +
> +						q6afecc: cc {


No improvements.

You need to add ADSP to your board and then test it. Otherwise you won't
see errors and we do not want incorrect, even if disabled, nodes in DTSI.

Best regards,
Krzysztof

