Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2935EC43334
	for <linux-remoteproc@archiver.kernel.org>; Sun,  3 Jul 2022 11:01:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232329AbiGCLBJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 3 Jul 2022 07:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232312AbiGCLBI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 3 Jul 2022 07:01:08 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B807F65DD
        for <linux-remoteproc@vger.kernel.org>; Sun,  3 Jul 2022 04:01:06 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id b23so7725800ljh.7
        for <linux-remoteproc@vger.kernel.org>; Sun, 03 Jul 2022 04:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:user-agent:in-reply-to:references
         :message-id:mime-version:content-transfer-encoding;
        bh=iSMx4v4MQhT6LaqCu6U6c7zNkD8D78ZUh7uTaQEZQe8=;
        b=h+tAKs6MSik+OJIHdNju5BshaaATprQUaI5rsUjLCjovK7q03xMPHrlQjyFKVTDs+x
         Y46TTaGtw8XAgQnBojzrixlYB1tsxUDzwGZTxGHnK8opeMVlmUyTP3alcdt03zw+aiK3
         Ba8bAKXM4ZdJguOz1MxJViL3QeZejTQiGw/SGaps9d8ewnIMPO6NI/rCIx0staeQTpzD
         VTTvpartGrMyE0hOS+Emrg47hhrIO49l0imRXJ7AsVEfkpcitVPd4d4YoBRb+JecnZl+
         NuJFBTHd9M4PRH9mrB4q2oEGmOzYCqV0ZbIO2sXMTdLSKP/TLmSazl3DuTRfaH9h227K
         0tbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:user-agent:in-reply-to
         :references:message-id:mime-version:content-transfer-encoding;
        bh=iSMx4v4MQhT6LaqCu6U6c7zNkD8D78ZUh7uTaQEZQe8=;
        b=OtxOm4NugsEqN/hkH1TrDZCNwIKkr07YymmxCJY71Y8p7Ux5aPR6UlDleaOLO+eHQB
         GBui1S/UkOOeRC3Rtae4JdTF3+vXuJn/F2LT/qcGAWwtZ9fNXUQ+hDHMyJsSi/5xTXHu
         IXYqWfnyCN6eQB4/JGzYa1pWeFqPA7dUlGyg+XOjPxm8verKU/vDRnif6vXDKzjczywl
         NobUAUlOJV9/+FKkMkAl5f/wRf9ppSmzKKw4wjzlIgBzclYtKbkrWTTYwFnYYl8J1QtU
         /VKRrS8QuC/7AqGvgTSZjdUppeUKJqPqWKslZ/12QsWHdxzNJmy8NJenJhYqf1CzOLjt
         0yZg==
X-Gm-Message-State: AJIora+JLdXfycuprkxvshaJMY3Y4VYyk4yE3O2QH61TaKJJa5GaJWas
        pWIlO8Ltx9oZtR7OeMR3b8tNsQ==
X-Google-Smtp-Source: AGRyM1sOraTGWkKfkpbrBKpXmppWtOz5jfeiEuJV2YD2yKY84I8jDUXSTpFArHSmuFmb0CgpAloIRA==
X-Received: by 2002:a2e:3507:0:b0:25b:2e3c:bb6 with SMTP id z7-20020a2e3507000000b0025b2e3c0bb6mr13765501ljz.393.1656846065077;
        Sun, 03 Jul 2022 04:01:05 -0700 (PDT)
Received: from [127.0.0.1] ([188.162.64.125])
        by smtp.gmail.com with ESMTPSA id k6-20020ac257c6000000b0047fa02cd96csm4650408lfo.162.2022.07.03.04.01.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Jul 2022 04:01:04 -0700 (PDT)
Date:   Sun, 03 Jul 2022 14:00:58 +0300
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_3/4=5D_remoteproc=3A_qcom=3A_q6v5-mss=3A_?= =?US-ASCII?Q?Add_support_for_SDM630/636/660_MSS_remoteproc?=
User-Agent: K-9 Mail for Android
In-Reply-To: <YsFrtn0X6ywJh6d3@gerhold.net>
References: <20220514000108.3070363-1-dmitry.baryshkov@linaro.org> <20220514000108.3070363-4-dmitry.baryshkov@linaro.org> <YsFrtn0X6ywJh6d3@gerhold.net>
Message-ID: <CE68B315-BB4C-4A77-BEDE-140784D337D2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 3 July 2022 13:13:51 GMT+03:00, Stephan Gerhold <stephan@gerhold=2Enet>=
 wrote:
>On Sat, May 14, 2022 at 03:01:07AM +0300, Dmitry Baryshkov wrote:
>> From: Konrad Dybcio <konradybcio@gmail=2Ecom>
>>=20
>> This adds support for sdm630/636/660 modem subsystem
>> remote processor=2E
>>=20
>> Signed-off-by: Konrad Dybcio <konradybcio@gmail=2Ecom>
>> [DB: fixed commit message, removed note about modem restarting regularl=
y]
>> Signed-off-by: Dmitry Baryshkov <dmitry=2Ebaryshkov@linaro=2Eorg>
>
>I was only looking at this by coincidence recently but since it doesn't
>seem to be applied yet(?) some comments below=2E

Thanks for your comments, I will take a look next week=2E

>
>> ---
>>  drivers/remoteproc/qcom_q6v5_mss=2Ec | 111 +++++++++++++++++++++++++++=
++
>>  1 file changed, 111 insertions(+)
>>=20
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss=2Ec b/drivers/remoteproc/=
qcom_q6v5_mss=2Ec
>> index af217de75e4d=2E=2E7a4cca30db8a 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss=2Ec
>> +++ b/drivers/remoteproc/qcom_q6v5_mss=2Ec
>[=2E=2E=2E]
>> +		}
>> +
>>  		/* Remove word line clamp */
>>  		val =3D readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>>  		val &=3D ~QDSP6v56_CLAMP_WL;
>
>All in all this looks almost exactly like the existing code for
>MSS_MSM8996/8=2E Wouldn't it be cleaner to just add an if statement for
>the QDSP6V62SS_BHS_STATUS readl_poll_timeout() to the existing code?

For quite some time I was unhappy with this part of the mss driver=2E Mayb=
e it's time to review platform-specific code in attempt to generalise it=2E

--=20
With best wishes
Dmitry
