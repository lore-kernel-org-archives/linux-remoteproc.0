Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B826ECAAA1
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Sep 2022 10:58:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233929AbiIFK6F (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Sep 2022 06:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233226AbiIFK6D (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Sep 2022 06:58:03 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 141035FF5D
        for <linux-remoteproc@vger.kernel.org>; Tue,  6 Sep 2022 03:58:02 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id bn9so11846619ljb.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 06 Sep 2022 03:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ORguQGJ+jcnqw8eowE0KKiCcX55E0FSXFsOOApHEpOM=;
        b=U68Zh9mQBLzfJSdNR58ymOgPj/T4+G/zPlnyNdI/nsm3+1yMhbcmP9xrqAP3k3Xc+t
         4IV9tCu2U9nBjgB0WNJbhmSuUd2omplTLqSUH+FG7OUD2mcrt03QINczFmQvuSHdFgn5
         ngnf1ke/CQYXyBPlN7VCr5YWXXiUFXAtjaLXGB5D5uawKSwDNnZeOXAAC+ET+t9dzKYU
         Pgz5Raxph4iLk2qqrfXPPMEkCK1ZLTI1H5R4NjODKXkWuyKDhkZHQnGvuJjvlRtFFc7b
         cPOi4rwoqmiTZRtTk20f/ryqQomOAMIv++52KXlKxVk5VZdWI2Uy1b9lBTIxXAQyvClU
         7w9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ORguQGJ+jcnqw8eowE0KKiCcX55E0FSXFsOOApHEpOM=;
        b=pX6jaf5p1sPEYO1uGLyex0wlqJR1t39940Asokn/Mi0b2xOC6bf5U6SBpvUMCBp8U2
         /iCEPgU+tQ2jM3Q06Nw62bX47/HkpBhxVZ1Oi3fngUCeMp9gtg7Tg2b+5CuVHdrMRkJ7
         rt3Dby6sE8A8acYKbXFH1VVVzsWv4WWiHUiwl0nz7jNEbmSsiTTFW1AsmoW2K5kQY//O
         Ug/bWG485gVnRiuAr5zh7OHpv4Ncaa59R+B+YJ6fjcY3aFeIRDt2AkiiuuEKmU5ZfW/O
         84mcZr+WSNx8737egTDzOU8I7854FXUzPaUpSVxMT3OKD9bK1mRIVDKmu0UNaAc0v3us
         EzSQ==
X-Gm-Message-State: ACgBeo12SEwAopwHEa77CTcUs19AcqYsxEQskymTS+pcbgLcHFtUPso4
        gwYanVs9KKWFCyw/7ILx4J/EAw==
X-Google-Smtp-Source: AA6agR7syjIYMu2DxjRvWa53god5653pNfvbu/mnSo4Wf8ca0qOupBU8ACKnZieein6B5857rZXlbA==
X-Received: by 2002:a2e:bc10:0:b0:267:b34a:52e6 with SMTP id b16-20020a2ebc10000000b00267b34a52e6mr10145748ljf.292.1662461880397;
        Tue, 06 Sep 2022 03:58:00 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a4-20020a056512200400b0048b193041easm1658504lfb.209.2022.09.06.03.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 03:57:59 -0700 (PDT)
Message-ID: <872bffe6-416e-0d15-5994-0cf80c2063b4@linaro.org>
Date:   Tue, 6 Sep 2022 12:57:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v9 2/2] MAINTAINERS: Update fastrpc documentation file
 from txt to yaml
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org
References: <20220906103055.2089519-1-abel.vesa@linaro.org>
 <20220906103055.2089519-2-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906103055.2089519-2-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 06/09/2022 12:30, Abel Vesa wrote:
> The documentation for fastrpc bingings is now YAML. So update the
> MAINTAINERS file.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Abel, I sent you two messages about this patch that it is not
bisectable. You did not respond to them, regarding maintainers entry, so
I don't know what to think.

This must be squashed.

Best regards,
Krzysztof
