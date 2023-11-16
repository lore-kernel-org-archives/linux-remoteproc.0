Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0259DC197A0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 16 Nov 2023 14:56:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbjKPO4K (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 16 Nov 2023 09:56:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbjKPO4J (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Nov 2023 09:56:09 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB0FB5
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Nov 2023 06:56:05 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c7c7544c78so12780331fa.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Nov 2023 06:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700146564; x=1700751364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BOjtDTqTnf7Djty8sAXJwD9eQx6I0vPmvqRRWr4Mj8Q=;
        b=dA+1bl5RKH8FyLKdcWrNPA9V01DmOEps6RX53cME6adgfXnZMEe6K8CahE8/FKKuA0
         wej/Dd5INNxh2VD0L6XaQQ2fyM748jJhYcqJAXHUT8pzbtjNFzI+YSZMAHlQ/6A+eyjc
         2NDpHLDKLBQiw8hMwWO6JuBG3iNIfWwV02GP0w4zPGhlRqgxSL+fjsqhmH/QYIt+kSzM
         579WOEYg8k2vjU9ba6uuXKF7T0A+dHT9n5o5BB7s6dQFzgTvrxLE4BJtHh7X3Ap9s7XE
         IdCGnEVHyLOcBYyzoUal7c0G4UDuCXwmVKN+RLBanH5lTJa2lCyGs4c/A4xqnWwFhRYB
         hvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700146564; x=1700751364;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BOjtDTqTnf7Djty8sAXJwD9eQx6I0vPmvqRRWr4Mj8Q=;
        b=s83dxkfIlVYuDFw/Tm7lCzUWcfU4YHoYtHnzzbSgVCa5NY+pDFpR0W4O76J6PTg0Z7
         pl0V5jWB/sYCJM91s6dz6+8GvyXwaw33nWXV1D7Aq6Gi+yDFn4pdpBoDxTcgYOPZqqQG
         XkPC9GbwCP5Umf0hg86+bgSuceXiG3pzCz9AGAArZi0nCCERzsR9FnqUWDzU+ors9iq9
         IVekvOhMqxanjPBT65AQO0HN19xvsQnUhjcwuDwZVE+LrGAiuWyioZwfde2LlXXUhTvB
         o4pyCUGLVEC60ZnPy/pDYcd0I0OJhQ5INNcBBJ+IJuFHc/eyYzc5uPpmCGLzTPhdNYLg
         e0uQ==
X-Gm-Message-State: AOJu0YyQNAeGUVP96ZXa+yYaC1Mtwto28wI7mDDsMjyZ4XgpXQJYkzV7
        BDFF9kSvsjv7vf4xJtka5PqdCQ==
X-Google-Smtp-Source: AGHT+IFDMYXqlEg+F4sWMGncBm04jorAZmXLffuWB4mSZRl9WUMnZsfBmoQ3Py0+VAOCD0Sg3r5ZvA==
X-Received: by 2002:ac2:54b9:0:b0:500:d4d9:25b5 with SMTP id w25-20020ac254b9000000b00500d4d925b5mr10759938lfk.56.1700146563658;
        Thu, 16 Nov 2023 06:56:03 -0800 (PST)
Received: from [172.30.204.128] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y2-20020a199142000000b00509463003e7sm17278lfj.186.2023.11.16.06.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 06:56:02 -0800 (PST)
Message-ID: <15792113-c54d-404c-b686-cc7c75ff542e@linaro.org>
Date:   Thu, 16 Nov 2023 15:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/11] remoteproc: qcom_q6v5_pas: Add SC7280 ADSP, CDSP
 & WPSS
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231113-sc7280-remoteprocs-v2-0-e5c5fd5268a7@fairphone.com>
 <20231113-sc7280-remoteprocs-v2-6-e5c5fd5268a7@fairphone.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231113-sc7280-remoteprocs-v2-6-e5c5fd5268a7@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 11/13/23 09:56, Luca Weiss wrote:
> Add support for the ADSP, CDSP and WPSS remoteprocs found on the SC7280
> SoC using the q6v5-pas driver.
> 
> This driver can be used on regular LA ("Linux Android") based releases,
> however the SC7280 ChromeOS devices need different driver support due to
> firmware differences.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
