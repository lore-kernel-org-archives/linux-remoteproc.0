Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36409C43217
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Feb 2022 07:28:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241323AbiBNH2r (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 14 Feb 2022 02:28:47 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241291AbiBNH2q (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Feb 2022 02:28:46 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B95923205D
        for <linux-remoteproc@vger.kernel.org>; Sun, 13 Feb 2022 23:28:37 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 71DE94033C
        for <linux-remoteproc@vger.kernel.org>; Mon, 14 Feb 2022 07:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644823716;
        bh=stPjNYKT8jIgNyF2oAsLzVlTYEd+kLoCabs8ksrQu4Y=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=jMUvOorPXRbTgIjo4QR8OnJfJhD41D7iRu6JLBzukJQF1jiU2Y2nWVL+Q+iZnJjEn
         oWNg9FbFxvORs0j4MDeFe82rEJ0KZFXtSwXovnFPpjPw5sSOoFAKfKT9MZMdRBvabI
         Phf2HfAlqj8F6rO6e1oq6ujY983lW5M4U5tlrh1+fo52PPRqF80f2+WBiDDt2wGunr
         oBbctpjNdwymicPGTAD6qWgYxRvOf6xhvgw0Z4jjZvDgqaWftgi1KWWxdCn7ZTUYT3
         9EgTXrMlR/Sqepi8jx//r76tb7fysw2Fv1ngo6TqA2+TmAYYy2JBpCnL3T/stMMUYa
         xfDRnXpv8A9lg==
Received: by mail-ed1-f69.google.com with SMTP id d11-20020a50c88b000000b00410ba7a14acso1045986edh.6
        for <linux-remoteproc@vger.kernel.org>; Sun, 13 Feb 2022 23:28:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=stPjNYKT8jIgNyF2oAsLzVlTYEd+kLoCabs8ksrQu4Y=;
        b=ED5Bi2CuPXtdbwJmGpfAfV+N+cybxAl0V2R4wH/BLmm3nM2YXJ1jPW1FIqWQrkSUCY
         8Z9KSF1lQb0/7AGuMVTl/SyxjuPZGJCE6w0yhDByMbDOwuHjbRXKEjgE61HzDVVysvLz
         44ALL7W4qEA8E+sZ84N0iCMIjhZxqmRBPuXUPXbtwpqULK3yU8LUlQmZeDkuQLOooCwO
         GpQY0kV7a1Cr0I0n8Tf470ES0u0TaAULtY1EKTbqhTezIYq+PTRmk3NhmkieHJssZm4a
         gsg1BXUG340fQblJQtHTxVfGF6WAbDW+IJrxPOP/gEl64E5R8LpaaesE8m4xXltsWNGj
         5a/g==
X-Gm-Message-State: AOAM530pDUQGK/DGVv2TzhlDn3Yg+V7fcVyNaG2kXP8MtFZDyPklCB+L
        i1NRC6DpXcVs6a4LzRIq/XFIWvX/ChnAjuFdQxolk5UfdeVw/9SfmyZ8JQc9UaneYkuqTWsPRsT
        kC0LoPjbAUgX7tjQwu3/eNd20skK/bMJbcJt36IIlEZuVFNs=
X-Received: by 2002:a05:6402:51d2:: with SMTP id r18mr14335291edd.88.1644823715487;
        Sun, 13 Feb 2022 23:28:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzkInTRfFMDmTIqQtdD3PzZngKjB6pp383xOK8wNzWd9H/435n+6VZuhhh/TUUVZehlXzKrw==
X-Received: by 2002:a05:6402:51d2:: with SMTP id r18mr14335283edd.88.1644823715381;
        Sun, 13 Feb 2022 23:28:35 -0800 (PST)
Received: from [192.168.0.103] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id n2sm10098365ejl.86.2022.02.13.23.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Feb 2022 23:28:34 -0800 (PST)
Message-ID: <b7dad94f-4e59-cb4b-251d-05f747bb0862@canonical.com>
Date:   Mon, 14 Feb 2022 08:28:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] dt-bindings: remoteproc: qcom: Add interconnects
 property
Content-Language: en-US
To:     Sibi Sankar <quic_sibis@quicinc.com>, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, dianders@chromium.org, swboyd@chromium.org,
        mka@chromium.org
References: <1644813252-12897-1-git-send-email-quic_sibis@quicinc.com>
 <1644813252-12897-2-git-send-email-quic_sibis@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <1644813252-12897-2-git-send-email-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 14/02/2022 05:34, Sibi Sankar wrote:
> Add interconnects property to support the bandwidth requirements
> during modem bootup on SC7280 SoCs.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt   | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

There were several properties added within last months, so in total you
changed these bindings quite a lot. Please convert them to YAML.


Best regards,
Krzysztof
