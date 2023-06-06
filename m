Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DDCC7EE24
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Jun 2023 06:27:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235219AbjFFG1l (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Jun 2023 02:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235227AbjFFG1X (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Jun 2023 02:27:23 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB1B0E7D
        for <linux-remoteproc@vger.kernel.org>; Mon,  5 Jun 2023 23:26:54 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-977d7bdde43so399531466b.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jun 2023 23:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686032813; x=1688624813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6wxrVFm3uxKrVhcM6cNylZEezUfkwf3bB/CCfQ7MBQA=;
        b=vHqFABLRlloYS2vYDirnyPAq9DT3msYXZfgn04oSVQKDzA/G2+KSJEMFhRPEXxqhZh
         LDhHS3uxyViq2v3U0+SxqYWUWNV/xPV5iLCu1sWqESJZn9ZAGuhZUgZXcJ3W1kiRb9ak
         DrpZtvbLnilDDGBZPiw8oMSbvqqUtv80iYbyRm697BXdyJWaJqjZDya1HXxVT1jZwjSn
         VAfR287yMEXL4lk/1xl/JCJqmQuIQQlaufgD9bFPkgf7NZiLWvI5phbLvhPhR3FFiaHr
         Yqtj/xsmcxXZRNlxIvSjJJx0s+GT+CKHf67oNOa+OYz0GbB81lpryNKOJttQz+lF5xBP
         2z4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686032813; x=1688624813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6wxrVFm3uxKrVhcM6cNylZEezUfkwf3bB/CCfQ7MBQA=;
        b=egu54VxO13YURALQCwftZ9vmJOPJkXDD1wtvEK6LvmP25tGp1NOVyhJqF0gTbM0b+2
         3RB3k6/TIfSyQVVaS5s03uRq7jJmWUmrIDXGjsBtqZhbKAr7uTrouO609C2p5ACcIaHI
         CHiH4rF1i1+JWniMmgkf1QTqwXSD0EJrlHVd0lHHlGnz2JbKFLF527Hb0cROqZQ4iXGk
         e9MuU0AfnAc9xwFzkR+0zP5ZH9oZHXs9JSr1UaUM6QhCPFrfPjhKh8bmMrLeYaNjyz7q
         9Y2NL3w5V9XnQMQmNCylYmvlXsvLa4/URC9/wNdS68ifMtHOUpfJTUSfIz4Afj/0cti8
         MjGw==
X-Gm-Message-State: AC+VfDxUAujE8N9Cowm7gC/r4WDLsGzBrHnAKrWcm+RITGYd+E1LSXYV
        Aly2I3oe9sX+cKk6oNauo9mgsg==
X-Google-Smtp-Source: ACHHUZ6kCEzeZmDlhGZEmLGfSgWrh5RZJmf8M8N4Z05UgimwYxeV+elAHbvgXQm/smi+b6fpPHYfaQ==
X-Received: by 2002:a17:907:9405:b0:973:93c3:16a1 with SMTP id dk5-20020a170907940500b0097393c316a1mr7006513ejc.19.1686032813342;
        Mon, 05 Jun 2023 23:26:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id l14-20020a1709060e0e00b009745eddf997sm5159120eji.198.2023.06.05.23.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 23:26:52 -0700 (PDT)
Message-ID: <a6df8c5a-cb7b-54a4-0b3b-6b97f16b7b70@linaro.org>
Date:   Tue, 6 Jun 2023 08:26:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 02/14] dt-bindings: soc: qcom: smd-rpm: Add MSM8909 to
 qcom,smd-channels
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230531-rpm-rproc-v1-0-e0a3b6de1f14@gerhold.net>
 <20230531-rpm-rproc-v1-2-e0a3b6de1f14@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531-rpm-rproc-v1-2-e0a3b6de1f14@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 05/06/2023 09:08, Stephan Gerhold wrote:
> MSM8909 is using qcom,smd-channels but is missing in the list, add it
> there as well.
> 
> Fixes: 709d473dd5e1 ("dt-bindings: soc: qcom: smd-rpm: Add MSM8909")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

