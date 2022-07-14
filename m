Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2072ECCA486
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Jul 2022 09:57:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237945AbiGNJ5O (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Jul 2022 05:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237743AbiGNJ5L (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Jul 2022 05:57:11 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B77C04D4D5
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jul 2022 02:57:08 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id r9so1917633lfp.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Jul 2022 02:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Cf1LF8Vab+dY7VJTWbcxgMq68LX/pXHt6XyBNLlSZ8U=;
        b=Zb+ZYytslFRk9Zr/NvbIJxzu/w3Exst/RffVqjj9MPRI7aDfMvWHir5kElHWKgSfta
         BeAZadh4Hi+EgjC7tJpiP5f0YQcN/aQH0mFjvb5J9ky6Ry9UlbfzQdcxzeDVZnYgMk0T
         g76ats43ESyYlnDN801CWNbSOYkFiEKTILXWMXBwIm3NtbWnxvEfAJYXyqaqTDi0Ly2a
         kNSwG6Gdf5eKorC80TGpmkAfFMBWEO60KwPTKsrMJn7lN1PGI6Fcalu52j3qLmsiDwg6
         Eg0YEt1ztoJoqbtVPWU0CubnBulP0H7MH/i3bQmYBMbpFbjM3ij/gYjaSRqtKRJxPyt3
         3ZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Cf1LF8Vab+dY7VJTWbcxgMq68LX/pXHt6XyBNLlSZ8U=;
        b=dkVPTWLNl9B4PlTeXUAUuAHsoUdxVo6xBD9iYzmLaGpVwFQEFUwyzBfjy6b2Ba4APO
         IOz0TG1nHO5U3Cf29fKY3gs+T2JqyjUI1kkbFJaXz61SStSETNeqNHDDcXwiOdz6Muap
         /doIe99LlJHaBgMiz2Vj0L/qlt93MUyDUvDgu6KVyx54/ECCuQTj5D03B/BOw4DmxGj0
         R0MS4qHffWceVjqhoZsYVkJ0EnRxAqOH1KU3C9h/pLSQyIyKgAinfpj6QpHTZw5IQSCd
         pAqAHcYi+U9Pb1eaxBhK7QdHCjx/QvWJKX7Dkwe/5WVQdOk9WvcVgZeIrf00ItUNsYe4
         DWNQ==
X-Gm-Message-State: AJIora9iI1MzHs0fUPIJf7dyd8y+XwmwY6qNzTq7xIz+Iy+QnfmUkWUA
        0uh+23S5IGyc3trlHzSuJlhw3g==
X-Google-Smtp-Source: AGRyM1v35gjXIcUm58O+nImSrhqGlswJBjf195y+1fpEpk1WmKtj68FJRzAPGkL6NpdoqEo5R28NDw==
X-Received: by 2002:a05:6512:261f:b0:480:fd2b:23c8 with SMTP id bt31-20020a056512261f00b00480fd2b23c8mr4867180lfb.434.1657792626898;
        Thu, 14 Jul 2022 02:57:06 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id p4-20020a2ea4c4000000b0025d6c8cfafcsm195766ljm.93.2022.07.14.02.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 02:57:06 -0700 (PDT)
Message-ID: <52aa5027-6cf0-34dc-8583-2623f08dcf19@linaro.org>
Date:   Thu, 14 Jul 2022 11:57:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/6] dt-bindings: remoteproc: qcom,q6v5-pil: Add MSM8909
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
 <20220712124421.3129206-6-stephan.gerhold@kernkonzept.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712124421.3129206-6-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 12/07/2022 14:44, Stephan Gerhold wrote:
> Document the "qcom,msm8909-mss-pil" compatible for the modem remote
> processor on MSM8909. It is used pretty much exactly like the existing
> one for MSM8916.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
