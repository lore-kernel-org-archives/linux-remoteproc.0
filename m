Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D934C6FA89
	for <linux-remoteproc@archiver.kernel.org>; Fri,  9 Sep 2022 16:47:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbiIIQrN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 9 Sep 2022 12:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbiIIQrL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 9 Sep 2022 12:47:11 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A191145FE8
        for <linux-remoteproc@vger.kernel.org>; Fri,  9 Sep 2022 09:47:09 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id bt10so3713123lfb.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 09 Sep 2022 09:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=bfzSyFF46ifX38zUWogpF3ZN9XCyY5YdKQPWMnyMhBA=;
        b=sJJTDn+167/60KxVXAwetrvS/mBKJoT3XImW/Vfc/qXtGFmQuTCRrLT/O/aQk9xAty
         joJ5DfSi0sNJKiOcAHDbpyBeCAye7jEbTFUE4mmN1n2vnpjdN2bzgptwDbH9fEpNSTie
         djeuXrjvicS9qrhZ2GQ21UavYKjxgd6l0/PqBcUrI3QFgT6M5Jqb5gPGB63Fj+wyS2rv
         io3d51+VcUDIjuVY81wCjgWCdbNSeU5dNY+t5gr8YV39A2Omp39aqSRLrPwy7K4UwvN1
         MRBHOMQNLP212iGcGosG3hkhW1nBRKSae0ILeutt4I7ANtl5OVk2OvBI0C3RgUqfQFDp
         a3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=bfzSyFF46ifX38zUWogpF3ZN9XCyY5YdKQPWMnyMhBA=;
        b=DcUfhxhjzAtp3A10FfSdcFb+GPYbgBFG5oyCFkF7oPJuq43n2o4JAhX3sh2M7eS2aE
         5UNUb9Wx5zRtd/QLHduqb2bWgu9XCHR0Yb5oBhKuPX0onMQ5X+/5pUbri5DPijkUvmcz
         AEAg6C8H1S5pUE+7dCM9td1rA7MAV1T56H8b9RpMoRu04yilWG1PFW0houRGc08+iVrp
         XUEKvPSxCE/KiQSBArwDWP0NNLTDMU4dKpu2GOv+0x6+VrL0IanvIAobO8wlixFB7O8v
         VQBKYpqFJfzGtX/bqtnfwPTwQmmSckXN4wiothNH+paorDwHlKosvax320Xag1g7j9Bz
         u6Mg==
X-Gm-Message-State: ACgBeo3AWF4D0RQejt5N9iFpL2huZCavG9e3kWSvyS95IB7YKKEm7PD6
        cP4XBGm1OzqRABaicVoaX9sD7Q==
X-Google-Smtp-Source: AA6agR7bcvO0BR4pZ0MnbFrfWtX1i6iP5cbbfLMKgpNbni1L64U+WaI1aRzDr1cdZOoKa1QjRfA80g==
X-Received: by 2002:a05:6512:310:b0:496:a0ca:1613 with SMTP id t16-20020a056512031000b00496a0ca1613mr5201154lfp.394.1662742028039;
        Fri, 09 Sep 2022 09:47:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c6-20020a197606000000b004947844e277sm142654lff.178.2022.09.09.09.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 09:47:07 -0700 (PDT)
Message-ID: <ded53a2a-e4ea-7675-d9c1-eb080e317b6c@linaro.org>
Date:   Fri, 9 Sep 2022 18:47:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,smd-edge: Add APR/FastRPC
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20220908181432.458900-1-stephan.gerhold@kernkonzept.com>
 <20220909161652.GA1448908-robh@kernel.org>
 <CAL_JsqKVb54yckiky79mK5FdEf-Vf7SyVU01Jdpo9whOqq0spQ@mail.gmail.com>
 <0b6f5b4b-247e-7573-04fd-05d037533aa3@linaro.org>
 <YxttwK1FMCMZ+CyS@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YxttwK1FMCMZ+CyS@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 09/09/2022 18:45, Stephan Gerhold wrote:
>>> And dropped for Krzysztof's series instead.
>>
>> Technically Stephan was first and his patch solves it in partial way,
>> yet still self-contained way. I am fine rebasing my patchset on top of it.
>>
> 
> Feel free to skip this patch if your series contains equivalent changes.
> I mainly submitted this to unblock my qcom,msm8916-mss-pil.yaml series
> so I'm fine as long as equivalent changes have been applied. :)

Thanks Stephan! Your work is much appreciated!

Best regards,
Krzysztof
