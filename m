Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 522AAC38142
	for <linux-remoteproc@archiver.kernel.org>; Sat, 28 Jan 2023 10:21:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233971AbjA1KVt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 28 Jan 2023 05:21:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233018AbjA1KVs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 28 Jan 2023 05:21:48 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBAA972AE
        for <linux-remoteproc@vger.kernel.org>; Sat, 28 Jan 2023 02:21:46 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id m7so7049154wru.8
        for <linux-remoteproc@vger.kernel.org>; Sat, 28 Jan 2023 02:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KyK61PIIynqyzfMBCuw7rB8JAyotjQ6xTZX0sXTvwv4=;
        b=aKI/K7Rv941xqFlZ19JayXGiBsYMAlSpyJe9VmKmlpQNAInd1AjU1VlLuYYmCym/b5
         n7FEjWHH1hzLXKNB4BGFKA950L3HNQco+O0B7TmUI8zQSOmeXc8895k41hLsrQU34krD
         khQt2o05MdDWqYHgeanECTDWS1akJMh0GPMFDAix8uf09zGnk1YFW4+UcQcLGWil3B95
         nC9Piu/KtnLRVm5fPvqTXf+64WaBSiQHc56ti19SrN2IPRE5h+gPuYi/ELXRU5+LVIPx
         yCP87txSIyvuPME3WExIWG/TkRzoVAhMc0ZsGCbDp1NVuQp/ErSKcOZjFvIuWdN0lqXE
         hqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KyK61PIIynqyzfMBCuw7rB8JAyotjQ6xTZX0sXTvwv4=;
        b=c6DpVmCItHyQEjawf9BryqzjFZgrZgK5m0ZsuYFfQtkjUxA8evleCnwvUHm7e/BsIR
         aUj1zgBxAoh8ybOkMaO4U6xX80Evuz3s66CJ8j9hNCGykPH3Tm8r6pu5LwOfOWJRl6Dm
         NLzZEAsod8G+H3dQE4iVblYGsepraPf76StQKgXZwLTaiMEAMMZf1dDzVs3i7qd3Kzdw
         Ok1hPjbHP3HAH0PQ5V/8Es5D6JTc6gE/PwvcMkQcNQjD4IYx5XJ5sv2fP3+TD12EcUP6
         kdE9pLpn5f07+mxEMity+A0jHfu08qhrdLhYgsyKWnPyCcjlD9VjFYxRZUDinePyf/yL
         fNrQ==
X-Gm-Message-State: AO0yUKULYFGTIprYXiSUXdgwymi+Qs+aU3hZkmWa1VUOYU5trjX3JjH8
        sApA15h8jhGinBgQ8ktirPlkWQ==
X-Google-Smtp-Source: AK7set//WJfcsdQmnDUXUYzjIqHvzDXemfS6nhNxgE7JDvSqI2eYOResaLvFmYGXsKvGS1vDDCYfKQ==
X-Received: by 2002:a05:6000:1814:b0:2bf:c851:bf8c with SMTP id m20-20020a056000181400b002bfc851bf8cmr8363720wrh.48.1674901305408;
        Sat, 28 Jan 2023 02:21:45 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p17-20020a056000019100b002bddaea7a0bsm6148579wrx.57.2023.01.28.02.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jan 2023 02:21:45 -0800 (PST)
Message-ID: <3ecfbb0a-6c24-6d72-f9f7-5c9dc4a080b4@linaro.org>
Date:   Sat, 28 Jan 2023 11:21:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] dt-bindings: remoteproc: qcom: Add sm6115 pas yaml
 file
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     mani@kernel.org, mathieu.poirier@linaro.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
References: <20230128053504.2099620-1-bhupesh.sharma@linaro.org>
 <20230128053504.2099620-2-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230128053504.2099620-2-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 28/01/2023 06:35, Bhupesh Sharma wrote:
> This documents the aDSP, cDSP and MPSS DSPs present
> on the SM6115 SoC.

This should be patch #1 - before you start using compatibles.

Subject: drop second/last, redundant "yaml file". The "dt-bindings"
prefix is already stating that these are bindings and their expected format.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

